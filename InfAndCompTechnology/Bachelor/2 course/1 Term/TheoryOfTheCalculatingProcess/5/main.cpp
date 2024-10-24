#include <iostream>
#include <list>
using namespace std;

class DeqArray {
    int size = 0;
    int *arr = nullptr;
public:
    int push_front(int x) {
        size++;
        const int *temp = arr;
        arr = new int[size];
        arr[0] = x;
        for (int i = 1; i < size; i++) {
            arr[i] = temp[i - 1];
        }
        return arr[0];
    }
    int push_back(int x) {
        size++;
        const int *temp = arr;
        arr = new int[size];
        for (int i = 0; i < size-1; i++) {
            arr[i] = temp[i];
        }
        arr[size-1] = x;
        return arr[size-1];
    }
    int pop_front() {
        size--;
        const int *temp = arr;
        arr = new int[size];
        for (int i = 1; i < size + 1; i++) {
            arr[i - 1] = temp[i];
        }
        return temp[0];
    }
    int pop_back() {
        size--;
        const int *temp = arr;
        arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = temp[i];
        }
        return temp[size];
    }
    bool is_empty(){
        return size == 0;
    }
    int front() {
        return arr[0];
    }
    int back() {
        return arr[size - 1];
    }
    int length() {
        return size;
    }
    void print() {
        cout<< "\nYour deque array: ";
        for (int i = 0; i < size; i++) {
            cout << arr[i] << " ";
        }
    }
};
class DeqList {
    list<int> numbers;
    public:
    int push_front(int x) {
        numbers.push_front(x);
        return numbers.front();
    }
    int push_back(int x) {
        numbers.push_back(x);
        return numbers.back();
    }
    int pop_front() {
        int x = numbers.front();
        numbers.pop_front();
        return x;
    }
    int pop_back() {
        int x = numbers.back();
        numbers.pop_back();
        return x;
    }
    bool is_empty() {
        return numbers.empty();
    }
    int front() {
        return numbers.front();
    }
    int back() {
        return numbers.back();
    }
    int length() {
        return numbers.size();
    }
    void print() {
        cout<< "\nYour deque list: ";
        list<int> temp = numbers;
        for (int i = 0; i < numbers.size(); i++) {
            cout<<temp.front()<<" ";
            temp.pop_front();
        }
    }
};

int main() {
    DeqArray deq_array = DeqArray();
    DeqList deq_list = DeqList();
    cout << "Enter Deque size:" ;
    int n;
    cin>>n;
    for (int i = 0; i < n; i++) {
        int x;
        cin>>x;
        deq_array.push_back(x);
        deq_list.push_back(x);
    }
    deq_array.print();
    deq_list.print();
    DeqArray temp_deq_array = DeqArray();
    DeqList temp_deq_list = DeqList();
    for (int i = 0; i < n/2; i++) {
        temp_deq_array.push_front(deq_array.pop_front());
        temp_deq_list.push_front(deq_list.pop_front());
    }
    if (n % 2 != 0) {
        deq_array.push_back(deq_array.pop_front());
        deq_list.push_back(deq_list.pop_front());
    }
    for (int i = 0; i < n/2; i++) {
        deq_array.push_back(temp_deq_array.back());
        deq_list.push_back(temp_deq_list.back());
        temp_deq_array.pop_back();
        temp_deq_list.pop_back();
    }
    deq_array.print();
    deq_list.print();
    return 0;
}
