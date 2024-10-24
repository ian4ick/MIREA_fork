import javax.swing.*;
import java.awt.*;

public abstract class Figure extends JPanel{
    private Color color;
    private boolean isVisible;
    private int x;
    private int y;

    abstract public void draw(Graphics g);

    @Override
    public void paintComponent(Graphics g){
        super.paintComponent(g);
        draw(g);
    }

    abstract public double getPerimeter();
    abstract public double getArea();

    public Figure(Color color, boolean isVisible, int x, int y) {
        this.color = color;
        this.isVisible = isVisible;
        this.x = x;
        this.y = y;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public boolean isVisible() {
        return isVisible;
    }

    public void setVisible(boolean visible) {
        isVisible = visible;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }
}
