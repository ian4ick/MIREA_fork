import java.util.LinkedList;
import java.util.Queue;

public class StackOnQueue<T> {
    private final Queue<T> queue;
    public StackOnQueue() {
        queue = new LinkedList<>();
    }
    public StackOnQueue(StackOnQueue<T> stackOnQueue) {
        this.queue = new LinkedList<>(stackOnQueue.queue);
    }
    public void push(T t) {
        queue.add(t);
    }
    public T pop() {
        int n = queue.size();
        for (int i = 0; i < n - 1; i++) {
            queue.add(queue.remove());
        }
        return queue.remove();
    }
    public T peek() {
        int n = queue.size();
        for (int i = 0; i < n - 1; i++) {
            queue.add(queue.remove());
        }
        T t = queue.remove();
        queue.add(t);
        return t;
    }
    public boolean isEmpty() {
        return queue.isEmpty();
    }
}
