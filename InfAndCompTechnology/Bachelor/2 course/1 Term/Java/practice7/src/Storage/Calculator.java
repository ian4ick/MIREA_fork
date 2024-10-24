package Storage;
import inventory.Electronics;
import inventory.Food;
import inventory.Other;

import java.util.ArrayList;

public class Calculator {
    private ArrayList<Electronics> electronicsList;
    private ArrayList<Food> foodList;
    private ArrayList<Other> otherList;
    public Calculator() {
        electronicsList = new ArrayList<>();
        foodList = new ArrayList<>();
        otherList = new ArrayList<>();
    }
    public void addElectronics(Electronics electronics) {
        electronicsList.add(electronics);
    }
    public void addFood(Food food) {
        foodList.add(food);
    }
    public void addOther(Other other) {
        otherList.add(other);
    }
    public String displayEverything(){
        String everything = "\n\nCurrent storage items\n----------------\n";
        everything += "\nElectronics:";
        for (int i = 0; i < electronicsList.size(); i++) {
            everything += "\n" + (i + 1) + " " + electronicsList.get(i).toString();
        }
        everything += "\nFood:";
        for (int i = 0; i < foodList.size(); i++) {
            everything += "\n" + (i + 1) + " " + foodList.get(i).toString();
        }
        everything += "\nOther:";
        for (int i = 0; i < otherList.size(); i++) {
            everything += "\n" + (i + 1) + " " + otherList.get(i).toString();
        }
        return everything;
    }
    public void deleteElectronics(Electronics electronics) {
        electronicsList.remove(electronics);
    }
    public void deleteFood(Food food) {
        foodList.remove(food);
    }
    public void deleteOther(Other other) {
        otherList.remove(other);
    }
    public void deleteByName(String name) {
        ArrayList<Integer> deleteList = new ArrayList<>();
        for (int i = 0; i < electronicsList.size(); i++) {
            if (electronicsList.get(i).getName().equals(name)) {
                deleteList.add(i);
            }
        }
        for (int i = 0; i < deleteList.size(); i++) {
            electronicsList.remove(deleteList.get(i));
        }
        deleteList.clear();
        for (int i = 0; i < foodList.size(); i++) {
            if (foodList.get(i).getName().equals(name)) {
                deleteList.add(i);
            }
        }
        for (int i = 0; i < deleteList.size(); i++) {
            foodList.remove(deleteList.get(i));
        }
        deleteList.clear();
        for (int i = 0; i < otherList.size(); i++) {
            if (otherList.get(i).getName().equals(name)) {
                deleteList.add(i);
            }
        }
        for (int i = 0; i < deleteList.size(); i++) {
            otherList.remove(deleteList.get(i));
        }
    }
}
