import 'dart:math';

///
/// Name:         Greedy algorithm
/// Description:  Algorithms that not possible to solve for NP time but they can find optimal solution
/// Task:         Traveling salesman problem: Find optimal route across all points
///                B*
///                / \
///              A*- -*C
///
void main() {
  final names = ['a', 'b', 'c'];
  final routes = [
    [999, 3, 5], // a
    [2, 999, 7], // b
    [3, 5, 999], // c
  ];

  print(_getGreedyRoute(routes, Random().nextInt(routes.length - 1)).map((e) => names[e]));
}

List<int> _getGreedyRoute(List<List<int>> routes, int initial) {
  final checked = Set<int>();
  int cursor = initial;//Random().nextInt(routes.length);
  checked.add(cursor);
  for (var i = 0; i < routes.length - 1; i++) {
    int nextValue = 999;
    for (var j = 0; j < routes.length; j++) {
      if (!checked.contains(j)) {
        nextValue = min(routes[cursor][j], nextValue);
      }
    }
    final nextIndex = routes[cursor].indexOf(nextValue);
    checked.add(nextIndex);
    cursor = nextIndex;
  }

  return checked.toList();
}
