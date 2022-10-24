///
/// Name:         Quick sort
/// Apply:        Any lists
/// Complexity:   O(n log n)
///
void main() {
  final list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]..shuffle();

  print('Initial list: $list\nFinal list: ${_quickSort(list: list)}');
}

///
/// Apply sorting of [list]
List<int> _quickSort({
    required List<int> list,
  }) {
    // Base case
    if (list.length < 2) {
      return list;
    }

    // take random base value
    final base = list.first;

    // filter vakues less than base
    final lessThanBase = list.where((element) => element < base).toList();
    // filter vakues more than base
    final moreThanBase = list.where((element) => element > base).toList();

    return _quickSort(list: lessThanBase)..add(base)..addAll(_quickSort(list: moreThanBase));
  }
