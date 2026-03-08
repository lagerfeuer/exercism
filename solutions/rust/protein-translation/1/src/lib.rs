pub struct CodonsInfo<'a> {
    map: std::collections::HashMap<&'a str, &'a str>,
}

impl<'a> CodonsInfo<'a> {
    pub fn name_for(&self, codon: &str) -> Option<&'a str> {
        self.map.get(codon).copied()
    }

    pub fn of_rna(&self, rna: &str) -> Option<Vec<&'a str>> {
        let result = rna
            .chars()
            .collect::<Vec<char>>()
            .chunks(3)
            .map(|chunk| String::from_iter(chunk.iter()))
            .map_while(|codon| match self.name_for(&codon) {
                Some("stop codon") => None,
                Some(name) => Some(name),
                None => Some("invalid codon"),
            })
            .collect::<Vec<&str>>();

        if result.contains(&"invalid codon") {
            return None;
        }

        Some(result)
    }
}

pub fn parse<'a>(pairs: Vec<(&'a str, &'a str)>) -> CodonsInfo<'a> {
    CodonsInfo {
        map: pairs.into_iter().collect(),
    }
}
