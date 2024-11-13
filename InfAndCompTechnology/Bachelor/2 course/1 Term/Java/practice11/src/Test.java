public class Test {
    public static void main(String[] args) {
        StackOnQueue<Integer> stack = new StackOnQueue<>();
        stack.push(1);
        stack.push(2);
        System.out.println(stack.peek());
        System.out.println(stack.pop());
        System.out.println(stack.isEmpty());
        StackOnQueue<Integer> temp = new StackOnQueue<>(stack);
        while(!temp.isEmpty()){
            System.out.println(temp.pop());
        }
        System.out.println(stack.isEmpty());
    }
}
