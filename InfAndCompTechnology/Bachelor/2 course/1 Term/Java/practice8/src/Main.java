import java.util.Date;
import java.util.Random;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

public class Main {
    private static final Object lock = new Object();
    public static void main(String[] args) {
        AtomicInteger maxNumber = new AtomicInteger();
        maxNumber.set(20);
        AtomicInteger currentNumber = new AtomicInteger();
        AtomicBoolean timeBoolean = new AtomicBoolean();
        AtomicLong currentTimeBoolean = new AtomicLong();
        currentTimeBoolean.set(System.currentTimeMillis());
        AtomicLong startTimeBoolean = new AtomicLong();
        AtomicInteger stopRace = new AtomicInteger();
        stopRace.set(0);
        startTimeBoolean.set(System.currentTimeMillis());
        timeBoolean.set(false);
        Thread firstThread = new Thread(
                () -> {
                    Racer racer1 = new Racer(30, 10, 30, 2, 0);
                    while (racer1.getDistance() < 300) {
                        synchronized (lock) {
                            if (currentNumber.get() % 2 == 0  && timeBoolean.get()) {
                                racer1.setDistance(new Random().nextInt(racer1.getDistance(), racer1.getDistance() + 30));
                                System.out.print("Racer 1: " + racer1.getDistance() + " ");
                                currentNumber.incrementAndGet();
                                if (stopRace.get() > 0)
                                    timeBoolean.set(false);
                                lock.notify();
                            }
                            else{
                                try{
                                    lock.wait();
                                }
                                catch (InterruptedException e){
                                    Thread.currentThread().interrupt();
                                }
                            }
                        }
                    }
                    System.out.println("\nRacer 1: " + "Finished" + " ");
                    stopRace.incrementAndGet();
                }
        );
        Thread secondThread = new Thread(
                () -> {
                    Racer racer2 = new Racer(20, 10, 60, 3, 0);
                    while (racer2.getDistance() < 300) {
                        synchronized (lock) {
                            if (currentNumber.get() % 2 == 1  && timeBoolean.get()) {
                                racer2.setDistance(new Random().nextInt(racer2.getDistance(), racer2.getDistance() + 30));
                                System.out.println("Racer 2: " + racer2.getDistance() + " ");
                                currentNumber.incrementAndGet();
                                timeBoolean.set(false);
                                lock.notify();
                            }
                            else{
                                try{
                                    lock.wait();
                                }
                                catch (InterruptedException e){
                                    Thread.currentThread().interrupt();
                                }
                            }
                        }
                    }
                    System.out.println("\nRacer 2: " + "Finished" + " ");
                    stopRace.incrementAndGet();
                }
        );
        Thread timeThread = new Thread(
                () -> {
                    while (stopRace.get() < 2) {
                        synchronized (lock) {
                            if (!timeBoolean.get() && (System.currentTimeMillis() - currentTimeBoolean.get()) > 999) {
                                timeBoolean.set(true);
                                currentTimeBoolean.set(System.currentTimeMillis());
                                System.out.print("Current time: " + new Date(currentTimeBoolean.get()) + ": ");
                                lock.notify();
                            } else {
                                try {
                                    lock.notifyAll();
                                    if ((System.currentTimeMillis() - currentTimeBoolean.get()) < 999)
                                        lock.wait(1000 - System.currentTimeMillis() + currentTimeBoolean.get());
                                    else
                                        lock.wait();
                                } catch (InterruptedException e) {
                                    Thread.currentThread().interrupt();
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
