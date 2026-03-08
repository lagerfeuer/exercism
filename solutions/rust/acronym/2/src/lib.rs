pub fn abbreviate(phrase: &str) -> String {
    phrase
        .chars()
        .scan(' ', |prev, curr| {
            Some((std::mem::replace(prev, curr), curr))
        })
        .filter_map(|(prev, curr)| {
            if " -_".contains(prev) && curr.is_alphabetic()
                || prev.is_lowercase() && curr.is_uppercase()
            {
                Some(curr)
            } else {
                None
            }
        })
        .collect::<String>()
        .to_uppercase()
}
