# The proper term is pseudo_replica_mode, but we use this compatibility alias
# to make the statement usable on server versions 8.0.24 and older.
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=1*/;
/*!50003 SET @OLD_COMPLETION_TYPE=@@COMPLETION_TYPE,COMPLETION_TYPE=0*/;
DELIMITER /*!*/;
# at 126
#240516 20:27:19 server id 1  end_log_pos 126 CRC32 0xb34a30ca 	Start: binlog v 4, server v 8.0.35 created 240516 20:27:19
# Warning: this binlog is either in use or was not closed properly.
BINLOG '
p/tFZg8BAAAAegAAAH4AAAABAAQAOC4wLjM1AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAEwANAAgAAAAABAAEAAAAYgAEGggAAAAICAgCAAAACgoKKioAEjQA
CigAAcowSrM=
'/*!*/;
# at 157
#240516 20:27:19 server id 1  end_log_pos 236 CRC32 0xb8323f9d 	Anonymous_GTID	last_committed=0	sequence_number=1	rbr_only=yes	original_committed_timestamp=1715862439742844	immediate_commit_timestamp=1715862439742844	transaction_length=401
/*!50718 SET TRANSACTION ISOLATION LEVEL READ COMMITTED*//*!*/;
# original_commit_timestamp=1715862439742844 (2024-05-16 20:27:19.742844 中国标准时间)
# immediate_commit_timestamp=1715862439742844 (2024-05-16 20:27:19.742844 中国标准时间)
/*!80001 SET @@session.original_commit_timestamp=1715862439742844*//*!*/;
/*!80014 SET @@session.original_server_version=80035*//*!*/;
/*!80014 SET @@session.immediate_server_version=80035*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 236
#240516 20:27:19 server id 1  end_log_pos 307 CRC32 0xac9d9bc2 	Query	thread_id=739	exec_time=0	error_code=0
SET TIMESTAMP=1715862439/*!*/;
SET @@session.pseudo_thread_id=739/*!*/;
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
#240516 20:27:19 server id 1  end_log_pos 391 CRC32 0xabb1ff52 	Table_map: `history_warehouse`.`binlog_control` mapped to number 241
# has_generated_invisible_primary_key=0
# at 391
#240516 20:27:19 server id 1  end_log_pos 527 CRC32 0xa6834e54 	Write_rows: table id 241 flags: STMT_END_F

BINLOG '
p/tFZhMBAAAAVAAAAIcBAAAAAPEAAAAAAAEAEWhpc3Rvcnlfd2FyZWhvdXNlAA5iaW5sb2dfY29u
dHJvbAADDw8IBPwD/AMGAQEAAgP8/wBS/7Gr
p/tFZh4BAAAAiAAAAA8CAAAAAPEAAAAAAAEAAgAD/wATAHdhcmVob3VzZV9vcmcxX3Rlc3RFAEM6
XFByb2dyYW1EYXRhXE15U1FMXE15U1FMIFNlcnZlciA4LjBcRGF0YVxMQVBUT1AtVUdBVUQzRDEt
YmluLjAwMDIzM50AAAAAAAAAVE6Dpg==
'/*!*/;
# at 527
#240516 20:27:19 server id 1  end_log_pos 558 CRC32 0xa71ee3ab 	Xid = 5425
COMMIT/*!*/;
SET @@SESSION.GTID_NEXT= 'AUTOMATIC' /* added by mysqlbinlog */ /*!*/;
DELIMITER ;
# End of log file
/*!50003 SET COMPLETION_TYPE=@OLD_COMPLETION_TYPE*/;
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=0*/;
