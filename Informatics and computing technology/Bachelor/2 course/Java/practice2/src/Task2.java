import java.util.Calendar;
import java.util.Date;

public class Task2 {
    static final int CURRENT_YEAR = Calendar.getInstance().get(Calendar.YEAR);
    public static void main(String[] args) {
        Car car = new Car();
        System.out.println(car);
        System.out.println("Age of the car: " + car.age(CURRENT_YEAR));

        Car car2 = new Car("Honda sb223", "7891XA", "BLUE");
        car2.setYear(2003);
        System.out.println(car2);
    }}
