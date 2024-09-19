import java.awt.*;

public class Rectangle extends Figure {
    int width, height;

    public Rectangle(Color color, boolean isVisible, int x, int y, int width, int height) {
        super(color, isVisible, x, y);
        this.width = width;
        this.height = height;
    }

    @Override
    public void draw(Graphics g) {
        if (isVisible()){
            g.setColor(getColor());
            g.drawRect(getX(), getY(), width, height);
            g.fillRect(getX(), getY(), width, height);
        }
    }

    @Override
    public double getPerimeter() {
        return 2*(width+height);
    }

    @Override
    public double getArea() {
        return width*height;
    }

}
