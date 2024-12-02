import java.util.ArrayList;

public class StudentList {

    private final ArrayList<Student> students = new ArrayList<>();
    public StudentList() {}
    public int addStudent(String name, int age) {
        students.add(new Student(name, age));
        return students.size() - 1;
    }
    public int addStudent(Student student) {
        students.add(student);
        return students.size() - 1;
    }
    public Student getStudent(int index) {
           return students.get(index);
    }
    public int size(){
        return students.size();
    }
}