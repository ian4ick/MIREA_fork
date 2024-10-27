public class Racer {
    private int maxSpeed;
    private int a;
    private int remainingFuel;
    private int refuelTime;
    private int distance;

    public Racer(int maxSpeed, int a, int remainingFuel, int refuelTime, int distance) {
        this.maxSpeed = maxSpeed;
        this.a = a;
        this.remainingFuel = remainingFuel;
        this.refuelTime = refuelTime;
        this.distance = distance;
    }

    public int getMaxSpeed() {
        return maxSpeed;
    }

    public Racer setMaxSpeed(int maxSpeed) {
        this.maxSpeed = maxSpeed;
        return this;
    }

    public int getA() {
        return a;
    }

    public Racer setA(int a) {
        this.a = a;
        return this;
    }

    public int getRemainingFuel() {
        return remainingFuel;
    }

    public Racer setRemainingFuel(int remainingFuel) {
        this.remainingFuel = remainingFuel;
        return this;
    }

    public int getRefuelTime() {
        return refuelTime;
    }

    public Racer setRefuelTime(int refuelTime) {
        this.refuelTime = refuelTime;
        return this;
    }

    public int getDistance() {
        return distance;
    }

    public Racer setDistance(int distance) {
        this.distance = distance;
        return this;
    }
}
