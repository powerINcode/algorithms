/// String Compression:
/// Implement a method to perform basic string compression using the counts of repeated characters.
/// For example, the string aabcccccaaa would become a2blc5a3. If the "compressed" string would not become smaller than the original string,
///  your method should return the original string.
/// You can assume the string has only uppercase and lowercase letters (a - z).

void main() {
  final input1 = 'aabcccccaaa';
  final output1 = 'a2b1c5a3';

  final input2 = 'abcd';
  final output2 = 'abcd';

  print(_compress(input1) == output1);
  print(_compress(input2) == output2);
}

String _compress(String input) {
  final Map<String, int> map = {};

  String currentChar = '';
  int currentIndex = 0;
  for (int i = 0; i < input.length; i++) {
    final char = input[i];
    if (currentChar.isEmpty) {
      currentChar = char;
    }

    if (currentChar != input[i]) {
      map[input.substring(currentIndex, i)] = i - currentIndex;
      currentIndex = i;
      currentChar = char;
    }

    if (i == input.length - 1) {
      map[input.substring(currentIndex, input.length)] = input.length - currentIndex;
    }
  }

  final stringTheSame = map.values.every((counter) => counter == 1);
  if (stringTheSame) {
    return input;
  } else {
    return map.keys.map((key) => '${key[0]}${map[key]}').join('');
  }
}
