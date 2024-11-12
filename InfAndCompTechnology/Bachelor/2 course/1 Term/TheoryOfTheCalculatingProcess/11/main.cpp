#include <iostream>
#include <unordered_map>
#include <vector>
using namespace std;
double hashAdd(int n) {
    unordered_map<int, int> hashTable;
    time_t startTime = time(NULL);
    for (int i = 0; i <= n; i++) {
        hashTable[i] = i;
    }
    time_t endTime = time(NULL);
    return (endTime - startTime);
}
double hashDel(int n) {
    unordered_map<int, int> hashTable;
    for (int i = 0; i <= n; i++) {
        hashTable[i] = i;
    }
    time_t startTime = time(NULL);
    for (int i = 0; i <= n; i++) {
        hashTable.erase(i);
    }
    time_t endTime = time(NULL);
    return (endTime - startTime);
}
double vectorAdd(int n) {
    vector<int> v;
    time_t startTime = time(NULL);
    for (int i = 0; i <= n; i++) {
        v.push_back(i);
    }
    time_t endTime = time(NULL);
    return (endTime - startTime);
}
double vectorAddInTheMiddle(int n) {
    vector<int> v;
    time_t startTime = time(NULL);
    for (int i = 0; i <= n; i++) {
        v.insert(v.begin() + v.size() / 2, i);
    }
    time_t endTime = time(NULL);
    return (endTime - startTime);
}
double vectorAddInTheStart(int n) {
    vector<int> v;
    time_t startTime = time(NULL);
    for (int i = 0; i <= n; i++) {
        v.insert(v.begin(), i);
    }
    time_t endTime = time(NULL);
    return (endTime - startTime);
}
double vectorDel(int n) {
    vector<int> v;
    for (int i = 0; i <= n; i++) {
        v.push_back(i);
    }
    time_t startTime = time(NULL);
    for (int i = 0; i <= n; i++) {
        v.pop_back();
    }
    time_t endTime = time(NULL);
    return (endTime - startTime);
}
double vectorDelInTheMiddle(int n) {
    vector<int> v;
    for (int i = 0; i <= n; i++) {
        v.push_back(i);
    }
    time_t startTime = time(NULL);
    for (int i = 0; i <= n; i++) {
        v.erase(v.begin() + v.size() / 2);
    }
    time_t endTime = time(NULL);
    return (endTime - startTime);
}
double vectorDelInTheStart(int n) {
    vector<int> v;
    for (int i = 0; i <= n; i++) {
        v.push_back(i);
    }
    time_t startTime = time(NULL);
    for (int i = 0; i <= n; i++) {
        v.erase(v.begin());
    }
    time_t endTime = time(NULL);
    return (endTime - startTime);
}
int main()
{
    int n = 65536;
    string hA = "";
    string hD = "";
    string vAS = "";
    string vAM = "";
    string vA = "";
    string vDS = "";
    string vDM = "";
    string vD = "";
    string nums = "";
    for (int i = 0; i < 3; i++){
        nums += to_string(n) + " ";
        hA  += to_string(hashAdd(n)) + " ";
        hD  += to_string(hashDel(n)) + " ";
        vAS += to_string(vectorAddInTheStart(n)) + " ";
        vAM += to_string(vectorAddInTheMiddle(n)) + " ";
        vA += to_string(vectorAdd(n)) + " ";
        vDS += to_string(vectorDelInTheStart(n)) + " ";
        vDM += to_string(vectorDelInTheMiddle(n)) + " ";
        vD += to_string(vectorDel(n)) + " ";
        n *= 2;
    }
    cout << "Numbers: " << nums << endl;
    cout << "Hashmap Add: " << hA << endl;
    cout << "Hashmap Del: " << hD << endl;
    cout << "Vector Add in the start: " << vAS << endl;
    cout << "Vector Add in the middle: " << vAM << endl;
    cout << "Vector Add in the end: " << vA << endl;
    cout << "Vector Del in the start: " << vDS << endl;
    cout << "Vector Del in the middle: " << vDM << endl;
    cout << "Vector Del in the end: " << vD << endl;
    return 0;
}
