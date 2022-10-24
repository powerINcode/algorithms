///
/// Name:         Binary search
/// Apply:        Only sorted lists
/// Complexity:   O(log n)
/// 
void main() {
  final sortedList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  final targetLessMiddle = 3;
  print(
    'Target is $targetLessMiddle and index should be ${sortedList.indexOf(targetLessMiddle)}. Result: ${_binarySearch(target: targetLessMiddle, list: sortedList)}',
  );

  final targetBiggerMiddle = 8;
  print(
    'Target is $targetBiggerMiddle and index should be ${sortedList.indexOf(targetBiggerMiddle)}. Result: ${_binarySearch(target: targetBiggerMiddle, list: sortedList)}',
  );

  final targetIsNotPresent = 11;
  print(
    'Target is $targetIsNotPresent and index should be -1. Result: ${_binarySearch(target: targetIsNotPresent, list: sortedList)}',
  );
}

///
/// Apply search based on [target]
/// in the sorted [list]
int _binarySearch({
  required int target,
  required List<int> list,
}) {
  // Base case
  if (list.length == 1) {
    return list.first == target ? list.first : -1;
  }

  // get middle of the current list
  final mid = list.length ~/ 2;
  final result = list[mid];

  if (result == target) {
    return mid;
  }

  // reduce list amount depending on the result
  if (target < result) {
    return _binarySearch(target: target, list: list.sublist(0, mid));
  } else {
    final result = _binarySearch(target: target, list: list.sublist(mid, list.length));
    return result == -1 ? -1 : mid + result;
  }
}
