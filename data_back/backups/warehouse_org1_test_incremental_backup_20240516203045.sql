# The proper term is pseudo_replica_mode, but we use this compatibility alias
# to make the statement usable on server versions 8.0.24 and older.
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=1*/;
/*!50003 SET @OLD_COMPLETION_TYPE=@@COMPLETION_TYPE,COMPLETION_TYPE=0*/;
DELIMITER /*!*/;
# at 126
#240516 20:30:42 server id 1  end_log_pos 126 CRC32 0x5b6326d6 	Start: binlog v 4, server v 8.0.35 created 240516 20:30:42
# Warning: this binlog is either in use or was not closed properly.
BINLOG '
cvxFZg8BAAAAegAAAH4AAAABAAQAOC4wLjM1AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAEwANAAgAAAAABAAEAAAAYgAEGggAAAAICAgCAAAACgoKKioAEjQA
CigAAdYmY1s=
'/*!*/;
# at 157
#240516 20:30:42 server id 1  end_log_pos 236 CRC32 0x26fb2400 	Anonymous_GTID	last_committed=0	sequence_number=1	rbr_only=yes	original_committed_timestamp=1715862642521190	immediate_commit_timestamp=1715862642521190	transaction_length=503
/*!50718 SET TRANSACTION ISOLATION LEVEL READ COMMITTED*//*!*/;
# original_commit_timestamp=1715862642521190 (2024-05-16 20:30:42.521190 中国标准时间)
# immediate_commit_timestamp=1715862642521190 (2024-05-16 20:30:42.521190 中国标准时间)
/*!80001 SET @@session.original_commit_timestamp=1715862642521190*//*!*/;
/*!80014 SET @@session.original_server_version=80035*//*!*/;
/*!80014 SET @@session.immediate_server_version=80035*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 236
#240516 20:30:42 server id 1  end_log_pos 307 CRC32 0x66ede661 	Query	thread_id=751	exec_time=0	error_code=0
SET TIMESTAMP=1715862642/*!*/;
SET @@session.pseudo_thread_id=751/*!*/;
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
# at 307
#240516 20:30:42 server id 1  end_log_pos 391 CRC32 0xfba15d49 	Table_map: `history_warehouse`.`binlog_control` mapped to number 291
# has_generated_invisible_primary_key=0
# at 391
#240516 20:30:42 server id 1  end_log_pos 629 CRC32 0x8ecff781 	Update_rows: table id 291 flags: STMT_END_F

BINLOG '
cvxFZhMBAAAAVAAAAIcBAAAAACMBAAAAAAEAEWhpc3Rvcnlfd2FyZWhvdXNlAA5iaW5sb2dfY29u
dHJvbAADDw8IBPwD/AMGAQEAAgP8/wBJXaH7
cvxFZh8BAAAA7gAAAHUCAAAAACMBAAAAAAEAAgAD//8AEwB3YXJlaG91c2Vfb3JnMV90ZXN0RQBD
OlxQcm9ncmFtRGF0YVxNeVNRTFxNeVNRTCBTZXJ2ZXIgOC4wXERhdGFcTEFQVE9QLVVHQVVEM0Qx
LWJpbi4wMDAyMzMuAgAAAAAAAAATAHdhcmVob3VzZV9vcmcxX3Rlc3RFAEM6XFByb2dyYW1EYXRh
XE15U1FMXE15U1FMIFNlcnZlciA4LjBcRGF0YVxMQVBUT1AtVUdBVUQzRDEtYmluLjAwMDIzNZ0A
AAAAAAAAgffPjg==
'/*!*/;
# at 629
#240516 20:30:42 server id 1  end_log_pos 660 CRC32 0x17a835e5 	Xid = 5740
COMMIT/*!*/;
# at 660
#240516 20:30:42 server id 1  end_log_pos 739 CRC32 0x37965f27 	Anonymous_GTID	last_committed=1	sequence_number=2	rbr_only=yes	original_committed_timestamp=1715862642525953	immediate_commit_timestamp=1715862642525953	transaction_length=346
/*!50718 SET TRANSACTION ISOLATION LEVEL READ COMMITTED*//*!*/;
# original_commit_timestamp=1715862642525953 (2024-05-16 20:30:42.525953 中国标准时间)
# immediate_commit_timestamp=1715862642525953 (2024-05-16 20:30:42.525953 中国标准时间)
/*!80001 SET @@session.original_commit_timestamp=1715862642525953*//*!*/;
/*!80014 SET @@session.original_server_version=80035*//*!*/;
/*!80014 SET @@session.immediate_server_version=80035*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 739
#240516 20:30:42 server id 1  end_log_pos 818 CRC32 0xb5b81648 	Query	thread_id=751	exec_time=0	error_code=0
SET TIMESTAMP=1715862642/*!*/;
SET @@session.time_zone='SYSTEM'/*!*/;
BEGIN
/*!*/;
# at 818
#240516 20:30:42 server id 1  end_log_pos 907 CRC32 0x3aa4e054 	Table_map: `history_warehouse`.`backup_history` mapped to number 292
# has_generated_invisible_primary_key=0
# at 907
#240516 20:30:42 server id 1  end_log_pos 975 CRC32 0x661bb556 	Write_rows: table id 292 flags: STMT_END_F

BINLOG '
cvxFZhMBAAAAWQAAAIsDAAAAACQBAAAAAAEAEWhpc3Rvcnlfd2FyZWhvdXNlAA5iYWNrdXBfaGlz
dG9yeQAFAw/+Ev4H/AP3AQD3AR4BAQACA/z/AFTgpDo=
cvxFZh4BAAAARAAAAM8DAAAAACQBAAAAAAEAAgAF/wAiAAAAEwB3YXJlaG91c2Vfb3JnMV90ZXN0
AZmzYUerAVa1G2Y=
'/*!*/;
# at 975
#240516 20:30:42 server id 1  end_log_pos 1006 CRC32 0x3ecc8520 	Xid = 5741
COMMIT/*!*/;
SET @@SESSION.GTID_NEXT= 'AUTOMATIC' /* added by mysqlbinlog */ /*!*/;
DELIMITER ;
# End of log file
/*!50003 SET COMPLETION_TYPE=@OLD_COMPLETION_TYPE*/;
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=0*/;
