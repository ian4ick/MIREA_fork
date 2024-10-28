#include <chrono>
#include <cmath>
#include <iostream>
#include <fstream>
#include <thread>
#include <streebog.hpp>
#include "utils.hpp"
using namespace std;

class User {
    string id;
    string passwd;
    const string file_path = "C:\Backup\Less Important\My programs\Git\MIREA\InfAndCompTechnology\Bachelor\2 course\1 Term\TheoryOfTheCalculatingProcess\9\hashed_text_file1.txt";
    public:
    User(string id, string s) {
        this->id = id;
        setPasswd(s);
    }

    string hash(string res) {
        Streebog hash_streebog;
        hash_streebog.init();
        ofstream writeFile("2");
        writeFile << res;
        writeFile.close();
        ifstream readFile1("2");
        hash_streebog.update(readFile1);
        readFile1.close();
        res = bytesToHexString(hash_streebog.digest());
        return res;
    }

    void setPasswd(string s) {
        string salt = id;
        string res = salt + s;
        res = hash(res);
        passwd = res;
    }
    void printUser() {
        cout << "\nID: " << id << endl;
        cout << "Hashed password: " << passwd << endl;
    }
};

int main() {
    std::cout << "Hello, Enter your data!" << std::endl;
    cout << "Username:\n";
    cin.sync();
    string username;
    cin >> username;
    cout << "Password:\n";
    string password;
    cin.sync();
    cin >> password;
    User user(username, password);
    user.printUser();
    cout << "Type the same password:\n";
    cin >> password;
    user.setPasswd(password);
    user.printUser();
    cout << "Type different password:\n";
    cin >> password;
    user.setPasswd(password);
    user.printUser();
    return 0;
}
