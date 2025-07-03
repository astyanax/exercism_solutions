import std/[algorithm, strutils]
#func reverse*(s: string): string = s.reversed.join("")
proc reverse*(s: string): string =
  for i in countdown(s.high, s.low):
    result.add(s[i])