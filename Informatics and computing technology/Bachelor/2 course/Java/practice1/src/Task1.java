
import java.util.Scanner;

public class Task1 {
    public static double ROUBLES_PER_YUAN = 11.91;

    public static void main(String[] args) {
        System.out.println("Введите значение в юанях");
        int yuan;
        Scanner scanner = new Scanner(System.in);
        yuan = scanner.nextInt();
        double roubles;
        roubles = ROUBLES_PER_YUAN * yuan;
        System.out.println("Ваше значение в рублях равно " + Math.round(roubles * 100) / 100.0);
    }
}
