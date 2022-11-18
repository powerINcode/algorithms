
import 'dart:math';
import 'node.dart';

/// Sum Lists: You have two numbers represented by a linked list, where each node contains a single digit.
/// The digits are stored in reverse order, such that the 1 's digit is at the head of the list. 
/// Write a function that adds the two numbers and returns the sum as a linked list.
/// EXAMPLE
/// Input:(7-> 1 -> 6) + (5 -> 9 -> 2).That is 617 + 295. 
/// Output:2 -> 1 -> 9. That is 912.

void main() {
  final input1 = Node.from([7, 1, 6]);
  final input2 = Node.from([5, 9, 2]);
  final sum = _composeValue(input1) + _composeValue(input2);
  
  print(_decomposeValue(sum));
}

int _composeValue(Node<int> head) {
  int value = 0;
  int counter = 0;
  Node<int>? cursor = head;
  while(cursor != null) {
    value += cursor.data * pow(10, counter).toInt();
    cursor = cursor.next;
    counter++;
  }

  return value;
}

Node<int> _decomposeValue(int value) {
  int result = value;
  Node<int>? head = null;
  Node<int>? cursor = null;
  
  while(result != 0) {
    final node = Node(result % 10, null);
    if(head == null) {
      head = node;
      cursor = head;
    } else {
      cursor?.next = node;
      cursor = node;
    }
    result = result ~/ 10;
  }

  return head ?? Node(0, null);
}
