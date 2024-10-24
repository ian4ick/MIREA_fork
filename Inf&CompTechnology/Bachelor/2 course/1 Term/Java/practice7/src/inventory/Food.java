package inventory;

import java.util.Date;

public class Food extends Good{
    private Date expireDay;
    public Food(String name, double price, Date expireDay) {
        super(name, price);
        this.expireDay = expireDay;
    }

    public Date getExpireDay() {
        return expireDay;
    }

    public void setExpireDay(Date expireDay) {
        this.expireDay = expireDay;
    }

    @Override
    public String toString() {
        return "Food{" +
                "name='" + name + '\'' +
                ", price=" + price +
                ", expireDay=" + expireDay +
                '}';
    }
}
