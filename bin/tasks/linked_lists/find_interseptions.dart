import 'node.dart';

/// Intersection: 
/// Given two (singly) linked lists, determine if the two lists intersect. 
/// Return the inter­ secting node. Note that the intersection is defined based on reference, not value.
/// That is, if the kth node of the first linked list is the exact same node (by reference) as the jth node of the second linked list, 
/// then they are intersecting.
void main() {
  final interception = Node.from([10, 5, 2, 11]);
  final input1 = Node.from([1, 3, 8, 10, 14]);
  final input2 = Node.from([
    89,
    52,
  ]);

  _append(input1, interception);
  _append(input2, interception);

  final input1Length = _getCount(input1);
  final input2Length = _getCount(input2);

  if (input1Length > input2Length) {
    print(_isIntercept(_skip(input1, input1Length - input2Length)!, input2));
  } else {
    print(_isIntercept(_skip(input2, input2Length - input1Length)!, input1));
  }
}

bool _isIntercept(Node<int> input1, Node<int> input2) {
  Node<int>? cursor1 = input1;
  Node<int>? cursor2 = input2;

  while(cursor1 != null && cursor2 != null) {
    if(cursor1 == cursor2) {
      return true;
    } 

    cursor1 = cursor1.next;
    cursor2 = cursor2.next;
  }

  return false;
}

Node<int>? _skip(Node<int> input, int skip) {
  int counter = 0;
  Node<int>? cursor = input;

  while (counter < skip) {
    cursor = cursor?.next;
    counter++;
  }

  return cursor;
}

int _getCount(Node<int> input) {
  int counter = 0;
  Node<int>? cursor = input;

  while (cursor != null) {
    counter++;
    cursor = cursor.next;
  }

  return counter;
}

void _append(Node<int> origin, Node<int> append) {
  Node<int>? cursor = origin;
  while (cursor?.next != null) {
    cursor = cursor?.next;
  }

  cursor?.next = append;
}
