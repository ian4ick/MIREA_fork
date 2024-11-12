import java.util.ArrayList;
import java.util.List;

public class MyStack<T> {
    private ArrayList<T> list;
    public MyStack() {
        list = new ArrayList<>();
    }
    public boolean isEmpty() {
        return list.isEmpty();
    }
    public int getSize(){
        return list.size();
    }
    public T peek(){
        return list.getLast();
    }
    public T pop(){
        return list.removeLast();
    }
    public void push(T t){
        list.add(t);
    }
    public MyStack<T> clone(){
        MyStack<T> stack = new MyStack<>();
        stack.list = list;
        return stack;
    }
}
