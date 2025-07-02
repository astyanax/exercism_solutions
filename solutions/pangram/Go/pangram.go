package pangram
import "strings"

func IsPangram(input string) bool {
    input = strings.ToLower(input)

    letters := make(map[rune]bool)

    for _, char := range input {
        if char >= 'a' && char <= 'z' {
            letters[char] = true
        }
    }

    return len(letters) == 26
}