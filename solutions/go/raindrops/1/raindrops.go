package raindrops

import (
	"strconv"
	"strings"
)

func Convert(number int) string {
	s := strings.Builder{}
	if number%3 == 0 {
		s.WriteString("Pling")
	}
	if number%5 == 0 {
		s.WriteString("Plang")
	}
	if number%7 == 0 {
		s.WriteString("Plong")
	}
	if s.Len() == 0 {
		s.WriteString(strconv.Itoa(number))
	}
	return s.String()
}
