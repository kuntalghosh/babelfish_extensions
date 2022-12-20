#!/bin/sh

export usage="$(basename "$0") [-h] [-c commit] [-r repo][-m]\n
  -h    help\n
  -c    commit hash; Default commit:HEAD\n
  -t    tag; Format: BABEL_<number>_<number>_<number>"


while getopts hc:t: flag
do
    case "${flag}" in
        h) echo -e "Usage: $usage"
            exit;;
		c) commit=${OPTARG};;
        t) new=${OPTARG};;
    esac
done

# get current commit hash for tag if not provided
if [ -z "$commit" ]
then
	commit=$(git rev-parse HEAD)
fi

# get latest tag
t=$(git describe --tags `git rev-list --tags --max-count=1`)

# if tagname is not provided, fetch the latest tag and increment the patch
# version by 1.
if [ -z "$new" ]
then
	new=$(echo $t | sed -r 's/(BABEL_[0-9]+_[0-9]+_)([0-9]+)/echo "\1$((\2+1))"/ge')
fi

#validate tag format
if ! [[ "$new" =~ ^BABEL_[0-9]+_[0-9]+_[0-9]+ ]]
then
	echo "Invalid Tag format"
	exit 0
fi

tag_prefix=$(echo $t | sed -r 's/(BABEL_[0-9]+_[0-9]+_)([0-9]+)/echo "\1"/ge')
if ! [[ "$new" =~ "$tag_prefix"[0-9]+ ]]
then
	echo "Invalid Tag for the current branch"
	exit 0
fi

# get repo name from git
remote=$(git config --get remote.origin.url)
repo=$(basename $remote .git)

echo Creating tag $new for commit $commit
# POST a new ref to repo via Github API
#curl -s -X POST https://api.github.com/repos/$REPO_OWNER/$repo/git/refs \
#-H "Authorization: token $GITHUB_TOKEN" \
#-d @- << EOF
#{
#  "ref": "refs/tags/$new",
#  "sha": "$commit"
#}
#EOF
