#include <fstream>
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
void printFile(const string &fileName) {
    lock_guard<mutex> lock(m);
    ifstream inputFile(fileName);
    string content;
    inputFile >> content;
    inputFile.close();
    cout << "Current file: \n" << content << endl;
}
class FileManager {
    string fileName;
    vector<thread> threads;
    public:
    FileManager(const string &fileName) {
        this->fileName = fileName;
        ofstream outputFile(fileName);
        outputFile << "";
        outputFile.close();
    }
    void addWriteToQueue(const string& content, const string& author) {
        threads.emplace_back(writeToFile, fileName, content, author);
    }
    void addPrintToQueue() {
        threads.emplace_back(printFile, fileName);
    }
    void exec() {
        for (thread &t : threads) {
            t.join();
        }
        threads.clear();
    }
};


int main() {
    const string fileName = "file.txt";
    cout << "Hello, here's a list of the commands:" << endl;
    cout << "1. w <text> | write text to file\n2. p | print file\n3. e | execute all tasks\n4. exit | stop the program" << endl;
    FileManager fileManager(fileName);
    string query;
    cin >> query;
    int author = 0;
    while (query != "exit") {
        if (query == "w") {
            author++;
            string content;
            cin >> content;
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
    /*ofstream outputFile(fileName);
    outputFile << "";
    outputFile.close();
    thread t1(writeToFile, fileName, content, "thread 1");
    thread t2(writeToFile, fileName, content, "thread 2");
    t1.join();
    t2.join();*/
    return 0;
}
