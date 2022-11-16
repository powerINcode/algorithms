/// Zero Matrix: 
/// Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to 0.

void main() {
  final matrix = [
    [1, 2, 3, 4],
    [5, 0, 7, 8],
    [9, 10, 11, 12],
    [13, 14, 3, 4],
    [17, 18, 19, 20],
  ];

  print('Before:');
  print(matrix.join('\n'));
  print('After:');
  print(_processZeroMatrix(matrix).join('\n'));
}


List<List<int>> _processZeroMatrix(List<List<int>> matrix) {
  List<List<int>> result = List.generate(matrix.length, (index) => List.generate(matrix[index].length, ((index) => -1)));

  final zeroRows = Set();
  final zeroColumn = Set();
  for (var i = 0; i < matrix.length; i++) {
    final index = matrix[i].indexOf(0);
    if(index >= 0) {
      zeroRows.add(i);
      zeroColumn.add(index);
    }
  }

  for (var i = 0; i < matrix.length; i++) {
    for (var j = 0; j < matrix[i].length; j++) {
      if(zeroRows.contains(i)) {
        result[i][j] = 0;
      } else if(zeroColumn.contains(j)) {
        result[i][j] = 0;
      } else {
        result[i][j] = matrix[i][j];
      }
    }
  }

  return result;
}