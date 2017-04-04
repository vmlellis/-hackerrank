/*
Detect a cycle in a linked list. Note that the head pointer may be 'null' if the list is empty.

A Node is defined as:
    class Node {
        int data;
        Node next;
    }
*/

boolean hasCycle(Node head) {
    if (head == null || head.next == null) return false;

    ArrayList<Node> passed = new ArrayList<Node>();
    Node current = head;
    passed.add(current);

    while (current.next != null) {
        if (passed.contains(current.next)) return true;
        passed.add(current.next);
        current = current.next;
    }

    return false;
}
