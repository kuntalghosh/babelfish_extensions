-- enable CONTAINS
SELECT set_config('babelfishpg_tsql.escape_hatch_fulltext', 'ignore', 'false')
GO

-- Test sys.babelfish_fts_contains_pgconfig
SELECT * FROM fts_contains_pgconfig_v1
GO

-- Full syntax of CONTAINS: https://github.com/MicrosoftDocs/sql-docs/blob/live/docs/t-sql/queries/contains-transact-sql.md

-- test basic CONTAINS use: ... CONTAINS(col_name, <simple_term>) ...
-- <simple_term> ::= { word | "phrase" }
EXEC fts_contains_vu_prepare_p1 'love'
GO

EXEC fts_contains_vu_prepare_p1 'other'
GO

EXEC fts_contains_vu_prepare_p1 'arts'
GO

EXEC fts_contains_vu_prepare_p1 'performing'
GO

EXEC fts_contains_vu_prepare_p1 'performance'
GO

EXEC fts_contains_vu_prepare_p1 'quick'
GO

EXEC fts_contains_vu_prepare_p1 'grow'
GO

EXEC fts_contains_vu_prepare_p1 'actually'
GO

EXEC fts_contains_vu_prepare_p1 'helped'
GO

EXEC fts_contains_vu_prepare_p1 'version'
GO

EXEC fts_contains_vu_prepare_p1 '"come back"'
GO

EXEC fts_contains_vu_prepare_p1 '"much of the"'
GO

EXEC fts_contains_vu_prepare_p1 '"due to"'
GO

EXEC fts_contains_vu_prepare_p1 '"per cent"'
GO

EXEC fts_contains_vu_prepare_p1 '"so-called"'
GO


EXEC fts_contains_vu_prepare_p1 '"stand up"'
GO

EXEC fts_contains_vu_prepare_p1 '"every month"'
GO

EXEC fts_contains_vu_prepare_p1 '"as a result"'
GO

EXEC fts_contains_vu_prepare_p1 '"in Australia"'
GO

EXEC fts_contains_vu_prepare_p1 '"daily news"'
GO

EXEC fts_contains_vu_prepare_p1 '" daily"'
GO

EXEC fts_contains_vu_prepare_p1 '"daily "'
GO

EXEC fts_contains_vu_prepare_p1 ' "daily news"'
GO

EXEC fts_contains_vu_prepare_p1 '"daily news" '
GO

-- Prefix Term not supported
EXEC fts_contains_vu_prepare_p1 '"conf*"', 20
GO

-- Generation Term not supported
EXEC fts_contains_vu_prepare_p1 'FORMSOF(THESAURUS, love)'
GO