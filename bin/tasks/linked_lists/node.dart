class Node<T> {
  final T data;
  Node<T>? next;

  Node(this.data, this.next);

  @override
  bool operator ==(Object? other) {
   
    if(other == null || other.runtimeType != this.runtimeType) {
      return false;
    }
    Node<T>? currentPointer = this;
    Node<T>? pointer = other as Node<T>?;
    while(pointer != null || currentPointer != null) {
      if(pointer?.data != currentPointer?.data) {
        return false;
      }

      currentPointer = currentPointer?.next;
      pointer = pointer?.next;
    }

    return pointer?.data == currentPointer?.data && pointer?.next == null && currentPointer?.next == null;
  }

  factory Node.from(List<T> list) {
    if(list.isEmpty) {
      throw Exception('Node should contain at least one value');
    }
    Node<T>? head = null; 
    list.fold<Node?>(null, (previousValue, element) {
      final node = Node(element, null);
      if(previousValue != null) {
         previousValue.next = node;
      } else {
        head = node;
      }

      return node;
    }) as Node<T>;

    return head!;
  }

  @override
  String toString() {
    String result = '';
    Node<T>? pointer = this;
    while(pointer != null) {
      result += pointer.data.toString() + ';';
      pointer = pointer.next;
    }

    return result;
  }
}