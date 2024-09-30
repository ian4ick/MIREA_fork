package vehicles;

public class Car extends Vehicle {
    public Car(){
        setEngineType("Combustion");
    }
    @Override
    public String vehicleType() {
        return "Car";
    }
}
