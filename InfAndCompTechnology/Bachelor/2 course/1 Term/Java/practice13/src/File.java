public class File implements FileComponent<String>{
    private String fileName;
    private String fileContent;

    public File(String fileName, String fileContent) {
        this.fileName = fileName;
        this.fileContent = fileContent;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }


    @Override
    public void setContent(String content) {
        fileContent = content;
    }

    @Override
    public String getContent() {
        return fileContent;
    }
}
