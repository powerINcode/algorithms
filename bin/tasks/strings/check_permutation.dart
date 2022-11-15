/// Check Permutation: Given two strings,write a method to decide if one is a permutation of the
/// other
///
void main() {
  final substring = 'asd';
  final input = 'adss';

  print(_checkPermutration(input, substring));
}

List<String> _checkPermutration(String input, String substring) {
  final result = <String>[];
  final Map<String, int> substringMap = {};
  // convert string to map with amount of repeptative characters
  for (var i = 0; i < substring.length; i++) {
    final char = substring[i];
    if (substringMap[char] == null) {
      substringMap[char] = 1;
    } else {
      substringMap[char] = substringMap[char]! + 1;
    }
  }

  for (var i = 0; i < input.length; i++) {
    final char = input[i];
    // if char contains in substring try to check next symbols
    if (substringMap.containsKey(char)) {
      final Map<String, int> permutrationMap = {};
      for (var j = 0; j < substring.length; j++) {
        if(i + j >= input.length) {
          break;
        }

        final permutrationChar = input[i + j];
        if (substringMap.containsKey(permutrationChar)) {
          permutrationMap[permutrationChar] =
              (permutrationMap[permutrationChar] ?? 0) + 1;
          if (substringMap[permutrationChar]! <
              permutrationMap[permutrationChar]!) {
            continue;
          }
        } else {
          continue;
        }
      }

     if(substringMap.length == permutrationMap.length) {
       result.add(input.substring(i, i + substring.length));
     }
    }
  }

  return result;
}
