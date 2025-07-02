class RnaTranscription {
    String transcribe(String dnaStrand) {
        StringBuilder sb = new StringBuilder();
        dnaStrand.chars()
                .forEach(c -> sb.append(transcribe_nucleotide((char) c)));
        return sb.toString();
    }

    char transcribe_nucleotide(char c) {
        switch (c) {
            case 'C':
                return 'G';
            case 'G':
                return 'C';
            case 'T':
                return 'A';
            case 'A':
                return 'U';
        }
        throw new IllegalArgumentException("Invalid input");
    }
}