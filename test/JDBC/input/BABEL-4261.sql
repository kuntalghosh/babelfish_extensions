CREATE TABLE t1_babel4261 (a money);
GO

BEGIN TRAN BABEL4261_T1;
GO

ALTER TABLE t1_babel4261 SET (parallel_workers = 16);  -- note: this is PG syntax, not T-SQL
GO

-- The third parameter is true to set config back to default after transaction is committed
SELECT set_config('force_parallel_mode', '1', true)
SELECT set_config('parallel_setup_cost', '0', true)
SELECT set_config('parallel_tuple_cost', '0', true)
GO

--- INSERT SOME data into t1_babel4261
INSERT t1_babel4261 SELECT 0.4245*10000
INSERT t1_babel4261 SELECT 0.5234*10000
INSERT t1_babel4261 SELECT 0.1113*10000
INSERT t1_babel4261 SELECT 0.6732*10000
INSERT t1_babel4261 SELECT 0.3467*10000
INSERT t1_babel4261 SELECT 0.5213*10000
INSERT t1_babel4261 SELECT 0.9893*10000
INSERT t1_babel4261 SELECT 0.6034*10000
INSERT t1_babel4261 SELECT 0.3334*10000
INSERT t1_babel4261 SELECT 0.8888*10000
GO

SELECT sum(a) FROM t1_babel4261
SELECT sum(a) FROM t1_babel4261   -- should not crash
GO

-- Commiting sets force_parallel_mode, parallel_setup_cost, parallel_tuple_cost back to default
COMMIT TRAN BABEL4261_T1;
GO

DROP TABLE t1_babel4261;
GO
