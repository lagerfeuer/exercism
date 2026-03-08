pub fn abbreviate(phrase: &str) -> String {
    phrase
        .chars()
        .zip(phrase.chars().skip(1))
        .map(|(a, b)| match (a, b) {
            ('a'..='z', 'A'..='Z') => ' ',
            _ => a,
        })
        .filter_map(|c| match c {
            c if c.is_alphanumeric() || c.is_whitespace() => Some(c),
            '-' => Some(' '),
            _ => None,
        })
        .collect::<String>()
        .split_whitespace()
        .filter_map(|word| word.chars().next())
        .collect::<String>()
        .to_uppercase()
}
