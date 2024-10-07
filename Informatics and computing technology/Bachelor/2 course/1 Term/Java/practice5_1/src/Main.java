import java.util.ArrayList;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        int[] arr = new int[]{7, 16, -12, 123, 23, 36, 82, 51};
        int goal = 29;
        ArrayList<Integer> arrayList= new ArrayList<>(Arrays.asList(Arrays.stream(arr).boxed().toArray(Integer[]::new)));
        Array array = new Array(arrayList);
        int index = array.getMaxThatIsAboveTheGoal(goal);
        int a = array.getByIndex(index);
        int b = array.getByIndex(index + 1);
        if (Math.abs(goal - a) > Math.abs(b - goal))
            System.out.println(b);
        else
            System.out.println(a);
    }
}