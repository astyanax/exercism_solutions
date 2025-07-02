import java.util.HashMap;
import java.util.Map;
import static java.util.stream.Collectors.joining;

public class RnaTranscription {
    private static Map<Character, String> rnaMapping = new HashMap<Character, String>() {
        {
            put('G', "C");
            put('C', "G");
            put('T', "A");
            put('A', "U");
        }
    };

    public String transcribe(String dnaStrand) {
        return dnaStrand.chars()
                .mapToObj(i -> transcribe_nucleotide((char) i))
                .collect(joining());
    }

    private String transcribe_nucleotide(char i) {
        return rnaMapping.computeIfAbsent(i, j -> {
            throw new IllegalArgumentException("Invalid input");
        });
    }
}