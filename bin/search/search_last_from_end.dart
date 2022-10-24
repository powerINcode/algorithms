///
/// Name:         Find last from the end in Linked list (TODO)
/// Apply:        Linked list
/// Restriction:  value fron 1 to infinity
/// Complexity:   O(n)
///
void main() {
  final head =
      Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: null)));

  print(_findLastFromEnd(countFromEnd: 1, head: head));
}

int? _findLastFromEnd({
  required int countFromEnd,
  required Node head,
}) {
  Node? cursor = head;
  Node? secondCursor;
  int counter = 0;

  while(cursor != null) {
    if(counter == countFromEnd) {
      secondCursor = head;
    } else {
      if(cursor.next == null && counter == countFromEnd - 1) {
        return cursor.value;
      }

      cursor = cursor.next;
      secondCursor = secondCursor?.next;
    }

    counter++;
  }

  return secondCursor?.value;
}

class Node {
  final int value;
  final Node? next;

  const Node({required this.value, required this.next});
}
