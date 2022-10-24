import 'dart:collection';

///
/// Name:         Breadth-first search (поиск в ширину)
/// Apply:        Graphs
/// Reason:       Find shorted way by nodes count
/// Restriction:  value fron 1 to infinity
/// Complexity:   O(n)
///
void main() {
  //      1     4
  //     *------*
  //  0/      / | \  6
  //  *    3 *  |   *
  //   \   /    |
  //     *-----*
  //     2      5
  final matrix = <List<int>>[
    [1, 2], // 0 node
    [4],    // 1 node
    [3, 5], // 2 node
    [4],    // 3 node
    [6],    // 4 node
    [4],    // 5 node
    [],     // 6 node
  ];

  print(_breadthFirstSearch(matrix: matrix, point: 6));
}

///
/// Looking the shortest way to [point] in the [matrix]
/// where column is node and row is neighbors
///
List<int> _breadthFirstSearch({
  required List<List<int>> matrix,
  required int point,
}) {
  // set global queue
  final queue = Queue<List<int>>();
  
  // hash whe key is node and value is parent scope
  final path = {};
  final checked = Set();
  
  // cursor for scope
  int cursor = 0;
  queue.add(matrix.first);

  while (queue.isNotEmpty) {
    // take the scope
    final neighbors = queue.removeFirst();
    cursor = matrix.indexOf(neighbors);

    // iterate through the scope
    for (var neighbor in neighbors) {
      
      // does alredy checked?
      if (checked.contains(neighbor)) {
        continue;
      } else {
        checked.add(neighbor);
      }

      path[neighbor] = cursor;
      
      // if found the node just revert path by parents
      if (neighbor == point) {
        int? node = point;
        final result = [point];
        while (path[node] != null) {
          result.add(path[node]);
          node = result.last;
        }

        return result;
      } else {
        
        // add next scope to queue
        queue.add(matrix[neighbor]);
      }
    }
  }

  return [];
}
