import 'node.dart';

/// Romove Dups:
/// Write code to remove duplicates from an unsorted linked list.
void main() {
  final input = Node<int>.from([12, 22, 12, 11, 22, 13]);
  final output = Node<int>.from([12, 22, 11, 13]);

  print(_removeDublicates(input) == output);
}

Node<int> _removeDublicates(Node<int> head) {
  final checked = Set<int>();

  Node<int>? pointer = head;
  checked.add(head.data);

  while(pointer?.next != null) {
    if(checked.contains(pointer!.next!.data)) {
      pointer.next = pointer.next!.next;
    } 
    
    checked.add(pointer.data);
    pointer = pointer.next;
  }

  return head;
}