import 'dart:math';

///
/// Name:         k-nearest neighbors algorithm
///
/// Description:  Algorithm tries to classify object by nearest neighbors criteria
/// Task:         Suggest movie person by looking favorites movies of other people and comapre with person favorite movie
/// Example       Elis like Comedy(4), Darama(5), Action(1), Andy likes Comedy(5), Drama(4), Action(2), Tonny Comedy(1), Darama(2), Action(5)
///               Еhe smaller the value, the more similar
void main() {
  final genre = {
    0: 'Commedy',
    1: 'Drama',
    2: 'Action',
  };

  const target = 'Elis';
  const elis = [3, 3, 1];
  const neighborNames = {
    0: 'Andy',
    1: 'Tonny',
  };

  const andy = [5, 4, 2];
  const tonny = [1, 2, 5];
  const neighbors = [andy, tonny];
  final result = <double>[];
  result.addAll(neighbors.map((e) => _findClosenessRate(elis, e)));
  result.asMap().keys.forEach((element) {
    print(
        'Equality between $target and ${neighborNames[element]} is ${result[element]}');
  });

  final closestNeighbor = result.reduce(min);
  final nameOfClosestNeighbor = neighborNames[result.indexOf(closestNeighbor)];
  print('$nameOfClosestNeighbor is more closest to $target by interests');
}

double _findClosenessRate(List<int> target, List<int> neighbor) {
  if (target.length != neighbor.length) {
    throw Exception('Neighbors criteria lenghts should be the same');
  }
  double value = 0.0;
  // use the Pythagoras formula: sqrt(pow((x1 - x2), 2) + pow((y1 - y2), 2) + pow((z1 - z2), 2))
  for (var i = 0; i < target.length; i++) {
    final result = pow(target[i] - neighbor[i], 2);
    value += result;
  }

  return sqrt(value);
}
