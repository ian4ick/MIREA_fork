import java.util.ArrayList;

public class MyStack2<T> extends ArrayList<T> {
    public MyStack2() {
        super();
    }

    public int getSize() {
        return size();
    }
    public T peek(){
        return getLast();
    }
    public T pop(){
        return removeLast();
    }
    public void push(T t){
        add(t);
    }
}