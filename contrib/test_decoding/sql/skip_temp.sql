-- predictability
SET synchronous_commit = on;
SET timezone = 'America/New_York';

SELECT 'init' FROM pg_create_logical_replication_slot('regression_slot', 'test_decoding');

-- will print the temp table
CREATE TABLE skip_temp_test_1(ts TIMESTAMP);
INSERT INTO skip_temp_test_1 VALUES ('2016-06-22 19:10:25-07');
BEGIN;
ALTER TABLE skip_temp_test_1 ALTER COLUMN ts TYPE TIMESTAMPTZ;
COMMIT;
SELECT data FROM pg_logical_slot_get_changes('regression_slot', NULL, NULL, 'include-xids', '0', 'skip-temp-tables', '0');

-- will not print the temp table
CREATE TABLE skip_temp_test_2(ts TIMESTAMP);
INSERT INTO skip_temp_test_2 VALUES ('2016-06-22 19:10:25-07');
BEGIN;
ALTER TABLE skip_temp_test_2 ALTER COLUMN ts TYPE TIMESTAMPTZ;
COMMIT;
SELECT data FROM pg_logical_slot_get_changes('regression_slot', NULL, NULL, 'include-xids', '0', 'skip-temp-tables', '1');

SELECT pg_drop_replication_slot('regression_slot');
