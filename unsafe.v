// Postgres testings with V

module main

import sync
import pg
import os
import time

#flag -I @VROOT/stdlib
#flag @VROOT/stdlib/test.c
#include "wrapper.h"

[typedef]
struct C.Program {
	input int
	compute bool
	output int
}

fn C.getfunky(int) int

fn ctype() bool {

	mut x := C.Program{
		input: 1
		compute: true
		output: 0
	}
	return x.compute != false
}

struct Database {
mut:
	host string = 'localhost'
	port int = 5432
	user string
	password string 
	name string
}

struct Human {
	sex string
	race string
	birth string
}

// i called the connecter async because i wanted to.
fn async (await Database) &Database {
	return &Database {
		host: await.host
		port: await.port
		user: await.user
		password: await.password
		name: await.name
	}
}

[live]
fn try() {
	println("Live macro")
}

fn huminaize(h Human) &Human {

	return &Human {
		sex: h.sex
		race: h.race
		birth: h.birth
	}
}

fn main() {
	
	mut move := sync.new_waitgroup()
	pool := async(host: 'localhost', port: 5432, user: 'fate', password: 'fate', name: 'fate')
	db := pg.connect(pg.Config{
		host: pool.host
		port: pool.port
		user: pool.user
		password: pool.password
		dbname: pool.name
	}) or {
		println(err)
		return
	}

	for {
		try()
		break
	}

	mut why := unsafe { os.user_os() == 'linux' }
	nil := ''

	if pool.host == nil {
		println(why)
	}
	
	coro := huminaize(sex: 'male', race: 'asian', birth: '1965-5-9')
	if os.exists("./stdlib/tables.sql") {
		move.add(1)
			println("Creating tabeles now.")
			time.sleep(2)
			schema := unsafe { 
				os.read_file("./stdlib/tables.sql") or {
					println("sql file was not found.")
					return
				}
			}
			db.exec(schema)?
		}
	db.exec_param_many("INSERT INTO humans(sex, race, birth) VALUES($1, $2, $3)", [coro.sex, coro.race, coro.birth]) or {
		panic(err)
	}

	query := db.exec("SELECT * FROM humans") or {
			panic(err)
		}
	println(query)
	move.wait()
}
