import java.util.ArrayList;
import java.util.HashMap;

public class Main {
    public static int findString(String str, String baseString) {
        // Using ideas of Boyer-Moore algorithm
        HashMap<Character, ArrayList<Integer>> map = new HashMap<>();
        for (int i = 0; i < str.length(); i++) {
            if (map.containsKey(str.charAt(i))) {
                ArrayList<Integer> list = map.get(str.charAt(i));
                list.add(i);
                map.put(str.charAt(i),list);
            }
            else{
                ArrayList<Integer> list = new ArrayList<>();
                list.add(i);
                map.put(str.charAt(i),list);
            }
        }
        int i = str.length() - 1;
        int a = i;
        int b = i;
        while (i < baseString.length()) {
            a = i;
            b = str.length() - 1;
            if (baseString.charAt(i) == str.charAt(b)) {
                boolean ok = true;
                a--;
                b--;
                while (ok && b > -1) {
                    ok = ok && baseString.charAt(a) == str.charAt(b);
                    a--;
                    b--;
                }
                if (ok)
                    return a + 1;
                else{
                    ArrayList<Integer> pos = map.get(baseString.charAt(a));
                    if (pos == null) {
                        i += 1;
                    }
                    else{
                        i += b - pos.getLast();
                    }
                }
            }
            else{
                ArrayList<Integer> pos = map.get(baseString.charAt(i));
                if (pos == null) {
                    i += 1;
                }
                else{
                    i += b - pos.getLast();
                }
            }
            //System.out.println(a + " " + b + " " + str.substring(b, str.length() -1) + " " + baseString);
        }
        return -1;
    }
    public static void main(String[] args) {
        String baseString = "fjkabcdabcbd";
        String searchString = "dabc";
        int a = findString(searchString, baseString);
        if (a==-1 || a >= baseString.length())
            System.out.println("Not found");
        else
            System.out.println(a + " " +  baseString.substring(a, a + searchString.length()));
    }
}