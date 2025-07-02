<?php
declare(strict_types=1);

function detectAnagrams(string $word, array $anagrams): array
{
  $similars = [];
  foreach ($anagrams as $anagram){
    if (strtolower($anagram) !== strtolower($word) &&
      count_chars(strtolower($anagram), 1) == count_chars(strtolower($word), 1)
    ){
      $similars[] = $anagram;
    }
  }
  return $similars;
}