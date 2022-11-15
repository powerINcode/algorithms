// URLify: Write a method to replace all spaces in a string with '%20'.
// You may assume that the string has sufficient space at the end to hold the additional characters,
// and that you are given the "true" length of the string.
/// EXAMPLE
/// Input: "Mr John Smith ", 13
/// Output: "Mr%20John%20Smith"

void main() {
  final input = 'Mr John Smith    ';
  print(_urlify(input, '%20'));
}

String _urlify(String input, String separator) {
  String result = '';
  bool spaceFound = false;
  for (var i = 0; i < input.length; i++) {
    final char = input[i];
    if (char == ' ') {
      spaceFound = true;
    } else {
      if (spaceFound) {
        result += separator;
        spaceFound = false;
      }
      result += input[i];
    }
  }

  return result;
}
