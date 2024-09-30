package app;

import vehicles.Car;
import vehicles.ElectricCar;

import java.util.UUID;

public class TestCar {
    public static void main(String[] args) {
        Car car = new Car();
        ElectricCar electricCar = new ElectricCar();
        electricCar.setBatteryCapacity(82);
        car.setYear(2017);
        car.setOwnerName("Alex");
        electricCar.setYear(2019);
        electricCar.setOwnerName("Bernard");
        electricCar.setInsuranceNumber(String.valueOf(UUID.randomUUID()));
        System.out.println(electricCar.getBatteryCapacity());
        System.out.println(car);
        System.out.println(electricCar);
    }
}
