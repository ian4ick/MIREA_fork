import Storage.Calculator;
import inventory.Electronics;
import inventory.Food;
import inventory.Other;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, 2);
        Food taco = new Food("Taco", 2.0, calendar.getTime());
        calendar.add(Calendar.DATE, 1);
        Food burger = new Food("Burger", 1.0, calendar.getTime());
        Electronics pocoX3 = new Electronics("Poco x3", 400);
        Electronics xiaomi = new Electronics("Xiaomi", 300);
        Other ladaGranta = new Other("Lada Granta", 30000, "Amazing car");
        Calculator calculator = new Calculator();
        calculator.addFood(taco);
        calculator.addFood(burger);
        calculator.addElectronics(pocoX3);
        calculator.addElectronics(xiaomi);
        calculator.addOther(ladaGranta);
        System.out.println(calculator.displayEverything());
        calculator.deleteFood(burger);
        calculator.deleteByName("Xiaomi");
        System.out.println(calculator.displayEverything());
    }
}