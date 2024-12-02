public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");
        Student misha = new Student("Misha", 19);
        Student igor = new Student("Igor", 20);
        StudentList sl = new StudentList();
        int m_id = sl.addStudent(misha);
        int i_id = sl.addStudent(igor);
        StudentsIterator si = new StudentsIterator(sl);
        while (si.hasNext()) {
            Student temp = si.next();
            System.out.println(temp);
        }
    }
}