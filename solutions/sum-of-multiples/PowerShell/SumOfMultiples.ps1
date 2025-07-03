Function Get-SumOfMultiples {
    [CmdletBinding()]
    Param(
        [int[]]$Multiples,
        [int]$Limit
    )

    $uniqueMultiples = @()

    foreach ($factor in $Multiples) {
        if ($factor -eq 0) { continue }

        $current = $factor
        while ($current -lt $Limit) {
            if ($uniqueMultiples -notcontains $current) {
                $uniqueMultiples += $current
            }
            $current += $factor
        }
    }

    return ($uniqueMultiples | Measure-Object -Sum).Sum
}