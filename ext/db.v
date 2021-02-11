module db

import pg
import sync
import time
import os


pub struct PgConn {
	host string = 'localhost'
	port int = 5432
	user string
	password string
	database string
	cache bool
}

pub struct PgInt {
	bigint string = 'BIGINT'
	smallint string = 'SMALLINT'
	integer string = 'INT'
	serial string = 'SERIAL'
}


pub struct PgString {
	varchar string = 'VARCHAR'
	text string = 'TEXT'
}


pub struct PgTime {
	date string = 'DATE'
	datetime string = 'DATETIME'
	timestamp string = 'TIMESTAMP'
}

pub fn(cfg PgConn) ? {
	return
}
