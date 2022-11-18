// Return Kth to Last: 
// Implement an algorithm to find the kth to last element of a singly linked list.
import 'node.dart';

void main() {
  final nLast = 5;
  final input = Node.from([1, 2, 3, 4, 5]);

  print(_returnNfromEnd(input, nLast));
}

Node<int>? _returnNfromEnd(Node<int> head, int n) {
  Node<int>? pointer1 = head;
  Node<int>? pointer2 = null;
  int counter = 0;

  while(pointer1 != null) {
    if(counter == n - 1) {
      pointer2 = head;
    } else if(counter >= n) {
      pointer2 = pointer2?.next;
    }
    counter++;
    pointer1 = pointer1.next;
  }

  return pointer2;
}