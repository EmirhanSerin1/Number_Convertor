//? First i followed a simple way
/*
  String convertNumbers( List list, int number, List single){
    if (double.parse(list[number]) < 10){
      if(double.parse(list[number]) % 10 == 1){
          result = single[number];
      }else if(double.parse(list[number]) % 10 == 2){
          result = "two";
      }else if(double.parse(list[number]) % 10 == 3){
          result = "three";
      }else if(double.parse(list[number]) % 10 == 4){
          result = "four";
      }else if(double.parse(list[number]) % 10 == 5){
          result = "five";
      }else if(double.parse(list[number]) % 10 == 6){
          result = "six";
      }else if(double.parse(list[number]) % 10 == 7){
          result = "seven";
      }else if(double.parse(list[number]) % 10 == 8){
          result = "eight";
      }else if(double.parse(list[number]) % 10 == 9){
          result = "nine";
      }else if(double.parse(list[number]) % 10 == 0){
          result = "zero";
      }
    }
    return result;
  }
  */
//? Then I thought the code would be written like this forever. I decided to follow a more efficient routpute.


convertToWords(
  int number, List list, List doubleDigit, List singleDigit, List tenPower) {
  String output = "";
  int n = int.parse(list[number]);


  //For billions
  if(n>=100000000000 && (n ~/ 100000000000) % 10 != 0 && (n/100000000) % 10 < 10 && ((n / 1000000000) % 100) < 1){//? Just for (100-200....900 billion)
    output += numberToWord(((n ~/ 100000000000) % 10), tenPower[0], doubleDigit, singleDigit);
    output += "billion "; 
  }else if(n>=110000000000){
    output += numberToWord(((n ~/ 100000000000) % 10), tenPower[0], doubleDigit, singleDigit);
    output += numberToWord(((n ~/ 1000000000) % 100), tenPower[3], doubleDigit, singleDigit);
  }else if((n ~/ 1000000000) % 100 < 10 && n >= 100000000000){
    output += numberToWord(((n ~/ 100000000000) % 10), tenPower[0], doubleDigit, singleDigit);
    output += numberToWord(((n ~/ 1000000000) % 10), tenPower[3], doubleDigit, singleDigit);
  }else{
    output += numberToWord(((n ~/ 1000000000) % 100), tenPower[3], doubleDigit, singleDigit);
  }

  //For millions
  if(n>=100000000 && (n ~/ 100000000) % 10 != 0 && (n/100000) % 10 < 10 && ((n / 1000000) % 100) < 1){//? Just for (100-200....900 million)
    output += numberToWord(((n ~/ 100000000) % 10), tenPower[0], doubleDigit, singleDigit);
    output += "million "; 
  }else if(n>=110000000){
    output += numberToWord(((n ~/ 100000000) % 10), tenPower[0], doubleDigit, singleDigit);
    output += numberToWord(((n ~/ 1000000) % 100), tenPower[2], doubleDigit, singleDigit);
  }else if((n ~/ 1000000) % 100 < 10 && n >= 100000000){
    output += numberToWord(((n ~/ 100000000) % 10), tenPower[0], doubleDigit, singleDigit);
    output += numberToWord(((n ~/ 1000000) % 10), tenPower[2], doubleDigit, singleDigit);
  }else{
    output += numberToWord(((n ~/ 1000000) % 100), tenPower[2], doubleDigit, singleDigit);
  }

  //For thousands
  if(n>=100000 && (n/100) % 10 < 10 && ((n / 1000) % 100) < 1 && (n ~/ 100000) % 10 != 0){//? Just for (100-200....900 thousand)
    output += numberToWord(((n ~/ 100000) % 10), tenPower[0], doubleDigit, singleDigit);
    output += "thousand ";
  }else if (n % 1000000 >= 110000) {
    output += numberToWord(((n ~/ 100000) % 10), tenPower[0], doubleDigit, singleDigit);
    if(n>100000 && ((n/1000) %10) != 0 ){
      output += "and ";
    }
    output += numberToWord(((n ~/ 1000) % 100), tenPower[1], doubleDigit, singleDigit);
  } else if((n ~/ 1000) % 100 < 10  && n >= 100000){
    output += numberToWord(((n ~/ 100000) % 10), tenPower[0], doubleDigit, singleDigit);
    output += numberToWord(((n ~/ 1000) % 10), tenPower[1], doubleDigit, singleDigit);
  } else if (n >= 10000) {
    output += numberToWord(((n ~/ 1000) % 100), tenPower[1], doubleDigit, singleDigit);
  } else {
    output += numberToWord(((n ~/ 1000) % 100), tenPower[1], doubleDigit, singleDigit);
  }


  //For hundreds
  output +=numberToWord(((n ~/ 100) % 10), tenPower[0], doubleDigit, singleDigit);


  if (n > 100 && (n / 10) % 10 > 0) {
    output += "and ";
  }

  //For 10 digits number until a hundred (10 < n <100)
  output += numberToWord((n.toInt() % 100), "", doubleDigit, singleDigit);


  

  if (n == 0) {
    output += "zero";
  }

  

  return output;
}

//We are converting number to words here
numberToWord(int n, String s, List doubleDigit, List singleDigit) {
  String string = "";
  if (n > 19 && n % 10 != 0) {
    string += doubleDigit[n ~/ 10] + "-" + singleDigit[n % 10];
  } else if (n > 19) {
    string += doubleDigit[n ~/ 10] + " " + singleDigit[n % 10];
  } else {
    string += singleDigit[n];
  }

  if (n != 0) {
    string += s;
  }

  return string;
}
