/* Hidden stub code will pass a root argument to the function below. Complete the function to solve the challenge. Hint: you may want to write one or more helper functions.

The Node class is defined as follows:
    class Node {
        int data;
        Node left;
        Node right;
     }
*/

    boolean checkNode(Node node) {
        int r_min = 0, l_max = 0;
        if (node.left != null) {
            if (node.left.data >= node.data) return false;
            l_max = getMax(node.left);
            if (l_max >= node.data) return false;
            if (!checkNode(node.left)) return false;
        }

        if (node.right != null) {
            if (node.right.data <= node.data) return false;
            r_min = getMin(node.right);
            if (r_min <= node.data) return false;
            if (!checkNode(node.right)) return false;
        }

        if (node.left != null && node.right != null) {
            if (node.left.data >= node.right.data) return false;
            if (l_max >= r_min) return false;
        }

        return true;
    }

    Integer getMax(Node node) {
        return getMax(node, node.data);
    }

    Integer getMin(Node node) {
        return getMin(node, node.data);
    }

    Integer getMax(Node node, Integer v) {
        if (node.left != null) {
            if (node.left.data > v) v = node.left.data;
            int n = getMax(node.left, v);
            if (n > v) v = n;
        }

        if (node.right != null) {
            if (node.right.data > v) v = node.right.data;
            int n = getMax(node.right, v);
            if (n > v) v = n;
        }
        return v;
    }

    Integer getMin(Node node, Integer v) {
        if (node.left != null) {
            if (node.left.data < v) v = node.left.data;
            int n = getMin(node.left, v);
            if (n < v) v = n;
        }

        if (node.right != null) {
            if (node.right.data < v) v = node.right.data;
            int n = getMin(node.right, v);
            if (n < v) v = n;
        }
        return v;
    }

    boolean checkBST(Node root) {
        if (root == null) return false;
        return checkNode(root);
    }
