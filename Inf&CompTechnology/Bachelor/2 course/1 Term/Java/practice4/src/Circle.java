import java.awt.*;

public class Circle extends Figure {
    private int radius;

    public Circle(Color color, boolean isVisible, int x, int y, int radius) {
        super(color, isVisible, x, y);
        this.radius = radius;
    }

    @Override
    public void draw(Graphics g) {
        if (isVisible()){
            g.setColor(getColor());
            g.drawOval(getX(), getY(), 2*radius, 2*radius);
            g.fillOval(getX(), getY(), 2*radius, 2*radius);
        }
    }

    @Override
    public double getPerimeter() {
        return Math.PI*2*radius;
    }

    @Override
    public double getArea() {
        return Math.PI*radius*radius;
    }

    public int getRadius() {
        return radius;
    }

    public void setRadius(int radius) {
        this.radius = radius;
    }
}
