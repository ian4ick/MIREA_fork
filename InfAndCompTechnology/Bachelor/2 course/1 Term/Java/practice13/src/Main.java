public class Main {
    public static void main(String[] args) {
        StorageManager sm = new StorageManager();
        File f1 = new File("1", "text1");
        File f2 = new File("2", "text2");
        Directory d1 = new Directory("d1");
        Directory d2 = new Directory("d2");
        sm.add(d1.getDirectoryName(),d1);
        sm.add("d1/" + f1.getFileName(), f1);
        sm.add("d1/" + d2.getDirectories(), d2);
        sm.add("d1/d2/" + f2.getFileName(), f2);
        return;
    }
}