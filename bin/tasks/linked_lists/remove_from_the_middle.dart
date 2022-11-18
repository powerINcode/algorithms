// Delete Middle Node:
// Implement an algorithm to delete a node in the middle

import 'node.dart';

void main() {
  final input = Node.from(['a', 'b', 'c', 'd', 'e', 'f']);
  final output = Node.from(['a', 'b', 'd', 'e', 'f']);
  print(_removeFromTheMiddle(input) == output);
}

Node<String>? _removeFromTheMiddle(Node<String> head) {
  Node<String>? pointer1 = head;
  Node<String>? pointer2 = head;

  while (pointer1 != null) {
    pointer1 = pointer1.next?.next;
    if (pointer1?.next?.next != null) {
      pointer2 = pointer2?.next;
    }
  }

  pointer2?.next = pointer2.next?.next;

  return head;
}
