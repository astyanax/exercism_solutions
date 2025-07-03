using System;

public static class PigLatin
{
    public static string Translate(string word)
    {
        if (string.IsNullOrEmpty(word))
            return string.Empty;

        string[] words = word.ToLower().Split(' ');
        string result = "";

        foreach (string w in words)
        {
            if (result.Length > 0)
                result = $"{result} ";

            if (StartsWithVowelSound(w))
                result = $"{result}{w}ay";
            else
            {
                int consonantClusterEnd = FindConsonantClusterEnd(w);
                result = $"{result}{w.Substring(consonantClusterEnd)}{w.Substring(0, consonantClusterEnd)}ay";
            }
        }

        return result;
    }

    private static bool StartsWithVowelSound(string word) =>
        $"{word}".StartsWith("a") || $"{word}".StartsWith("e") || $"{word}".StartsWith("i") ||
        $"{word}".StartsWith("o") || $"{word}".StartsWith("u") ||
        $"{word}".StartsWith("xr") || $"{word}".StartsWith("yt");

    private static int FindConsonantClusterEnd(string word)
    {
        int i = 0;
        while (i < word.Length)
        {
            if (i + 1 < word.Length && word.Substring(i, 2) == "qu")
            {
                i += 2;
                continue;
            }

            if (word[i] == 'y' && i > 0)
                return i;

            if ("aeiou".Contains(word[i]))
                return i;

            i++;
        }
        return i;
    }
}