public class Car {
    private String model;
    private String license;
    private String color;
    private int year;

    public Car(String model, String license, String color, int year) {
        this.model = model;
        this.license = license;
        this.color = color;
        this.year = year;
    }

    public Car() {
        this.model = "Daewoo Matiz";
        this.license = "A777AA";
        this.color = "Gold";
        this.year = 2000;
    }

    public Car(String model, String license, String color) {
        this.model = model;
        this.license = license;
        this.color = color;
    }

    //-----------------------------
    //TASK 2
    //-----------------------------

    public int age(int currentYear){
        return currentYear - year;
    }

    @Override
    public String toString() {
        return  "model: '" + model + '\'' +
                ", license: '" + license + '\'' +
                ", color: '" + color + '\'' +
                ", year: " + year;
    }

    public String getModel() {
        return model;
    }

    public Car setModel(String model) {
        this.model = model;
        return this;
    }

    public String getLicense() {
        return license;
    }

    public Car setLicense(String license) {
        this.license = license;
        return this;
    }

    public String getColor() {
        return color;
    }

    public Car setColor(String color) {
        this.color = color;
        return this;
    }

    public int getYear() {
        return year;
    }

    public Car setYear(int year) {
        this.year = year;
        return this;
    }
}
