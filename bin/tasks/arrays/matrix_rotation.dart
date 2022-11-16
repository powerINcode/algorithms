/// Rotate Matrix: 
/// Given an image represented by an NxN matrix,
///  where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees. 
/// Can you do this in place?

void main() {
  final matrix = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
    [13, 14, 15, 16],
  ];

  print('Before:');
  print(matrix.join('\n'));
  print('After:');
  print(_rotateAntiClockwise(matrix).join('\n'));
}

// rotate on 90 degrees clockwise
List<List<int>> _rotateClockwise(List<List<int>> matrix) {
  List<List<int>> result = List.generate(matrix.length, (index) => List.generate(matrix.length, ((index) => 0)));

  for (var i = 0; i < matrix.length; i++) {
    for (var j = 0; j < matrix.length; j++) {
      result[i][j] = matrix[matrix.length - 1 - j][i];
    }
  }

  return result;
}

// rotate on 90 degrees anti-clockwise
List<List<int>> _rotateAntiClockwise(List<List<int>> matrix) {
  List<List<int>> result = List.generate(matrix.length, (index) => List.generate(matrix.length, ((index) => 0)));

  for (var i = 0; i < matrix.length; i++) {
    for (var j = 0; j < matrix.length; j++) {
      result[i][j] = matrix[j][matrix.length - 1 - i];
    }
  }

  return result;
}
