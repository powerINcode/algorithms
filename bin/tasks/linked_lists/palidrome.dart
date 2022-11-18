import 'node.dart';

void main() {
  final input = Node.from('А роза упала на лапу Азора'.toLowerCase().replaceAll(' ', '').split(''));
  
  final middle = _getMiddle(input);
  final revert = _revert(middle);
  
  print(_isEqual(input, revert));
}

bool _isEqual(Node<String> input, Node<String> reverted) {
  Node<String>? cursor = input;
  Node<String>? cursorReverted = reverted;

  while(cursorReverted != null) {
    if(cursor == null || cursor.data != cursorReverted.data) {
      return false;
    }

    cursor = cursor.next;
    cursorReverted = cursorReverted.next;
  }

  return true;
}

Node<String> _getMiddle(Node<String> head) {
  Node<String>? cursor1 = head;
  Node<String>? cursor2 = head;

  while(cursor1 != null) {
    cursor1 = cursor1.next?.next;
    cursor2 = cursor2?.next;
  }

  return cursor2!;
}
// k a t o c
// a k t o c
// t a k o c
// o t a k c
// c o t a k  
Node<String> _revert(Node<String> head) {
  Node<String> newHead = Node(head.data, null);
  Node<String>? cursor = head.next;

  while(cursor != null) {
    final tmp = cursor.next;
    newHead = Node(cursor.data, newHead);
    cursor = tmp; 
  }

  return newHead;
}