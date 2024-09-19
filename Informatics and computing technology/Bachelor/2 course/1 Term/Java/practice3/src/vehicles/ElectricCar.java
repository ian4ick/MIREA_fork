package vehicles;

public class ElectricCar extends Car {
    Double batteryCapacity;

    @Override
    public void gas() {
        System.out.println("Quite gas");
    }

    public ElectricCar() {
        super();
        this.engineType = "Electric";
    }

    public Double getBatteryCapacity() {
        return batteryCapacity;
    }

    public void setBatteryCapacity(Double batteryCapacity) {
        this.batteryCapacity = batteryCapacity;
    }

    @Override
    public String toString() {
        return "ElectricCar{" +
                "ownerName='" + this.getOwnerName() + '\'' +
                ", insuranceNumber='" + this.getInsuranceNumber() + '\'' +
                "batteryCapacity=" + batteryCapacity +
                ", engineType='" + engineType + '\'' +
                '}';
    }
}
