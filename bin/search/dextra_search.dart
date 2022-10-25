
///
/// Name:         Dextra search algorithm
/// Apply:        Graphs
/// Reason:       Find shorted way by nodes in directed graph with non-negative weights
/// Restriction:  Directed graphwith non-negative weights
/// Complexity:   O(E log V), E - verticles, V - edges
///
void main() {
  //      1     3
  //     *-----*
  //    5 20  / 20
  //  0/    \/    \
  //  *     /\     * 5
  //   \   15 \   /
  //    0 /    \ 10
  //     *------*
  //     2      4
  final matrix = [
    [-1, 5, 0, -1, -1, -1],   // start
    [-1, -1, -1, 15, 20, -1], // plastinka
    [-1, -1, -1, 30, 35, -1], // poster
    [-1, -1, -1, -1, -1, 20], // gitar
    [-1, -1, -1, -1, -1, 10], // baraban
    [-1, -1, -1, -1, -1, -1], // finish
  ];

  print(_dextraSearch(matrix: matrix));
}

///
/// Looking the shortest way to [point] in the [matrix]
/// where column is node and row is neighbors
///
List<int> _dextraSearch({
  required List<List<int>> matrix
}) {
  final costs = List.generate(matrix.length, (index) => 999);
  costs[0] = 0; 
  int origin = 0;
  final checked = Set();
  final parents = {};

  for (var row = 0; row < costs.length; row++) {
    for (var node = 0; node < costs.length; node++) {
      final originCost = matrix[origin][node];
      if(originCost < 0) {
        continue;
      }

      final newCost = origin + originCost;
      if(newCost < costs[node]) {
        costs[node] = newCost;
        parents[node] = origin;
      }
    }
    checked.add(origin);

    int min = 999;
    int minIndex = 999;

    for (var i = 0; i < costs.length; i++) {
      if(checked.contains(i)) {
        continue;
      }

      final value = costs[i];
      if(value < min) {
        min = value;
        minIndex = i;
      }
    }

    origin = minIndex;
  }

  int cursor = matrix.length - 1;
  final path = [cursor];
  while(cursor != 0) {
    final nextCursor = parents[cursor];
    path.insert(0, nextCursor);
    cursor = nextCursor;
  }
  
  return path;
}
