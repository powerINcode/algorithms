/// One Away:
/// There are three types of edits that can be performed on strings: insert a character, remove a character, or replace a character.
/// Given two strings, write a function to check if they are one edit (or zero edits) away.
/// EXAMPLE
// pale, pvale -> true
// pales, pale -> true
// pale, bale -> true
// pale, bake -> false

void main() {
  final input = 'pale';
  final output1 = 'ple';
  final output2 = 'pales';
  final output3 = 'bale';
  final output4 = 'bake';
  
  print(_isOneWay(input, output1));
  print(_isOneWay(input, output2));
  print(_isOneWay(input, output3));
  print(_isOneWay(input, output4));
}

bool _isOneWay(String input, String output) {
  int counter = 0;
  if (input.length != output.length) {
    final larger = input.length > output.length ? input : output;
    final smaller = input.length > output.length ? output : input;

    if (larger.length - smaller.length > 1) {
      return false;
    }

    int backwardCursor = 0;
    for (int i = 0; i < larger.length; i++) {
      if(i - backwardCursor >= smaller.length) {
        counter++;
        break;
      }
      if(larger[i] != smaller[i - backwardCursor]) {
       counter++;
       backwardCursor++;
      }

      if(counter > 1 || backwardCursor > 1) {
        return false;
      }
    }
  } else {
    for (var i = 0; i < input.length; i++) {
      if(input[i] != output[i]) {
        counter++;
      }

      if(counter > 1) {
        return false;
      }
    }
  }

  return counter <= 1;
}
