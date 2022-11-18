import 'node.dart';

/// Partition: Write code to partition a linked list around a value x,
/// such that all nodes less than x come before all nodes greater than or equal to x.
/// If x is contained within the list, the values of x only need to be after the elements less than x (see below).
/// The partition element x can appear anywhere in the "right partition"; it does not need to appear between the left and right partitions.
/// EXAMPLE
/// [partition=5]
/// Input: 3 -> 5 -> 8 -> 5 -> 10 -> 2 -> 1
/// Output: 3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8

void main() {
  final input = Node.from([3, 5, 8, 5, 10, 2, 1]);

  print(_makePartitionAround(input, 5));
}

Node<int>? _makePartitionAround(Node<int> head, int partition) {
  Node<int>? lessPointer = null;
  Node<int>? lessPointerHead = null;
  Node<int>? greaterPointer = null;
  Node<int>? greaterPointerHead = null;
  Node<int>? cursor = head;

  while (cursor != null) {
    final node = Node(cursor.data, null);
    if (cursor.data < partition) {
      if (lessPointer == null) {
        lessPointer = node;
        lessPointerHead = lessPointer;
      } else {
        lessPointer.next = node;
        lessPointer = lessPointer.next;
      }
    } else {
      if (greaterPointer == null) {
        greaterPointer = node;
        greaterPointerHead = greaterPointer;
      } else {
        greaterPointer.next = node;
        greaterPointer = greaterPointer.next;
      }
    }
    cursor = cursor.next;
  }

  lessPointer?.next = greaterPointerHead;

  return lessPointerHead;
}
