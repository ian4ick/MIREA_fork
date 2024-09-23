#include <iostream>
#include <list>
#include <stack>
using namespace std;

void printStack(stack<int> s) {
    cout << "\nYour stack: " << endl;
    while (!s.empty()) {
       cout << s.top() << " ";
       s.pop();
    }
}

int stack3() {
    stack<int> s;
    cout << "Enter number of numbers:";
    int n;
    cin >> n;
    cout << "Enter numbers:";
    for (int i = 0; i < n; i++) {
        int x;
        cin >> x;
        s.push(x);
    }
    printStack(s);
    stack<int> result;
    stack<int> temp;
    for (int i = 0; i < n / 2; i++) {
        temp.push(s.top());
        s.pop();
    }
    for (int i = 0; i < n / 2; i++) {
        result.push(temp.top());
        temp.pop();
    }
    if (n % 2 != 0) {
        result.push(s.top());
        s.pop();
    }
    while (!s.empty()) {
        temp.push(s.top());
        s.pop();
    }
    while (!temp.empty()) {
        result.push(temp.top());
        temp.pop();
    }
    printStack(result);
    return 0;
}

void printList(list<int> l) {
    cout << "\nYour list: " << endl;
    while (!l.empty()) {
        cout << l.front() << " ";
        l.pop_front();
    }
}


int list3() {
    list<int> input;
    cout << "Enter number of numbers:";
    int n;
    cin >> n;
    cout << "Enter numbers:";
    for (int i = 0; i < n; i++) {
        int x;
        cin >> x;
        input.push_back(x);
    }
    list<int> result;
    list<int> temp;
    for (int i = 0; i < n; i++) {
        int min = input.front();
        input.pop_front();
        temp.clear();
        while (!input.empty()) {
            int x = input.front();
            if (x < min) {
                temp.push_back(min);
                min = x;
            }else {
                temp.push_back(x);
            }
            input.pop_front();
        }
        result.push_back(min);
        input = temp;
    }
    printList(result);
    return 0;
}

int main() {
    list3();
    return 0;
}
