import 'dart:math';

///
/// Name:         Dynamic algorithm
/// Description:  Algorithms to solve required to split task on smaller tasks and resolve them first
///               Important: each small task should be indepepended(exclude such situation when after some steps value can change)
/// Task:         Find longest substring for initial string. (User try to write 'Fish' but make a type 'Fosh', we have to find
///               longest substring for available options: Fish and Vista

void main() {
  const input = 'Fosh';
  const database = ['Fish', 'Fort', 'Vista'];
  final results = <int>[];
  results.addAll(database.map((e) => _findSubstring(input, e)));
  print('Input: $input');  
  results.asMap().keys.forEach((element) {
    print('${database[element]} equality length is ${results[element]}');
   });
  print('Winner is ${database[results.indexOf(results.reduce(max))]}');
}

int _findSubstring(String input, String suggestion) {
  List<List<int>> matrix = List.generate(
      suggestion.length, (index) => List.generate(input.length, (_) => 0));
  for (var row = 0; row < suggestion.length; row++) {
    for (var i = 0; i < input.length; i++) {
      final inputChar = input[i];
      final suggestionChar = suggestion[row];

      final prevRow = row > 0 ? row - 1 : row;
      final prevCell = i > 0 ? i - 1 : i;

      if (inputChar == suggestionChar) {
        matrix[row][i] = matrix[prevRow][prevCell] + 1;
      } else {
        matrix[row][i] = max(matrix[prevRow][i], matrix[row][prevCell]);
      }
    }
  }
  return matrix.last.last;
}
