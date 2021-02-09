module stdlib

fn err(why string) string {
	return match why {
		'SERIAL' {
			println("Returned SERIAL")
		}
		'BOOL' {
			println("Returned bool")
		}
		else {
			println("Returned None")
		}
	}
}


