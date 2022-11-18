import 'node.dart';

// Loop Detection:
// Given a circular linked list, implement an algorithm that returns the node at the beginning of the loop.
// DEFINITION
// Circular linked list: A (corrupt) linked list in which a node's next pointer points to an earlier node, 
// so as to make a loop in the linked list.
// EXAMPLE
// Input: A -> B -> C -> D -> E -> C[the same C as earlier]
// Output: C

void main() {
  final input = Node.from(['A', 'B', 'C', 'D', 'E']);
  input.next?.next?.next?.next?.next = input.next?.next;

  final result = _findLoop(input);
  print(result == null ? null : result.data);
}

Node<String>? _findLoop(Node<String> head) {
  Node<String>? slow = head.next;
  Node<String>? fast = head.next?.next;

  while (fast?.next != null) {
    if (slow?.data == fast?.data) {
      print('${slow?.data} == ${fast?.data}');
      break;
    }

    print('${slow?.data} != ${fast?.data}');
    slow = slow?.next;
    fast = fast?.next?.next;
  }

  if (slow?.data != fast?.data) {
    return null;
  }

  slow = head;
  while (slow?.data != fast?.data) {
    print('${slow?.data} != ${fast?.data}');
    slow = slow?.next;
    fast = fast?.next;
  }

  return slow;
}
