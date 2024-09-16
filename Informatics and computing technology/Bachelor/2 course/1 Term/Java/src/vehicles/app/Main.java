package vehicles.app;

import vehicles.Car;
import vehicles.ElectricCar;

import java.util.UUID;

public class Main {
    public static void main(String[] args) {
        Car car = new Car("Alex", String.valueOf(UUID.randomUUID()), "Gas");

        ElectricCar electricCar = new ElectricCar();
        System.out.println(electricCar.getEngineType());
        electricCar.setOwnerName("Bernard");
        electricCar.setInsuranceNumber(String.valueOf(UUID.randomUUID()));
        System.out.println(electricCar);
        System.out.println(car);
    }
}
