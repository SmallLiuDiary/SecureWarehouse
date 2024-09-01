# The proper term is pseudo_replica_mode, but we use this compatibility alias
# to make the statement usable on server versions 8.0.24 and older.
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=1*/;
/*!50003 SET @OLD_COMPLETION_TYPE=@@COMPLETION_TYPE,COMPLETION_TYPE=0*/;
DELIMITER /*!*/;
# at 126
#240516 20:30:32 server id 1  end_log_pos 126 CRC32 0xe6c375af 	Start: binlog v 4, server v 8.0.35 created 240516 20:30:32
# Warning: this binlog is either in use or was not closed properly.
BINLOG '
aPxFZg8BAAAAegAAAH4AAAABAAQAOC4wLjM1AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAEwANAAgAAAAABAAEAAAAYgAEGggAAAAICAgCAAAACgoKKioAEjQA
CigAAa91w+Y=
'/*!*/;
# at 157
#240516 20:30:32 server id 1  end_log_pos 236 CRC32 0xeaf69d8d 	Anonymous_GTID	last_committed=0	sequence_number=1	rbr_only=yes	original_committed_timestamp=1715862632635311	immediate_commit_timestamp=1715862632635311	transaction_length=402
/*!50718 SET TRANSACTION ISOLATION LEVEL READ COMMITTED*//*!*/;
# original_commit_timestamp=1715862632635311 (2024-05-16 20:30:32.635311 中国标准时间)
# immediate_commit_timestamp=1715862632635311 (2024-05-16 20:30:32.635311 中国标准时间)
/*!80001 SET @@session.original_commit_timestamp=1715862632635311*//*!*/;
/*!80014 SET @@session.original_server_version=80035*//*!*/;
/*!80014 SET @@session.immediate_server_version=80035*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 236
#240516 20:30:32 server id 1  end_log_pos 307 CRC32 0xaf15771b 	Query	thread_id=751	exec_time=0	error_code=0
SET TIMESTAMP=1715862632/*!*/;
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
#240516 20:30:32 server id 1  end_log_pos 391 CRC32 0xda02dc09 	Table_map: `history_warehouse`.`binlog_control` mapped to number 267
# has_generated_invisible_primary_key=0
# at 391
#240516 20:30:32 server id 1  end_log_pos 528 CRC32 0x31bae1e2 	Write_rows: table id 267 flags: STMT_END_F

BINLOG '
aPxFZhMBAAAAVAAAAIcBAAAAAAsBAAAAAAEAEWhpc3Rvcnlfd2FyZWhvdXNlAA5iaW5sb2dfY29u
dHJvbAADDw8IBPwD/AMGAQEAAgP8/wAJ3ALa
aPxFZh4BAAAAiQAAABACAAAAAAsBAAAAAAEAAgAD/wAUAHdhcmVob3VzZV9vcmcxX3Rlc3QyRQBD
OlxQcm9ncmFtRGF0YVxNeVNRTFxNeVNRTCBTZXJ2ZXIgOC4wXERhdGFcTEFQVE9QLVVHQVVEM0Qx
LWJpbi4wMDAyMzSdAAAAAAAAAOLhujE=
'/*!*/;
# at 528
#240516 20:30:32 server id 1  end_log_pos 559 CRC32 0xcba3375b 	Xid = 5668
COMMIT/*!*/;
# at 559
#240516 20:30:32 server id 1  end_log_pos 638 CRC32 0x477fe6ca 	Anonymous_GTID	last_committed=1	sequence_number=2	rbr_only=yes	original_committed_timestamp=1715862632646431	immediate_commit_timestamp=1715862632646431	transaction_length=347
/*!50718 SET TRANSACTION ISOLATION LEVEL READ COMMITTED*//*!*/;
# original_commit_timestamp=1715862632646431 (2024-05-16 20:30:32.646431 中国标准时间)
# immediate_commit_timestamp=1715862632646431 (2024-05-16 20:30:32.646431 中国标准时间)
/*!80001 SET @@session.original_commit_timestamp=1715862632646431*//*!*/;
/*!80014 SET @@session.original_server_version=80035*//*!*/;
/*!80014 SET @@session.immediate_server_version=80035*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 638
#240516 20:30:32 server id 1  end_log_pos 717 CRC32 0xe72cdebc 	Query	thread_id=751	exec_time=0	error_code=0
SET TIMESTAMP=1715862632/*!*/;
SET @@session.time_zone='SYSTEM'/*!*/;
BEGIN
/*!*/;
# at 717
#240516 20:30:32 server id 1  end_log_pos 806 CRC32 0x1df0d350 	Table_map: `history_warehouse`.`backup_history` mapped to number 268
# has_generated_invisible_primary_key=0
# at 806
#240516 20:30:32 server id 1  end_log_pos 875 CRC32 0xd8810f13 	Write_rows: table id 268 flags: STMT_END_F

BINLOG '
aPxFZhMBAAAAWQAAACYDAAAAAAwBAAAAAAEAEWhpc3Rvcnlfd2FyZWhvdXNlAA5iYWNrdXBfaGlz
dG9yeQAFAw/+Ev4H/AP3AQD3AR4BAQACA/z/AFDT8B0=
aPxFZh4BAAAARQAAAGsDAAAAAAwBAAAAAAEAAgAF/wAgAAAAFAB3YXJlaG91c2Vfb3JnMV90ZXN0
MgGZs2FHoQETD4HY
'/*!*/;
# at 875
#240516 20:30:32 server id 1  end_log_pos 906 CRC32 0x102b1717 	Xid = 5669
COMMIT/*!*/;
SET @@SESSION.GTID_NEXT= 'AUTOMATIC' /* added by mysqlbinlog */ /*!*/;
DELIMITER ;
# End of log file
/*!50003 SET COMPLETION_TYPE=@OLD_COMPLETION_TYPE*/;
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=0*/;
