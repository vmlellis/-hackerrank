class Node(object):
    def __init__(self, data = None):
        self.tries = []
        self.data = data
        self.counter = 0

    def get(self):
        return self.data;

    def increment_counter(self):
        self.counter += 1

    def add(self, character):
        node = self.next(character)
        if node is not None:
            node.increment_counter()
            return node
        node = Node(character)
        node.increment_counter()
        self.tries.append(node)
        return node;

    def next(self, character):
        for node in self.tries:
            if node.get() == character:
                return node
        return None

    def partials(self):
        return self.counter

def add_word(node, word):
    current = node
    for c in list(word):
        current = current.add(c)

def find_partial(node, word):
     current = node
     for c in list(word):
        next_node = current.next(c)
        if next_node is None:
            return 0
        current = next_node
     return current.partials()

main = Node()

n = int(input().strip())
for a0 in range(n):
    op, contact = input().strip().split(' ')
    if op == 'add':
        add_word(main, contact)
    elif op == 'find':
        print(find_partial(main, contact))
