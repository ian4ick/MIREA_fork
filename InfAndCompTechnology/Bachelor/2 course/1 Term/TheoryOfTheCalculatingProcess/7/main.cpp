#include <functional>
#include <iostream>
#include <vector>
#include <string>

#include "Tree.h"

using namespace std;
int main() {
    int a;
    string s = "DefaultA";
    bool ok = true;
    cout << "Enter initial key and value:" << endl;
    cin >> a >> s;
    cout << endl << "List of commands:" << endl;
    cout << "1. Add <key> <value>" << endl;
    cout << "2. Delete <key>" << endl;
    cout << "3. PrintTree" << endl;
    cout << "4. GetValue <key>" << endl;
    cout << "5. Exit" << endl;
    auto* tree = new Tree<string>(a,s);
    while (ok) {
        cin>>s;
        if (s == "Add") {
            cin>>a>>s;
            s = "Default";
            tree->insert(a,s);
        }
        else if (s == "Delete") {
            cin>>a;
            tree->remove(a);
        }
        else if (s == "PrintTree") {
            tree->printTree();
        }
        else if (s == "GetValue") {
            cin>>a;
            cout << tree->getValue(a);
        }
        else if (s == "Exit")
                return 0;
        else{
                cout << "Enter valid-command again:" << endl;
        }

    }
}
