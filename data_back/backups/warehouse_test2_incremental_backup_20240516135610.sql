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
# at 609
#240516 13:55:59 server id 1  end_log_pos 688 CRC32 0x48f3e6f4 	Anonymous_GTID	last_committed=1	sequence_number=2	rbr_only=yes	original_committed_timestamp=1715838959867034	immediate_commit_timestamp=1715838959867034	transaction_length=504
/*!50718 SET TRANSACTION ISOLATION LEVEL READ COMMITTED*//*!*/;
# original_commit_timestamp=1715838959867034 (2024-05-16 13:55:59.867034 中国标准时间)
# immediate_commit_timestamp=1715838959867034 (2024-05-16 13:55:59.867034 中国标准时间)
/*!80001 SET @@session.original_commit_timestamp=1715838959867034*//*!*/;
/*!80014 SET @@session.original_server_version=80035*//*!*/;
/*!80014 SET @@session.immediate_server_version=80035*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 688
#240516 13:55:59 server id 1  end_log_pos 768 CRC32 0xe6ea6192 	Query	thread_id=22	exec_time=0	error_code=0
SET TIMESTAMP=1715838959/*!*/;
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
# at 768
#240516 13:55:59 server id 1  end_log_pos 852 CRC32 0xbae30050 	Table_map: `history_warehouse`.`binlog_control` mapped to number 170
# has_generated_invisible_primary_key=0
# at 852
#240516 13:55:59 server id 1  end_log_pos 1082 CRC32 0xb1959867 	Update_rows: table id 170 flags: STMT_END_F

BINLOG '
759FZhMBAAAAVAAAAFQDAAAAAKoAAAAAAAEAEWhpc3Rvcnlfd2FyZWhvdXNlAA5iaW5sb2dfY29u
dHJvbAADDw8IBPwD/AMGAQEAAgP8/wBQAOO6
759FZh8BAAAA5gAAADoEAAAAAKoAAAAAAAEAAgAD//8ADwB3YXJlaG91c2VfdGVzdDJFAEM6XFBy
b2dyYW1EYXRhXE15U1FMXE15U1FMIFNlcnZlciA4LjBcRGF0YVxMQVBUT1AtVUdBVUQzRDEtYmlu
LjAwMDIzMp0AAAAAAAAAAA8Ad2FyZWhvdXNlX3Rlc3QyRQBDOlxQcm9ncmFtRGF0YVxNeVNRTFxN
eVNRTCBTZXJ2ZXIgOC4wXERhdGFcTEFQVE9QLVVHQVVEM0QxLWJpbi4wMDAyMzJhAgAAAAAAAGeY
lbE=
'/*!*/;
# at 1082
#240516 13:55:59 server id 1  end_log_pos 1113 CRC32 0x441606a5 	Xid = 338
COMMIT/*!*/;
SET @@SESSION.GTID_NEXT= 'AUTOMATIC' /* added by mysqlbinlog */ /*!*/;
DELIMITER ;
# End of log file
/*!50003 SET COMPLETION_TYPE=@OLD_COMPLETION_TYPE*/;
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=0*/;
