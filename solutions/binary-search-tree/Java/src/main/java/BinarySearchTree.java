import java.util.ArrayList;
import java.util.List;
import java.util.Queue;
import java.util.ArrayDeque;

class BinarySearchTree<T extends Comparable<T>> {
    private Node<T> root = null;

    void insert(T value) {
        root = insert(root, value);
    }

    private Node<T> insert(Node<T> node, T value) {
        if (node == null)
            return new Node<>(value);
        if (value.compareTo(node.getData()) > 0)
            node.right = insert(node.right, value);
        else
            node.left = insert(node.left, value);
        return node;
    }

    public List<T> getAsSortedList() {
        return get(root);
    }

    private List<T> get(Node<T> pos) {
        if (pos == null)
            return new ArrayList<>();
        List<T> res = get(pos.getLeft());
        res.add(pos.getData());
        res.addAll(get(pos.getRight()));
        return res;
    }

    public List<T> getAsLevelOrderList() {
        List<T> res = new ArrayList<>();
        Queue<Node<T>> queue = new ArrayDeque<>();
        queue.add(root);
        while (!queue.isEmpty()) {
            Node<T> pos = queue.poll();
            res.add(pos.getData());
            if (pos.getLeft() != null)
                queue.add(pos.getLeft());
            if (pos.getRight() != null)
                queue.add(pos.getRight());
        }
        return res;
    }

    public Node<T> getRoot() {
        return root;
    }

    static class Node<T> {
        private final T data;
        private Node<T> left;
        private Node<T> right;

        public Node(T value) {
            data = value;
        }

        public T getData() {
            return data;
        }

        public Node<T> getLeft() {
            return left;
        }

        public Node<T> getRight() {
            return right;
        }
    }
}