///
/// Name:         Dynamic algorithm
/// Description:  Algorithms to solve required to split task on smaller tasks and resolve them first
///               Important: each small task should be indepepended(exclude such situation when after some steps value can change)
/// Task:         You have vah with 4 kg capacity and you have to decide what items you can take to acieve maximum price
///               Guitar(1kg, 1500$), Stereo(4kg, 3000$), Laptop(3kg, 2000$), IPhone(1kg, 2000$)
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
      // collect all info regarding the item
      final item = items[row]!;
      final currentSlotWeight = slotWeight[cell];
      final itemWeight = itemWeights[item]!;
      final itemPrice = costs[item]!;

      // if item weight < current slot max weight then we have to add value from remain size
      // example, weight 3 and slot weight is 4, remain amount is 1, we check what was filled
      // before for 1 size
      if(itemWeight < currentSlotWeight) {
        if(row > 0) {
          final remainWeight = currentSlotWeight - itemWeight;
          final prevItem = matrix[row-1][remainWeight - 1];
          matrix[row][cell] = Cell([item, ...prevItem.values]);
        } else {
            matrix[row][cell] = Cell([item]);
        }
      }

       // if item weight == current slot max weight then we compare value from prevouse calculation
       // if current value beigger then we write it if not the prev value
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

      //if item weight > current slot max weight then we just use previouse wrote value because of
      // current slot is too small for item
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
