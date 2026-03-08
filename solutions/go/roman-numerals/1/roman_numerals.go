package romannumerals

import (
	"errors"
	"sort"
)

var Mapping = map[int]string{
	1000: "M",
	900:  "CM",
	500:  "D",
	400:  "CD",
	100:  "C",
	90:   "XC",
	50:   "L",
	40:   "XL",
	10:   "X",
	9:    "IX",
	5:    "V",
	4:    "IV",
	1:    "I",
}

func ToRomanNumeral(input int) (string, error) {
	if input <= 0 || input >= 4000 {
		return "", errors.New("out of range")
	}

	keys := make([]int, 0, len(Mapping))
	for k := range Mapping {
		keys = append(keys, k)
	}
	sort.Sort(sort.Reverse(sort.IntSlice(keys)))

	result := ""
	for input > 0 {
		for _, k := range keys {
			for input >= k {
				result += Mapping[k]
				input -= k
			}
		}
	}
	return result, nil
}
