/// Stack Min: 
/// How would you design a stack which, in addition to push and pop, 
/// has a function min which returns the minimum element? 
/// Push, pop and min should all operate in 0(1) time.

void main() {
  final stack = MyStack();
  print('== push ==');
  stack.push(2);
  print(stack);
  stack.push(3);
  print(stack);
  stack.push(1);
  print(stack);

  print('== min ==');
  print(stack.min());

  print('== pop ==');
  stack.pop();
  print(stack);
  stack.pop();
  print(stack);
  stack.pop();
  print(stack);
}

class MyStack {
  _Node<int>? _minHead;
  _Node<int>? _head;

  void push(int value) {
    final node = _Node(value);
    if(_minHead == null) {
      _minHead = node;
    } else {
      final minHead = _Node(_minHead!.data);
      
      if(minHead.data > node.data) {
        final newMinHead = _Node(node.data);
        newMinHead.next = minHead;
        _minHead = newMinHead;
      }
    }

    if(_head == null) {
      _head = node;
    } else {
      node.next = _head;
     _head = node;
    }
  }
  
  int? pop() {
    final head = _head;
    if(head == null) {
      return null;
    }

    final value = head.data;
    _head = _head?.next;

    if(head.data == _minHead?.data) {
      _minHead = _minHead?.next;
    }

    return value;

  }

  int? min() {
    return _minHead?.data;
  }

  @override
  String toString() {
    return 'Min value: ${_minHead?.data ?? -1}\nValues: ${_printNode(_head)}';
  }

  String _printNode(_Node? node) {
    if(node == null) {
      return '';
    }
    return '${node.data}; ${_printNode(node.next)}';
  }
}

class _Node<T> {
  final T data;
  
  _Node<T>? next;

  _Node(this.data);
}