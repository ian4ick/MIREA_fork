/*

public class Tree {
    private int key;
    private Tree left;
    private Tree right;
    public Tree(int key) {
        this.key = key;
    }
    public int getKey() {
        return key;
    }
    public int findNumber(Tree root, int goal) {
        if (left == null && right == null) {
            return this.key;
        }
        if (left == null) {
            int b = right.getKey();
            if (b > goal)
                return key;
        }
        int a = left.getKey();
        int b = right.getKey();
        if
        if (a < goal){
            return findNumber(right, goal);
        }
        if (b > goal){
            return findNumber(left, b);
        }
        return goal;
    }
}
*/
