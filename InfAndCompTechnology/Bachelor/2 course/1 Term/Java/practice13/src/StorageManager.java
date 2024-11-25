import java.lang.reflect.Array;
import java.util.ArrayList;

public class StorageManager {
    private final Directory root;
    public StorageManager() {
        root = new Directory("root");
    }
    public Directory getDirByPath(Directory currentDir, String path) {
        while (path.contains("/")) {
            String s = path.substring(0, path.indexOf('/'));
            Directory newDir = null;
            for (Directory dir : currentDir.getDirectories()) {
                if (s.equals(dir.getDirectoryName()))
                {
                    newDir = dir;
                    break;
                }
            }
            if (newDir == null)
                throw new RuntimeException("Directory not found");
            currentDir = newDir;
            path = path.substring(path.indexOf('/') + 1);
        }
        return currentDir;
    }
    public <T> void add(String path, T value) {
        Directory currentDir = getDirByPath(root, path);
        if (value instanceof Directory){
            String dirname = path.substring(path.lastIndexOf('/') + 1);
            for (Directory dir : currentDir.getDirectories()) {
                if (dir.getDirectoryName().equals(dirname)){
                    throw new RuntimeException("Directory already exists");
                }
            }
            currentDir.add(value);
        }
        else if (value instanceof File){
            String filename = path.substring(path.lastIndexOf('/') + 1);
            for (File file : currentDir.getFiles()) {
                if (file.getFileName().equals(filename)) {
                    throw new RuntimeException("File already exists");
                }
            }
            currentDir.add(value);
        }

    }
    public File getFileByPath(String path) {
        Directory currentDir = getDirByPath(root, path);
        String filename = path.substring(path.lastIndexOf('/') + 1);
        for (File file : currentDir.getFiles()) {
            if (file.getFileName().equals(filename)) {
                return file;
            }
        }
        throw new RuntimeException("File not found");
    }
    public Directory getDirectoryByPath(String path) {
        return getDirByPath(root, path);
    }
}
