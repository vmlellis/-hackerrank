/* Hidden stub code will pass a root argument to the function below. Complete the function to solve the challenge. Hint: you may want to write one or more helper functions.

The Node class is defined as follows:
    class Node {
        int data;
        Node left;
        Node right;
     }
*/

    boolean checkNode(Node node) {
        //System.out.println(node.data);
        if (node.left != null) {
            if (node.left.data >= node.data) return false;
            if (!checkNode(node.left)) return false;
            if (getMax(node.left) >= node.data) return false;
        }

        if (node.right != null) {
            if (node.right.data <= node.data) return false;
            if (!checkNode(node.right)) return false;
            if (getMin(node.right) <= node.data) return false;
        }

        if (node.left != null && node.right != null) {
            if (getMax(node.left) >= getMin(node.right)) return false;
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
            v = getMax(node.left, v);
        }

        if (node.right != null) {
            if (node.right.data > v) v = node.right.data;
            v = getMax(node.right, v);
        }
        return v;
    }

    Integer getMin(Node node, Integer v) {
        if (node.left != null) {
            if (node.left.data < v) v = node.left.data;
            v = getMax(node.left, v);
        }

        if (node.right != null) {
            if (node.right.data < v) v = node.right.data;
            v = getMax(node.right, v);
        }
        return v;
    }

    boolean checkBST(Node root) {
        if (root == null) return false;
        // System.out.println(root.data);
        return checkNode(root);
    }
