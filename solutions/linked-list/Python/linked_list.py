class Node:
    def __init__(self, value, succeeding=None, previous=None):
        self.value = value
        self.succeeding = succeeding
        self.previous = previous

class LinkedList:
    def __init__(self):
        self.head = None
        self.tail = None

    def push(self, value):
        n = Node(value, None, self.tail)
        if self.tail:
            self.tail.succeeding = n
        self.tail = n
        if self.head == None:
            self.head = n

    def unshift(self, value):
        n = Node(value, self.head, None)
        if self.head:
            self.head.previous = n
        self.head = n
        if not self.tail:
            self.tail = n

    def pop(self):
        n = self.tail
        self.tail = n.previous
        if not self.tail:
            self.head = None

        return n.value
    def shift(self):
        n = self.head
        self.head = n.succeeding
        if not self.head:
            self.tail = None

        return n.value
