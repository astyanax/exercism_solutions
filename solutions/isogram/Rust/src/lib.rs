pub fn check(candidate: &str) -> bool {
    let mut seen = [false; 26];
    candidate
        .to_lowercase()
        .chars()
        .filter(|c| c.is_ascii_alphabetic())
        .all(|c| {
            let idx = (c as u8 - b'a') as usize;
            if seen[idx] {
                false
            } else {
                seen[idx] = true;
                true
            }
        })
}
