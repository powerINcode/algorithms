/// Is Unique: Implement an algorithm to determine if a string has all unique characters.
/// What if you cannot use additional data structures?
///
void main() {
  final unique = 'helo';
  final notUnique = 'hello';

  print(_isUnique(unique));
  print(_isUnique(notUnique));
}

bool _isUnique(String input) {
  String output = '';
  for (var i = 0; i < input.length; i++) {
    if (!output.contains(input[i])) {
      output += input[i];
    } else {
      return false;
    }
  }

  return true;
}
