package letter

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(s string) FreqMap {
	m := FreqMap{}
	for _, r := range s {
		m[r]++
	}

	return m
}

// ConcurrentFrequency counts the frequency of each rune in a given texts concurrently
// and returns this data as FreqMap.
// It makes len(texts) goroutines which counts frequency of corresponding text.
// Then sum them up together.
func ConcurrentFrequency(texts []string) FreqMap {
	jobChannel := make(chan FreqMap)
	for _, text := range texts {
		go func(text string) {
			jobChannel <- Frequency(text)
		}(text)
	}

	frequency := FreqMap{}
	for range texts {
		for key, value := range <-jobChannel {
			frequency[key] += value
		}
	}

	return frequency
}
