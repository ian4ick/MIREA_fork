#include <iostream>
#include <map>
using namespace std;


class Helper {
    map<string, string> my_map;
    public:
    Helper() {
        my_map.insert(make_pair("auto",
            "The auto keyword directs the compiler to use the initialization expression of a declared variable, or lambda expression parameter, to deduce its type."));
        my_map.insert(make_pair("bool",
            "This keyword is a built-in type. A variable of this type can have values true and false."));
        my_map.insert(make_pair("break",
            "The break statement ends execution of the nearest enclosing loop or conditional statement in which it appears."));
        my_map.insert(make_pair("case",
            "Allows selection among multiple sections of code, depending on the value of an integral expression."));
        my_map.insert(make_pair("catch",
            "To handle exceptions that may be thrown, implement one or more catch blocks immediately following a try block. Each catch block specifies the type of exception it can handle."));
        my_map.insert(make_pair("char",
            "The char type is a character representation type that efficiently encodes members of the basic execution character set."));
        my_map.insert(make_pair("class",
            "The class keyword declares a class type or defines an object of a class type."));
        my_map.insert(make_pair("const",
            "When it modifies a data declaration, the const keyword specifies that the object or variable isn't modifiable."));
        my_map.insert(make_pair("continue",
            "Forces transfer of control to the controlling expression of the smallest enclosing do, for, or while loop."));
        my_map.insert(make_pair("delete",
            "Deallocates a block of memory."));
        my_map.insert(make_pair("do",
            "Executes a statement repeatedly until the specified termination condition (the expression) evaluates to zero."));
        my_map.insert(make_pair("double",
            "Type double is a floating point type that is larger than or equal to type float, but shorter than or equal to the size of type long double."));
        my_map.insert(make_pair("else",
            "An if-else statement controls conditional branching."));
        my_map.insert(make_pair("false",
            "The keyword is one of the two values for a variable of type bool or a conditional expression"));
        my_map.insert(make_pair("float",
            "Type float is the smallest floating point type in C++."));
        my_map.insert(make_pair("for",
            "Executes a statement repeatedly until the condition becomes false."));
        my_map.insert(make_pair("goto",
            "The goto statement unconditionally transfers control to the statement labeled by the specified identifier."));
        my_map.insert(make_pair("if","An if-else statement controls conditional branching"));
        my_map.insert(make_pair("int",
            "The int type is the default basic integer type. It can represent all of the whole numbers over an implementation-specific range."));
        my_map.insert(make_pair("namespace",
            "A namespace is a declarative region that provides a scope to the identifiers (the names of types, functions, variables, etc) inside it. "));
        my_map.insert(make_pair("new",
            "Attempts to allocate and initialize an object or array of objects of a specified or placeholder type, and returns a suitably typed, nonzero pointer to the object (or to the initial object of the array)."));
    }
    string getHelp(const string& key) {
        if (!my_map.contains(key)) {
            cout << "Sorry, we cannot provide a help to this command"
                    "\nWould you like to give us information about this command?\n";
            string answer;
            cin.sync();
            getline(cin, answer);
            if (answer == "No" || answer == "no" || answer.empty()) {
                return "Sorry, we cannot provide a help to this command, cause you refused to provide us information";
            }
            my_map.insert(make_pair(key, answer));
            return answer;
        }

        return my_map.find(key)->second;
    }
    string listOfHelp() {
        string help;
        int i = 0;
        for (auto & it : my_map) {
            help += std::to_string(i) + " " + it.first + "\n";
            i++;
        }
        return help;
    }

};

int main() {
    cout << "Hello, I am your Helper, I will provide you help."
            "\nFinish keyword is <perform_exit/>"
            "\nYou can ask about this commands" << endl;
    Helper helper;
    cout << helper.listOfHelp() << endl;
    cout << "------------------------------------" << endl;
    while (true) {
        string input;
        cin >> input;
        if (input == "perform_exit") {
            return 0;
        }
        cout << helper.getHelp(input)<<endl;
    }
}
