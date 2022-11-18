/// String Rotation:
/// Assumeyou have a method isSubstring which checks if one word is a substring of another. 
/// Given two strings, sl and s2, write code to check 
/// if s2 is a rotation of sl using only one call to isSubstring (e.g.,"waterbottle" is a rotation of"erbottlewat").

void main() {
  final rotation = 'waterbottle';
  final input = 'erbottlewat';
  final inpu2 = 'ttlewaterbo'; 
  print(_isRotation(input, rotation));
}

bool _isRotation(String input, String rotation) {
  if(input == rotation) {
    return true;
  }

  if(input.length != rotation.length) {
    return false;
  }

  final doubleInput = input + input;

  return _isSubstring(doubleInput, rotation);
}

bool _isSubstring(String input, String rotation) {
  return input.contains(rotation);
}
