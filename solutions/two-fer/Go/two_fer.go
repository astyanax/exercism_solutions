package twofer

// ShareWith returns a string with the format "One for <name>, one for me"
// If no name is provided, it uses "you" as the default
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return "One for " + name + ", one for me."
}