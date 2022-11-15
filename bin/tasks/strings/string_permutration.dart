
///
/// Name:         Print all possible string permutations
/// Apply:        String
/// Restriction:  String any length
/// Complexity:   O(n!)
///

void main() {
  final input = 'abc';
  final watch = Stopwatch();
  watch.start();
  print(_permutrate(input, []));
  watch.stop();

  print(watch.elapsed.inMilliseconds);
}

/// Main idea in the recurcive go through the string and 
/// pass array of already booked places and
/// each itteration of the substring select first unbooked place, updates booked array in the current scope
/// and pass forward 
List<String> _permutrate(String input, List<int> booked) {
  final result = List<String>.generate(0, (index) => '');
  for(int i = 0; i < input.length; i++) {
    if(booked.contains(i)) {
      continue;
    }
    final currentBookedScope= booked.toList()..add(i);
    final value = _permutrate(input, currentBookedScope);
    //if this is last itteration just add current symbol
    if(value.isEmpty) {
      result.add(input[i]);
    } else {
      result.addAll(value.map((e) => input[i] + e));
    }
  }

  return result;
}
