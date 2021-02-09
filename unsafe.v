// Postgres testings with V

module main
import pg
import os

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
	
	coro := huminaize(sex: 'stright', race: 'Eastrean', birth: '1998-6-12')
	db.exec_param_many("INSERT INTO humans(sex, race, birth) VALUES($1, $2, $3)", [coro.sex, coro.race, coro.birth])

	query := db.exec("SELECT * FROM humans") or {
			panic(err)
		}
	println(query)

	unsafe {

		db.close()
	}

}
