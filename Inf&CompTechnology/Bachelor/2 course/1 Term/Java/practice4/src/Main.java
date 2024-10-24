import javax.swing.*;
import java.awt.*;

public class Main {
    public static void main(String[] args) {
        /*
        abstract
        создать 4 класса
        1:
        abstract figure
        поля, конструктор, абстрактные методы
        одно из полей Color color;
        bool isVisible;
        метод draw;

        два наследника:
        круг
        double radius
        прямоугольник
        double a;
        double b;

        квадрат, наследник прямоугольника


        каждый класс должен иметь периметр, площадь

        фигуру отрисовать нужно


        */

        Circle circle = new Circle(Color.BLUE, true, 0, 100, 50);
        Rectangle rectangle = new Rectangle(Color.RED, true, 120, 100, 50, 100);
        Square square = new Square(Color.GREEN, true, 180, 100, 50);

        JPanel panel = new JPanel(new GridLayout(1,3));
        panel.setPreferredSize(new Dimension(700, 500));
        panel.add(circle);
        panel.add(rectangle);
        panel.add(square);
        circle.setBounds(0, 0, 500, 500);
        rectangle.setBounds(0, 0, 500, 500);
        square.setBounds(0, 0, 500, 500);

        JFrame frame = new JFrame("Draw");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(500, 500);
        frame.add(panel);

        frame.setVisible(true);

    }
}