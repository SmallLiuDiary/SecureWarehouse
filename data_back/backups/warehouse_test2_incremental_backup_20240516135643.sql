# The proper term is pseudo_replica_mode, but we use this compatibility alias
# to make the statement usable on server versions 8.0.24 and older.
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=1*/;
/*!50003 SET @OLD_COMPLETION_TYPE=@@COMPLETION_TYPE,COMPLETION_TYPE=0*/;
DELIMITER /*!*/;
# at 157
#240516 13:55:56 server id 1  end_log_pos 126 CRC32 0x5024f9af 	Start: binlog v 4, server v 8.0.35 created 240516 13:55:56
# Warning: this binlog is either in use or was not closed properly.
BINLOG '
7J9FZg8BAAAAegAAAH4AAAABAAQAOC4wLjM1AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAEwANAAgAAAAABAAEAAAAYgAEGggAAAAICAgCAAAACgoKKioAEjQA
CigAAa/5JFA=
'/*!*/;
# at 1113
#240516 13:56:10 server id 1  end_log_pos 1192 CRC32 0xd037b488 	Anonymous_GTID	last_committed=2	sequence_number=3	rbr_only=yes	original_committed_timestamp=1715838970125935	immediate_commit_timestamp=1715838970125935	transaction_length=504
/*!50718 SET TRANSACTION ISOLATION LEVEL READ COMMITTED*//*!*/;
# original_commit_timestamp=1715838970125935 (2024-05-16 13:56:10.125935 中国标准时间)
# immediate_commit_timestamp=1715838970125935 (2024-05-16 13:56:10.125935 中国标准时间)
/*!80001 SET @@session.original_commit_timestamp=1715838970125935*//*!*/;
/*!80014 SET @@session.original_server_version=80035*//*!*/;
/*!80014 SET @@session.immediate_server_version=80035*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 1192
#240516 13:56:10 server id 1  end_log_pos 1272 CRC32 0x82a71be6 	Query	thread_id=22	exec_time=0	error_code=0
SET TIMESTAMP=1715838970/*!*/;
SET @@session.pseudo_thread_id=22/*!*/;
SET @@session.foreign_key_checks=1, @@session.sql_auto_is_null=0, @@session.unique_checks=1, @@session.autocommit=1/*!*/;
SET @@session.sql_mode=1168113696/*!*/;
SET @@session.auto_increment_increment=1, @@session.auto_increment_offset=1/*!*/;
/*!\C utf8mb4 *//*!*/;
SET @@session.character_set_client=255,@@session.collation_connection=255,@@session.collation_server=255/*!*/;
SET @@session.lc_time_names=0/*!*/;
SET @@session.collation_database=DEFAULT/*!*/;
/*!80011 SET @@session.default_collation_for_utf8mb4=255*//*!*/;
BEGIN
/*!*/;
# at 1272
#240516 13:56:10 server id 1  end_log_pos 1356 CRC32 0xa85cc888 	Table_map: `history_warehouse`.`binlog_control` mapped to number 170
# has_generated_invisible_primary_key=0
# at 1356
#240516 13:56:10 server id 1  end_log_pos 1586 CRC32 0x0c220831 	Update_rows: table id 170 flags: STMT_END_F

BINLOG '
+p9FZhMBAAAAVAAAAEwFAAAAAKoAAAAAAAEAEWhpc3Rvcnlfd2FyZWhvdXNlAA5iaW5sb2dfY29u
dHJvbAADDw8IBPwD/AMGAQEAAgP8/wCIyFyo
+p9FZh8BAAAA5gAAADIGAAAAAKoAAAAAAAEAAgAD//8ADwB3YXJlaG91c2VfdGVzdDJFAEM6XFBy
b2dyYW1EYXRhXE15U1FMXE15U1FMIFNlcnZlciA4LjBcRGF0YVxMQVBUT1AtVUdBVUQzRDEtYmlu
LjAwMDIzMmECAAAAAAAAAA8Ad2FyZWhvdXNlX3Rlc3QyRQBDOlxQcm9ncmFtRGF0YVxNeVNRTFxN
eVNRTCBTZXJ2ZXIgOC4wXERhdGFcTEFQVE9QLVVHQVVEM0QxLWJpbi4wMDAyMzJZBAAAAAAAADEI
Igw=
'/*!*/;
# at 1586
#240516 13:56:10 server id 1  end_log_pos 1617 CRC32 0xd76a6a41 	Xid = 344
COMMIT/*!*/;
# at 1617
#240516 13:56:26 server id 1  end_log_pos 1694 CRC32 0xa67d7185 	Anonymous_GTID	last_committed=3	sequence_number=4	rbr_only=no	original_committed_timestamp=1715838986998892	immediate_commit_timestamp=1715838986998892	transaction_length=231
# original_commit_timestamp=1715838986998892 (2024-05-16 13:56:26.998892 中国标准时间)
# immediate_commit_timestamp=1715838986998892 (2024-05-16 13:56:26.998892 中国标准时间)
/*!80001 SET @@session.original_commit_timestamp=1715838986998892*//*!*/;
/*!80014 SET @@session.original_server_version=80035*//*!*/;
/*!80014 SET @@session.immediate_server_version=80035*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 1694
#240516 13:56:26 server id 1  end_log_pos 1848 CRC32 0xd9a783ad 	Query	thread_id=22	exec_time=0	error_code=0	Xid = 353
SET TIMESTAMP=1715838986/*!*/;
/*!80013 SET @@session.sql_require_primary_key=0*//*!*/;
CREATE TABLE `warehouse_test2`.`bbbb` (`qqqq` VARCHAR(255))
/*!*/;
# at 1848
#240516 13:56:36 server id 1  end_log_pos 1927 CRC32 0xef2dbc9e 	Anonymous_GTID	last_committed=4	sequence_number=5	rbr_only=yes	original_committed_timestamp=1715838996654250	immediate_commit_timestamp=1715838996654250	transaction_length=306
/*!50718 SET TRANSACTION ISOLATION LEVEL READ COMMITTED*//*!*/;
# original_commit_timestamp=1715838996654250 (2024-05-16 13:56:36.654250 中国标准时间)
# immediate_commit_timestamp=1715838996654250 (2024-05-16 13:56:36.654250 中国标准时间)
/*!80001 SET @@session.original_commit_timestamp=1715838996654250*//*!*/;
/*!80014 SET @@session.original_server_version=80035*//*!*/;
/*!80014 SET @@session.immediate_server_version=80035*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 1927
#240516 13:56:36 server id 1  end_log_pos 1998 CRC32 0x1146ec65 	Query	thread_id=22	exec_time=0	error_code=0
SET TIMESTAMP=1715838996/*!*/;
BEGIN
/*!*/;
# at 1998
#240516 13:56:36 server id 1  end_log_pos 2061 CRC32 0x592953bf 	Table_map: `warehouse_test2`.`bbbb` mapped to number 186
# has_generated_invisible_primary_key=0
# at 2061
#240516 13:56:36 server id 1  end_log_pos 2123 CRC32 0x4d9437c6 	Write_rows: table id 186 flags: STMT_END_F

BINLOG '
FKBFZhMBAAAAPwAAAA0IAAAAALoAAAAAAAEAD3dhcmVob3VzZV90ZXN0MgAEYmJiYgABDwL8AwEC
AeC/UylZ
FKBFZh4BAAAAPgAAAEsIAAAAALoAAAAAAAEAAgAB/wAYADFuUGE3Z0tka3M4cUxXN21CZjZUdUE9
PcY3lE0=
'/*!*/;
# at 2123
#240516 13:56:36 server id 1  end_log_pos 2154 CRC32 0x0fefc32d 	Xid = 358
COMMIT/*!*/;
SET @@SESSION.GTID_NEXT= 'AUTOMATIC' /* added by mysqlbinlog */ /*!*/;
DELIMITER ;
# End of log file
/*!50003 SET COMPLETION_TYPE=@OLD_COMPLETION_TYPE*/;
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=0*/;
