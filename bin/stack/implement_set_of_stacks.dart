import 'dart:math';

/// Stack of Plates:
/// Imagine a (literal) stack of plates. If the stack gets too high, it might topple.
/// Therefore, in real life, we would likely start a new stack when the previous stack exceeds some threshold.
/// Implement a data structure SetOfStacks that mimics this. SetOfStacks should be composed of several stacks and should create a new stack once the previous one exceeds capacity.
/// SetOfStacks. push() and SetOfStacks. pop() should behave identically to a single stack (that is, pop() should return the same values as it would if there were just a single stack).
/// FOLLOW UP
/// Implement a function popAt(int index) which performs a pop operation on a specific sub-stack.

void main() {
  final stack = SetOfStacks(2);

  stack.push(1);
  print(stack);
  stack.push(2);
  print(stack);
  stack.push(3);
  print(stack);
  stack.push(4);
  print(stack);
  print('== popAt 0 ==');
  stack.popAt(0);
  print(stack);
  print('== pop ==');
  stack.pop();
  print(stack);
  stack.pop();
  print(stack);
  stack.pop();
  print(stack);
  final value = stack.pop();
  print(stack);
  print(value);
}

class SetOfStacks<T> {
  final int capacity;
  final Map<int, _Stack<T>> _map = {};
  int _cursor = 0;
  final Map<int, int> _capacities = {};

  SetOfStacks(this.capacity);

  void push(T value) {
    if(_capacities[_cursor] == null) {
      _capacities[_cursor] = 0;
    }
    final cursorCapacity = _capacities[_cursor]! + 1; 

    if (cursorCapacity > capacity) {
      _capacities[_cursor] = cursorCapacity - 1;
      _cursor++;
      _capacities[_cursor] = 1;
    } else {
      _capacities[_cursor] = _capacities[_cursor]! + 1;
    }

    if (_map[_cursor] == null) {
      _map[_cursor] = _Stack<T>();
    }

    final stack = _map[_cursor]!;
    stack.push(value);
  }

  T? pop() {
    int cursorCapacity = _capacities[_cursor]! - 1; 
    if (cursorCapacity < 0) {
      _cursor--;

      if(_cursor < 0) {
        _cursor = 0;
      }

       cursorCapacity = max(_capacities[_cursor]! - 1, 0);
    } 
    
    _capacities[_cursor] = cursorCapacity;

    final value = _map[_cursor]?.pop();
    return value;
  }

  T? popAt(int stackIndex) {
    if (stackIndex < 0 || stackIndex > _cursor) {
      return null;
    }

    int cursorCapacity = _capacities[stackIndex]!; 

    if (cursorCapacity < 0) {
      return null;
    } else {
      _capacities[stackIndex] = max(_capacities[stackIndex]! - 1, 0);
    }

    final value = _map[stackIndex]?.pop();
    return value;
  }

  @override
  String toString() {
    return 'Cursor: $_cursor; Capacity: ${_capacities[_cursor]!}';
  }
}

class _Stack<T> {
  _Node<T>? _head;

  void push(T value) {
    if (_head == null) {
      _head = _Node(value);
      return;
    }

    final node = _Node(value);
    node.next = _head;
    _head = node;
  }

  T? pop() {
    if (_head == null) {
      return null;
    }

    final value = _head?.data;
    _head = _head?.next;

    return value;
  }
}

class _Node<T> {
  final T data;
  _Node<T>? next;

  _Node(this.data);
}
