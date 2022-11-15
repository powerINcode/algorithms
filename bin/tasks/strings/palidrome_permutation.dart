/// Palindrome Permutation: 
/// Given a string, write a function to check if it is a permutation of a palin­ drome. 
/// A palindrome is a word or phrase that is the same forwards and backwards. 
/// A permutation is a rearrangement of letters. The palindrome does not need to be limited to just dictionary words.
// EXAMPLE
// Input: Tact Coa
// Output: True (permutations: "taco cat", "atco eta", etc.)

void main() {
  final input = 'Tact Coa'; 
  print(_isPalidroma(input));
}

bool _isPalidroma(String input) {
  final inputWithoutSpaces = input.replaceAll(' ', '');
  if(inputWithoutSpaces.length % 2 > 1) {
      return false;
  }

final Map<String, int> inputMap = {};
  for (var i = 0; i < inputWithoutSpaces.length; i++) {
    final char = inputWithoutSpaces[i].toLowerCase();
    inputMap[char] = (inputMap[char] ?? 0) + 1;
  }
  
  final nonPalidromaValues = inputMap.keys.where((key) => inputMap[key]! % 2 != 0);
  
  return nonPalidromaValues.length <= 1;
}