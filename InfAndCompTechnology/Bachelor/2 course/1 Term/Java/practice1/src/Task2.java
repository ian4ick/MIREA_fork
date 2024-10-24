import java.util.Scanner;

public class Task2{
    public static String getYuanEnding(int digit){
        digit = digit % 10;
        if (digit == 1)
            return "китайский юань";
        else if (1 < digit && digit < 5 ) {
            return "китайских юаня";
        }
        else
            return "китайских юаней";
    }
    public static String getRubbleEnding(int digit){
        digit = digit % 10;
        if (digit == 1)
            return "российский рубль";
        else if (1 < digit && digit < 5 ) {
            return "российских рубля";
        }
        else
            return "российских рублей";
    }
    public static void main(String[] args) {
        System.out.println("Введите значение в юанях");
        int yuan;
        Scanner scanner = new Scanner(System.in);
        yuan = scanner.nextInt();
        double roubles;
        roubles = Task1.ROUBLES_PER_YUAN * yuan;
        int digit = (int) Math.round(roubles) % 10;
        System.out.println(yuan + " " + getYuanEnding(yuan % 10) + " - это " + Math.round(roubles * 100) / 100.0 + " " + getRubbleEnding(digit));
    }
}
