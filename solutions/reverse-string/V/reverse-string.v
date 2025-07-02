module main

fn reverse_string(str string) string {
	// Assume ASCII
	mut reversed := ""
    for ch in str {
		reversed = ch.ascii_str() + reversed
	}
    return reversed

}

fn reverse_unicode_string(str string) string {
	// Use array of runes to support Unicode
	mut reversed := []rune{}

	mut l := str.len - 1
	for l >= 0 {
		reversed << str.runes()[l]
		l--
	}
    return reversed.string()
}