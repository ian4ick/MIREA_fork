import java.util.ArrayList;

public class Directory {
    private String directoryName;
    private final ArrayList<File> files = new  ArrayList<>();
    private final ArrayList<Directory> directories = new  ArrayList<>();
    public Directory(String directoryName) {
        this.directoryName = directoryName;
    }

    public <T> void add(T value) {
        if (value instanceof File) {
            files.add((File) value);
        }
        else if (value instanceof Directory) {
            directories.add((Directory) value);
        }
        else {
            throw new ClassCastException();
        }
    }

    public ArrayList<File> getFiles() {
        return files;
    }

    public ArrayList<Directory> getDirectories() {
        return directories;
    }

    public String getDirectoryName() {
        return directoryName;
    }

    public void setDirectoryName(String directoryName) {
        this.directoryName = directoryName;
    }
}
