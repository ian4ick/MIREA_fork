import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        MyStack<String> myStack = new MyStack<>();
        Scanner sc = new Scanner(System.in);
        for (int i = 0; i < 5; i++) {
            myStack.push(sc.next());
        }
        for (int i = 0; i < 5; i++) {
            System.out.println(myStack.pop());
        }

    }
}