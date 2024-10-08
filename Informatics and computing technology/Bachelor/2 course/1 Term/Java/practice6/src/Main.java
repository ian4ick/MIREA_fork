import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        String name = "John";
        String surname = "Doe";
        String middleName = "Huck";
        User user = new User(name, surname, middleName);
        user.setName("A$alex");
    }
}