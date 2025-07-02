"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).
"""
function ispangram(input)
    # Convert input to lowercase and filter only letters
    letters = filter(isletter, lowercase(input))

    # Create a Set of unique letters
    unique_letters = Set(letters)

    # Check if we have all 26 letters of the alphabet
    return length(unique_letters) == 26
end
