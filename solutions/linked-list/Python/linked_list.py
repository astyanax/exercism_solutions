class Node:
    def __init__(self, value, succeeding=None, previous=None):
        self.value = value
        self.succeeding = succeeding
        self.previous = previous

class LinkedList:
    def __init__(self):
        self.head = None
        self.tail = None
        self.length = 0

    def __len__(self):
        return self.length

    def __iter__(self):
        n = self.head
        while n is not None:
            yield n.value
            n = n.succeeding

    def delete(self, value):
        n = self.head
        while n is not None:
            if n.value == value:
                break
            n = n.succeeding
        else:
            raise ValueError("Value not found")
        if n.previous is not None:
            n.previous.succeeding = n.succeeding
        if n.succeeding is not None:
            n.succeeding.previous = n.previous
        if n == self.head:
            self.head = n.succeeding
        if n == self.tail:
            self.tail = n.previous
        self.length -= 1

    def push(self, value):
        n = Node(value, None, self.tail)
        if self.tail:
            self.tail.succeeding = n
        self.tail = n
        if self.head == None:
            self.head = n
        self.length += 1

    def pop(self):
        if self.length == 0:
            raise IndexError("List is empty")
        n = self.tail
        self.tail = n.previous
        if not self.tail:
            self.head = None
        else:
            self.tail.succeeding = None
        self.length -= 1
        return n.value

    def shift(self):
        if self.length == 0:
            raise IndexError("List is empty")
        n = self.head
        self.head = n.succeeding
        if self.head is None:
            self.tail = None
        else:
            self.head.previous = None
        self.length -= 1
        return n.value

    def unshift(self, value):
        n = Node(value)
        n.succeeding = self.head
        if self.head is None:
            self.tail = n
        else:
            self.head.previous = n
        self.head = n
        self.length += 1
