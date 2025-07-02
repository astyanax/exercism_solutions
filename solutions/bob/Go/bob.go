package bob
import "strings"

func Hey(remark string) string {
	remark = strings.TrimSpace(remark)
	if remark == "" {
		return "Fine. Be that way!"
	}
	
	if strings.HasSuffix(remark, "?") && strings.ToUpper(remark) == remark && strings.ToLower(remark) != remark {
		return "Calm down, I know what I'm doing!"
	}
	
	if strings.HasSuffix(remark, "?") {
		return "Sure."
	}
	
	if strings.ToUpper(remark) == remark && strings.ToLower(remark) != remark {
		return "Whoa, chill out!"
	}
	return "Whatever."
}