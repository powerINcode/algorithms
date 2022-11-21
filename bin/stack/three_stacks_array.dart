// Three in One: Describe how you could use a single array to implement three stacks.
// Example
// [null, null, null, null, null, null] => [null, null]; [null, null]; [null, null];

void main() {
  final stackArray = StackArray(stackCapacity: 2, stacks: 3);
  stackArray.push(stack: 2, value: 'a');
  print('Push value to stack 2:\n$stackArray');
  stackArray.push(stack: 2, value: 'b');
  print('Push value to stack 2:\n$stackArray');
  stackArray.pop(stack: 2);
  print('Pop value from stack 2:\n$stackArray');
  stackArray.peek(stack: 2);
  print('Peek value to stack 2:\n$stackArray');
  stackArray.pop(stack: 2);
  print('Pop value to stack 2:\n$stackArray');
}

class StackArray<T> {
  final int stacks;
  final int stackCapacity;

  late List<T?> _array;
  final List<int> _stackStarts = [];
  final List<int> _stackEnds = [];
  final List<int> _stackHeads = [];

  StackArray({required this.stacks, required this.stackCapacity}) {
    _array = List.generate(stacks * stackCapacity, (index) => null);
    for (var i = 0; i < stacks; i++) {
      _stackStarts.add(i * stackCapacity);
      _stackEnds.add((i + 1) * stackCapacity);
    }

    _stackHeads.addAll(_stackStarts.toList());
  }

  void push({required int stack, required T value}) {
    if(stack < 0 || stack >= stacks) {
      throw Exception('Exceed stacks ammount');
    }
    if (_stackHeads[stack] >= _stackEnds[stack]) {
      throw Exception('Stack $stack is full');
    }

    final head = _stackHeads[stack];
    _array[head] = value;
    _stackHeads[stack] = head + 1;
  }

  T? pop({required int stack}) {
    if(stack < 0 || stack >= stacks) {
      throw Exception('Exceed stacks ammount');
    }
    if (_stackHeads[stack] <= _stackStarts[stack]) {
      throw Exception('Stack $stack is empty');
    }

    final head = _stackHeads[stack] - 1;
    final value = _array[head];
    _array[head] = null;
    _stackHeads[stack] = head;

    return value;
  }

  T? peek({required int stack}) {
    if(stack < 0 || stack >= stacks) {
      throw Exception('Exceed stacks ammount');
    }
    if (_stackHeads[stack] <= _stackStarts[stack]) {
      throw Exception('Stack $stack is empty');
    }

    final head = _stackHeads[stack] - 1;
    final value = _array[head];

    return value;
  }

  @override
  String toString() {
    return _array.toString();
  }
}
