public class StudentsIterator implements Iterator {
    private StudentList studentList;
    private int index;
    public StudentsIterator(StudentList studentList) {
        this.studentList = studentList;
        this.index = 0;
    }
    public void setNewStudentList(StudentList studentList) {
        this.studentList = studentList;
        this.index = 0;
    }
    @Override
    public boolean hasNext() {
        return index < studentList.size();
    }

    @Override
    public Student next() {
        index++;
        return studentList.getStudent(index - 1);
    }
}
