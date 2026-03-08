package reverse

func Reverse(input string) string {
	result := ""
	for _, v := range input {
		result = string(v) + result
	}
	return result
}
