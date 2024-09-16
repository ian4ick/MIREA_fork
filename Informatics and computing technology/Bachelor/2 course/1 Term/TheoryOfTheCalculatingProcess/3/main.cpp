#include <iostream>
#include <queue>
using namespace std;
int main() {
    string input;
    cout << "Please enter a string:";
    getline(cin, input);
    queue<char> q;
    for (char c : input.substr(0, input.length() / 2 + 1)) {
        q.push(c);
    }
    int n = q.size();
    for (int i = input.length() - 1; i >= input.length() - n; i--) {
        if (q.front() != input[i]) {
            cout << "It is not a palindrome";
            return 1;
        }
        q.pop();
    }
    cout<< "It is a palindrome";
    return 0;
}
