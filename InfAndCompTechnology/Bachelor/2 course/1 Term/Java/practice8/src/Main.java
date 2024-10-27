import java.util.Date;
import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

public class Main {
    private static final Object lock = new Object();
    private static final int FINISH_DISTANCE = 300;
    public static void main(String[] args) {
        AtomicInteger currentNumber = new AtomicInteger();
        AtomicLong currentTimeBoolean = new AtomicLong();
        currentTimeBoolean.set(System.currentTimeMillis());
        AtomicInteger stopRace = new AtomicInteger();
        stopRace.set(0);
        currentNumber.set(2);
        Thread firstThread = new Thread(
                () -> {
                    Racer racer1 = new Racer(30, 10, 30, 2, 0);
                    while (racer1.getDistance() < FINISH_DISTANCE) {
                        synchronized (lock) {
                            if (currentNumber.get() == 0) {
                                racer1.setDistance(new Random().nextInt(racer1.getDistance(), racer1.getDistance() + 30));
                                System.out.print("Racer 1: " + racer1.getDistance() + " ");
                                if (stopRace.get() == 0)
                                    currentNumber.set(1);
                                else{
                                    currentNumber.set(2);
                                    System.out.println();
                                }
                                if (racer1.getDistance() >= FINISH_DISTANCE)
                                    stopRace.incrementAndGet();
                                lock.notify();
                            }
                            else{
                                try{
                                    lock.notify();
                                    lock.wait();
                                }
                                catch (InterruptedException e){
                                    Thread.currentThread().interrupt();
                                }
                            }
                        }
                    }
                    System.out.println("\nRacer 1: " + "Finished" + " ");
                }
        );
        Thread secondThread = new Thread(
                () -> {
                    Racer racer2 = new Racer(20, 10, 60, 3, 0);
                    while (racer2.getDistance() < FINISH_DISTANCE) {
                        synchronized (lock) {
                            if (currentNumber.get() == 1 || (currentNumber.get() % 3 == 0 && stopRace.get() == 1)) {
                                racer2.setDistance(new Random().nextInt(racer2.getDistance(), racer2.getDistance() + 30));
                                System.out.println("Racer 2: " + racer2.getDistance() + " ");
                                currentNumber.set(2);
                                if (racer2.getDistance() >= FINISH_DISTANCE)
                                    stopRace.incrementAndGet();
                                lock.notify();
                            }
                            else{
                                try{
                                    lock.notify();
                                    lock.wait();
                                }
                                catch (InterruptedException e){
                                    Thread.currentThread().interrupt();
                                }
                            }
                        }
                    }
                    System.out.println("\nRacer 2: " + "Finished" + " ");
                }
        );
        Thread timeThread = new Thread(
                () -> {
                    while (stopRace.get() < 2) {
                        synchronized (lock) {
                            if ((System.currentTimeMillis() - currentTimeBoolean.get()) > 999 && currentNumber.get() == 2) {
                                currentTimeBoolean.set(System.currentTimeMillis());
                                System.out.print("Current time: " + new Date(currentTimeBoolean.get()) + ": ");
                                currentNumber.set(0);
                                lock.notify();
                            }
                            else {
                                try {
                                    if (stopRace.get() < 2){
                                        lock.notify();
                                        lock.wait();
                                    }
                                    else{
                                        System.out.println("\nThank you for watching this race");
                                        System.exit(0);
                                    }
                                } catch (InterruptedException e) {
                                    throw new RuntimeException(e);
                                }
                            }

                        }
                    }
                    System.out.println("\nThank you for watching this race");
                }
        );
        firstThread.start();
        secondThread.start();
        timeThread.start();

    }
}
