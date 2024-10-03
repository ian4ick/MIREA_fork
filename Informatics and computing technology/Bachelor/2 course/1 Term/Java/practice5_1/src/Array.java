import java.util.ArrayList;

public class Array {
    private ArrayList<Integer> arrayList;
    public Array(ArrayList<Integer> arrayList) {
        this.arrayList = new ArrayList<>();
        for (Integer x : arrayList) {
            int index = getMaxThatIsAboveTheGoal(x) + 1;
            if (index >= this.arrayList.size())
                this.arrayList.add(x);
            else if (index == 1 && this.arrayList.getFirst() > x)
                this.arrayList.addFirst(x);
            else
                this.arrayList.add(index, x);
        }
    }
    public int getMaxThatIsAboveTheGoal(int goal) {
        int a = 0;
        int b = arrayList.size();
        while (b - a > 1){
            int c = (a+b)/2;
            if (arrayList.get(c) > goal){
                b = c;
            }
            else if (arrayList.get(c) < goal){
                a = c;
            }
            else {
                return c;
            }
        }
        return a;
    }
    public void addNumber(int x) {
        this.arrayList.add(getMaxThatIsAboveTheGoal(x) + 1, x);
    }
    public void printArray() {
        System.out.println("\n");
        for (Integer x : arrayList) {
            System.out.print(x + " ");
        }
    }
    public Integer getByIndex(int index) {
        if (index >= arrayList.size())
            return this.arrayList.getLast();
        if (index < 0)
            return this.arrayList.getFirst();
        return this.arrayList.get(index);
    }
}
