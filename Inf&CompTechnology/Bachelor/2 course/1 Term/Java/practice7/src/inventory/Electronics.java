package inventory;

import java.util.UUID;

public class Electronics extends Good{
    private String warrantyId;
    public Electronics(String name, double price) {
        super(name, price);
        this.warrantyId = UUID.randomUUID().toString();
    }

    public String getWarrantyId() {
        return warrantyId;
    }

    public void setWarrantyId(String warrantyId) {
        this.warrantyId = warrantyId;
    }

    @Override
    public String toString() {
        return "Electronics{" +
                "name='" + name + '\'' +
                ", price=" + price +
                ", warrantyId='" + warrantyId + '\'' +
                '}';
    }
}
