import java.util.Objects;

public class User {
    private String name;
    private String surname;
    private String middleName;
    public User(String name, String surname, String middleName) {
        if (Objects.equals(name, surname) || Objects.equals(middleName, name) || Objects.equals(surname, middleName)) {
            throw new IllegalArgumentException("Name and Surname and Middle Name cannot be equal");
        }
        setName(name);
        setSurname(surname);
        setMiddleName(middleName);
    }

    public boolean isCorrect(String name, String type) {
        if (name == null) {
            throw new NullPointerException(type + " cannot be null");
        }
        if (name.charAt(0) == name.toLowerCase().charAt(0)) {
            throw new IllegalArgumentException(type + " cannot start with lower case letter");
        }
        if (!name.substring(1).equals(name.substring(1).toLowerCase())) {
            throw new IllegalArgumentException(type + " cannot have any upper case letters, except the first one");
        }
        if (name.length() < 3 || name.length() > 15) {
            throw new IllegalArgumentException(type + " cannot be less than 3 letters and bigger than 15 letters");
        }
        for (int i = 0; i < name.length(); i++) {
            if (!Character.isLetter(name.charAt(i))) {
                throw new IllegalArgumentException(type + " should contain only letters");
            }
        }
        return true;
    }

    public void setName(String name) {  
        if (isCorrect(name, "Name")) {
            this.name = name;
        }
    }

    public void setSurname(String surname) {
        if (isCorrect(surname, "Surname")) {
            this.surname = surname;
        }
    }

    public void setMiddleName(String middleName) {
        if (isCorrect(middleName, "Middle Name")) {
            this.middleName = middleName;
        }
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getMiddleName() {
        return middleName;
    }
}
