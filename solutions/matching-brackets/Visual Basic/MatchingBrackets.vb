Imports System.Collections.Generic
Imports System.Text.RegularExpressions

Public Module MatchingBrackets
    Public Function IsPaired(ByVal input As String) As Boolean
        Dim prev = ""
        While prev <> input
            prev = input
            input = Regex.Replace(input, "\[\]|\{\}|\(\)|[^[\](){}]", "")
        End While
        Return input = ""
    End Function
End Module