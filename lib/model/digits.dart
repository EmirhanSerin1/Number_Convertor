class Digits {
  final List _single = [
    "",
    "one ",
    "two ",
    "three ",
    "four ",
    "five ",
    "six ",
    "seven ",
    "eight ",
    "nine ",
    "ten ",
    "eleven ",
    "twelve ",
    "thirteen ",
    "fourteen ",
    "fifteen ",
    "sixteen ",
    "seventeen ",
    "eighteen ",
    "nineteen "
  ];

  List get single => _single;

  final List _double = [
    "",
    "",
    "twenty",
    "thirty",
    "forty",
    "fifty",
    "sixty",
    "seventy",
    "eighty",
    "ninety"
  ];

  List get double => _double;

  final List _tenPowers = [
    "hundred ",
    "thousand ",
    "million ",
    "billion "
  ];

  List get tenPowers => _tenPowers;
}
