#include <fstream>
#include <functional>
#include <iostream>
#include <thread>
#include <vector>
using namespace std;

mutex m;

void writeToFile(const string &fileName, const string &content, const string &author) {
    lock_guard<mutex> lock(m);
    fstream outputFile(fileName, std::ios::app);
    outputFile << content << " By: " << author << endl;
    outputFile.close();
}
void printFile(const std::string &fileName) {
    lock_guard<std::mutex> lock(m);
    ifstream inputFile(fileName);
    string line;
    while (getline(inputFile, line)) {
        cout << line << endl;
    }
    inputFile.close();
}
class FileManager {
    string fileName;
    vector<function<void()>> functions;
    public:
    FileManager(const string &fileName) {
        this->fileName = fileName;
        ofstream outputFile(fileName);
        outputFile << "";
        outputFile.close();
    }
    void addWriteToQueue(const string& content, const string& author) {
        functions.emplace_back([this, content, author] {
            writeToFile(fileName, content, author);
        });
    }
    void addPrintToQueue() {
        functions.emplace_back([this] {
            printFile(fileName);
        });
    }
    void exec() {
        vector<thread> threads;
        for (const auto &task : functions) {
            threads.emplace_back(task);
        }
        for (thread &t : threads) {
            t.join();
        }
        threads.clear();
        functions.clear();
    }
};


int main() {
    const string fileName = "file.txt";
    cout << "Hello, here's a list of the commands:" << endl;
    cout << "1. w\n<text> | write text to file\n2. p | print file\n3. e | execute all tasks\n4. exit | stop the program" << endl;
    FileManager fileManager(fileName);
    string query;
    cin >> query;
    int author = 0;
    while (query != "exit") {
        if (query == "w") {
            author++;
            string content;
            cin.sync();
            getline(cin, content);
            fileManager.addWriteToQueue(content, "Thread " + to_string(author));
        }
        else if (query == "p") {
            fileManager.addPrintToQueue();
        }
        else if (query == "e") {
            fileManager.exec();
        }
        cin >> query;
    }
    return 0;
}
