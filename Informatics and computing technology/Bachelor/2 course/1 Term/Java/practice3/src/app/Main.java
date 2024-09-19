package app;

import vehicles.Car;
import vehicles.ElectricCar;

import java.util.UUID;

public class Main {
    public static void main(String[] args) {
        Car car = new Car("Alex", String.valueOf(UUID.randomUUID()), "Gas");
        Car car1 = new ElectricCar();
        car.gas();
        car1.gas();

        ElectricCar car2 = new ElectricCar();
        car2.gas();

        /*ElectricCar electricCar = new ElectricCar();
        System.out.println(electricCar.getEngineType());
        electricCar.setOwnerName("Bernard");
        electricCar.setInsuranceNumber(String.valueOf(UUID.randomUUID()));
        electricCar.setBatteryCapacity(100.0);
        System.out.println(electricCar);
        System.out.println(car);*/
    }
}
