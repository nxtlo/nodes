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
	bigint int
	smallint int
	integer int
	serial int
}


pub struct PgString {
	varchar string
	text string
}


pub struct PgTime {
	date string
	datetime string
	timestamp string
}

pub fn(cfg PgConn) ? {
	return
}
