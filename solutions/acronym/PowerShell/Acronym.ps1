Function Get-Acronym() {
    [CmdletBinding()]
    Param (
        [string]$Phrase
    )

    # Split phrase into words using spaces, hyphens and underscores, then take first letter of each word
    # Filter out empty strings to handle consecutive delimiters
    $words = $Phrase -split '[ \-_]' | Where-Object { $_ }
    $acronym = ($words | ForEach-Object { $_.Substring(0,1) }) -join ''

    # Convert to uppercase and return
    return $acronym.ToUpper()
}
