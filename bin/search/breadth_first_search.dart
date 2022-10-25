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
    [4], // 1 node
    [3, 5], // 2 node
    [4], // 3 node
    [6], // 4 node
    [4], // 5 node
    [], // 6 node
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
  final queue = Queue<List<Node>>();

  // hash whe key is node and value is parent scope
  final checked = Set();

  // cursor for scope
  // int cursor = 0;
  queue.add(matrix.first.map((e) => Node(e, Node(0, null))).toList());

  while (queue.isNotEmpty) {
    // take the scope
    final neighbors = queue.removeFirst();

    // iterate through the scope
    for (var neighbor in neighbors) {
      // does alredy checked?
      if (checked.contains(neighbor)) {
        continue;
      } else {
        checked.add(neighbor);
      }

      // if found the node just revert path by parents
      if (neighbor.value == point) {
        Node? node = neighbor;
        final result = <int>[];
        while (node != null) {
          result.add(node.value);
          node = node.prev;
        }

        return result;
      } else {
        // add next scope to queue
        queue.add(matrix[neighbor.value].map((e) => Node(e, neighbor)).toList());
      }
    }
  }

  return [];
}

class Node {
  final Node? prev;
  final int value;
  const Node(this.value, this.prev);
}
