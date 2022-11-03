import 'dart:collection';

///
/// Name:         Dynamic algorithm
/// Description:  Algorithms to solve required to split task on smaller tasks and resolve them first
/// Task:         You have phone with battery capacity 50mAh and which acticities will allow you make more
///
/// read a book   - 10 mAh
/// watch youtube - 40 mAh
/// play game     - 50 mAh

void main() {
  final capacity = 4;
  final guitar = 'guitar';
  final stereo = 'stereo';
  final laptop = 'laptop';
  final iphone = 'iphone';
  final costs = <String, int>{
    guitar: 1500,
    stereo: 3000,
    laptop: 2000,
    iphone: 2000,
  };

  final slotWeight = [1, 2, 3, 4];
  final items = <int, String>{
    0: guitar,
    1: stereo,
    2: laptop,
    3: iphone,
  };
  final itemWeights = {guitar: 1, stereo: 4, laptop: 3, iphone: 1};

  final matrix = [
    [
      Cell.empty(),
      Cell.empty(),
      Cell.empty(),
      Cell.empty(),
    ],
    [
      Cell.empty(),
      Cell.empty(),
      Cell.empty(),
      Cell.empty(),
    ],
    [
      Cell.empty(),
      Cell.empty(),
      Cell.empty(),
      Cell.empty(),
    ],
    [
      Cell.empty(),
      Cell.empty(),
      Cell.empty(),
      Cell.empty(),
    ],
  ];

  for (var row = 0; row < matrix.length; row++) {
    for (var cell = 0; cell < capacity; cell++) {
      final item = items[row]!;
      final currentSlotWeight = slotWeight[cell];
      final itemWeight = itemWeights[item]!;
      final itemPrice = costs[item]!;

      if(itemWeight < currentSlotWeight) {
        if(row > 0) {
          final remainWeight = currentSlotWeight - itemWeight;
          final prevItem = matrix[row-1][remainWeight - 1];
          matrix[row][cell] = Cell([item, ...prevItem.values]);
        } else {
            matrix[row][cell] = Cell([item]);
        }
      }

      if(itemWeight == currentSlotWeight) {
        if(row > 0) {
          final prevItem = matrix[row - 1][cell];
          final prevItemPrice = prevItem.values.map((e) => costs[e]!).reduce((sum, value) => sum + value);
          if(itemPrice > prevItemPrice) {
            matrix[row][cell] = Cell([item]);
          } else {
            matrix[row][cell] = prevItem;
          }
        } else {
          matrix[row][cell] = Cell([item]);
        }
      }

      if(itemWeight > currentSlotWeight) {
        matrix[row][cell] = matrix[row - 1][cell];
      }
    }
  }

  print(matrix.last.last);
}

class Cell {
  final List<String> values;

  Cell(this.values);

  factory Cell.empty() => Cell([]);

  @override
  String toString() {
    return values.join(',') + ';';
  }
}
