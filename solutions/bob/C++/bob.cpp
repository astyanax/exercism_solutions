#include "bob.h"
#include <cctype>

using namespace std;

namespace bob {
  string hey(string input) {
    string response = "";
    bool all_caps = false, question = false, lowercase = true, whitespace = false;
    if (input.empty())
      return "Fine. Be that way!";
    for (unsigned char letter : input) {
      if (lowercase && isupper(letter) && isalpha(letter))
        all_caps = true;
      if (all_caps && islower(letter) && isalpha(letter)) {
        all_caps = false;
        lowercase = false;
      }
      if (letter == '?')
        question = true;
      if (isalpha(letter) && question)
        question = false;
      if (!(isspace(letter)))
        whitespace = true;
    }
    if (all_caps && !question)
      response = "Whoa, chill out!";
    else if (!all_caps && question)
      response = "Sure.";
    else if (all_caps && question)
      response = "Calm down, I know what I'm doing!";
    else if (!whitespace)
      response = "Fine. Be that way!";
    else
      response = "Whatever.";
    return response;
  }
}