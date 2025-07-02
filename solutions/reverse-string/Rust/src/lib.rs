pub fn reverse(input: &str) -> String {
    input.chars().fold(String::new(), |acc, c| c.to_string() + &acc)
}