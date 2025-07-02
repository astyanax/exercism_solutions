<?php

declare(strict_types=1);

class PhoneNumber
{
  public $number;
  public function number(): string { return $this->number; }

  function __construct($number) 
  {
      $this->number = $number;
      $this->number = preg_replace('/\W/', '', $this->number);
      $parts = [];

      if (!preg_match('/[\d]{3}[\d]{3}[\d]{4}$/', $this->number, $matches))
          throw new \InvalidArgumentException("Your either involves 1) incorrect number of digits, 2) letters not permitted, 3) punctuations not permitted");

      if (strlen($this->number) > 11)
          throw new \InvalidArgumentException("more than 11 digits");
      else if (strlen($this->number) == 11 && substr($this->number, 0, 1) != "1")
          throw new \InvalidArgumentException("11 digits must start with 1");

      $this->number = $matches[0];
      if (strlen($this->number) == 10) {
          if (substr($this->number, 0, 1) < 2)
              throw new \InvalidArgumentException("area code cannot start with zero, area code cannot start with one");
          if (substr($this->number, 3, 1) < 2)
              throw new \InvalidArgumentException("exchange code cannot start with zero, exchange code cannot start with one");
      };
  }
}