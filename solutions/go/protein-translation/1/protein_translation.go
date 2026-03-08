package protein

import (
  "errors"
)

var codonToProtein = map[string]string{
  "AUG": "Methionine",
  "UUU": "Phenylalanine",
  "UUC": "Phenylalanine",
  "UUA": "Leucine",
  "UUG": "Leucine",
  "UCU": "Serine",
  "UCC": "Serine",
  "UCA": "Serine",
  "UCG": "Serine",
  "UAU": "Tyrosine",
  "UAC": "Tyrosine",
  "UGU": "Cysteine",
  "UGC": "Cysteine",
  "UGG": "Tryptophan",
  "UAA": "STOP",
  "UAG": "STOP",
  "UGA": "STOP",
}

var (
  ErrStop = errors.New("STOP")
  ErrInvalidBase = errors.New("InvalidBase")
)

func FromRNA(rna string) ([]string, error) {
  var proteins []string
  for i := 0; i < len(rna); i += 3 {
    codon := rna[i:i+3]
    protein, err := FromCodon(codon)
    if err == ErrStop {
      break
    }
    if err == ErrInvalidBase {
      return proteins, err
    }
    proteins = append(proteins, protein)
  }
  return proteins, nil
}

func FromCodon(codon string) (string, error) {
  if protein, ok := codonToProtein[codon]; ok {
    if protein == "STOP" {
      return "", ErrStop
    }
    return protein, nil
  }
  return "", ErrInvalidBase
}
