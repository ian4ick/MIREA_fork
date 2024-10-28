#include <functional>
#include <iostream>
#include <vector>
#include <string>

using namespace std;
template <typename T>
class Tree {
    int key;
    T value;
    Tree* left;
    Tree* right;
    Tree* parent;
    int level;

public:
    Tree(int k, T v, Tree* p =nullptr) {
        level = 0;
        this->parent = p;
        this->left = nullptr;
        this->right = nullptr;
        this->key = k;
        this->value = v;
        /*while (p != nullptr) {
            level ++;
            p = p->parent;
        }*/
    }
    Tree(Tree* tree) {
        this->key = tree->key;
        this->value = tree->value;
        this->left = tree->left;
        this->right = tree->right;
        this->parent = tree->parent;
        this->level = tree->level;
    }
    void ll() {
        Tree* l = new Tree(this->left->left);
        Tree* r = new Tree(this);
        Tree* curr = new Tree(this->left);
        this->key = curr->key;
        this->value = curr->value;
        this->right = new Tree(r->key, r->value);
        this->right->parent = this;
        if (r->right != nullptr) {
            this->right->right = r->right;
            this->right->right->parent = this->right;
        }
        if (curr->right != nullptr) {
            this->right->left = curr->right;
            this->right->left->parent = this->right;
        }

        this->left = new Tree(l->key, l->value);
        this->left->parent = this;
        if (l->left != nullptr) {
            this->left->left = l->left;
            this->left->left->parent = this->left;
        }
        if (l->right != nullptr) {
            this->left->right = l->right;
            this->left->right->parent = this->left;
        }
    }
    void rr() {
        Tree* r = new Tree(this->right->right);
        Tree* l = new Tree(this);
        Tree* curr = new Tree(this->right);
        this->key = curr->key;
        this->value = curr->value;
        this->left = new Tree(l->key, l->value);
        this->left->parent = this;
        if (l->left != nullptr) {
            this->left->left = l->left;
            this->left->left->parent = this->left;
        }
        if (curr->left != nullptr) {
            this->left->right = curr->left;
            this->left->right->parent = this->left;
        }

        this->right = new Tree(r->key, r->value);
        this->right->parent = this;
        if (r->right != nullptr) {
            this->right->right = r->right;
            this->right->right->parent = this->right;
        }
        if (r->left != nullptr) {
            this->right->left = r->left;
            this->right->left->parent = this->right;
        }
    }
    void lr() {
        if (this->left->right->right != nullptr) {
            this->left->rr();
        }
        else {
            Tree* temp = new Tree(this->left);
            this->left = new Tree(this->left->right->key, this->left->right->value);
            this->left->left = new Tree(temp->key, temp->value);
            this->left->left->parent = this->left;
        }
        ll();
    }
    void rl() {
        if (this->right->left->left != nullptr) {
            this->right->ll();
        }
        else {
            Tree* temp = new Tree(this->right);
            this->right = new Tree(this->right->left->key, this->right->left->value);
            this->right->right = new Tree(temp->key, temp->value);
            this->right->right->parent = this->right;
        }
        rr();
    }

    void insert(int k, T v) {
        if (this->key == k) {
            if (this->value > 0) {
                ++this->value;
            }
            else {
                this->value = 1;
            }

            return;
        }
        if (this->key > k) {
            if (this->left == nullptr) {
                this->left = new Tree(k, v, this);
                balanceTree(this->left);
            }
            else {
                this->left->insert(k, v);
            }
        }
        else {
            if (this->right == nullptr) {
                this->right = new Tree(k, v, this);
                balanceTree(this->right);
            }
            else {
                this->right->insert(k, v);
            }
        }
    }
    T remove(int k) {
        Tree* temp = this;
        while (temp!=nullptr && temp->key != k) {
            if (temp->key > k) {
                temp = temp->left;
            }
            else if(temp->key < k) {
                temp = temp->right;
            }
        }
        if (temp->value > 1) {
            temp->value = temp->value - 1;
            return temp->value;
        }
        if (temp==nullptr)
            return T();

        if (temp->left != nullptr) {
            Tree* curr = temp->left;
            while (curr->right!=nullptr) {
                curr = curr->right;
            }
            temp->key = curr->key;
            temp->value = curr->value;
            (curr->parent->left == curr) ? curr->parent->left = nullptr : curr->parent->right = nullptr;
            delete curr;
            balanceTree(temp);
            return temp->value;
        }
        if (temp->right != nullptr) {
            temp->key = temp->right->key;
            temp->value = temp->right->value;
            temp->right = new Tree(temp->right->right);
            temp->right->parent = temp->right;
            balanceTree(temp);
            return temp->value;
        }
        if (temp->parent == nullptr) {
            this->key = -1;
            this->value = T();
            balanceTree(temp);
            return T();
        }
        Tree* curr = temp;
        (curr->parent->left == curr) ? curr->parent->left = nullptr : curr->parent->right = nullptr;
        balanceTree(curr);
        return temp->value;
    }

    T getValue(int k) {
        if (key == k) {
            return this->value;
        } else if (key > k && left != nullptr) {
            return left->getValue(k);
        } else if (key < k && right != nullptr) {
            return right->getValue(k);
        } else {
            return T();
        }

    }

    void updateLevels() {
        Tree* t = this;
        while (t->left != nullptr) {
            t = t->left;
        }
        while (t != this) {
            if (t->right != nullptr) {
                t->right->updateLevels();
            }
            (t->left == nullptr)? t->level = 0 : t->level = t->left->level + 1;
            (t->right == nullptr)? t->level : t->level = max(t->level, t->right->level + 1);
            t = t->parent;
        }
        if (t->right != nullptr) {
            t->right->updateLevels();
        }
        (t->left == nullptr)? t->level = 0 : t->level = t->left->level + 1;
        (t->right == nullptr)? t->level : t->level = max(t->level, t->right->level + 1);
    }
    void goThroughTree(vector<string>* v) {
        Tree* t = this;
        while (t->left != nullptr) {
            t = t->left;
        }
        while (t != this) {
            if (t->right != nullptr) {
                t->right->goThroughTree(v);
            }
            (t->left == nullptr)? t->level = 0 : t->level = t->left->level + 1;
            (t->right == nullptr)? t->level : t->level = max(t->level, t->right->level + 1);
            //cout << t->key << endl;
            if (v->size() == t->level) {
                string temp = to_string(t->key) + " ";
                for (int i = 1; i < t->value; i++) {
                    temp += to_string(t->key) + " ";
                }
                v->push_back(temp);
            }
            else if (v->size() < t->level) {
                while (v->size() > t->level) {
                    v->push_back("");
                }
                string temp = to_string(t->key) + " ";
                for (int i = 1; i < t->value; i++) {
                    temp += to_string(t->key) + " ";
                }
                v->push_back(temp);
            }
            else {
                string temp = to_string(t->key) + " ";
                for (int i = 1; i < t->value; i++) {
                    temp += to_string(t->key) + " ";
                }
                v->at(t->level) += " " + temp;
            }
            t = t->parent;
        }
        if (t->right != nullptr) {
            t->right->goThroughTree(v);
        }
        (t->left == nullptr)? t->level = 0 : t->level = t->left->level + 1;
        (t->right == nullptr)? t->level : t->level = max(t->level, t->right->level + 1);
        // cout << t->key << endl;
        if (v->size() == t->level) {
            string temp = to_string(t->key) + " ";
            for (int i = 1; i < t->value; i++) {
                temp += to_string(t->key) + " ";
            }
            v->push_back(temp);
        }
        else if (v->size() < t->level) {
            while (v->size() > t->level) {
                v->push_back("");
            }
            string temp = to_string(t->key) + " ";
            for (int i = 1; i < t->value; i++) {
                temp += to_string(t->key) + " ";
            }
            v->push_back(temp);
        }
        else {
            string temp = to_string(t->key) + " ";
            for (int i = 1; i < t->value; i++) {
                temp += to_string(t->key) + " ";
            }
            v->at(t->level) += " " + temp;
        }
    }
    void printTree() {
        auto* v = new vector<string>;
        goThroughTree(v);
        cout << "\nCurrent tree:" << endl;
        for (int i = v->size() - 1; i > -1; i--) {
            cout << v->at(i) << endl;
        }
    }

    void balanceTree(Tree* root) {
        if (root == nullptr) {
            return;
        }
        Tree* temp_p = root;
        while (temp_p->parent != nullptr) {
            temp_p = temp_p->parent;
        }
        temp_p->updateLevels();
        int a = -1;
        int b = -1;
        (root->left == nullptr)? a = -1: a = root->left->level;
        (root->right == nullptr)? b = -1: b = root->right->level;
        if (a - b > 1) {
            (root->left->left == nullptr)? a = -1: a = root->left->left->level;
            (root->left->right == nullptr)? b = -1: b = root->left->right->level;
            if (a >= b)
                root->ll();
            else// if (b > a)
                root->lr();
        }
        else if (b - a > 1) {
            (root->right->left == nullptr)? a = -1: a = root->right->left->level;
            (root->right->right == nullptr)? b = -1: b = root->right->right->level;
            if (a > b)
                root->rl();
            else// if (b > a)
                root->rr();
        }
        balanceTree(root->parent);
    }
    /*int sumTree(int currentSum) {
        Tree* t = this;
        while (t->left != nullptr) {
            t = t->left;
        }
        while (t != this) {
            if (t->right != nullptr) {
                currentSum += t->right->sumTree(currentSum);
            }
            (t->left == nullptr)? t->level = 0 : t->level = t->left->level + 1;
            (t->right == nullptr)? t->level : t->level = max(t->level, t->right->level + 1);
            //cout << t->key << endl;
            currentSum += t->key * t->value;
        }
        if (t->right != nullptr) {
            currentSum += t->right->sumTree(currentSum);
        }
        (t->left == nullptr)? t->level = 0 : t->level = t->left->level + 1;
        (t->right == nullptr)? t->level : t->level = max(t->level, t->right->level + 1);
        // cout << t->key << endl;
        currentSum += t->key * t->value;
        return currentSum;
    }*/
};
int sumNumsInStr(string res) {
    int sum = 0;
    int temp = 0;
    for (int i = 0; i < res.size(); i++) {
        if (res[i] == ' ') {
            sum += temp;
            temp = 0;
        }
        else {
            temp = temp*10 + stoi(&res[i]);
        }
    }
    sum += temp;
    return sum;
}

/*
3
a 2
a 4
a 5
p
p
s
 */

int main()
{
    int a;
    string s = "DefaultA";
    bool ok = true;
    cout << "Enter initial key:" << endl;
    cin >> a;// >> s;
    cout << endl << "List of commands: Num. Command | Info" << endl;
    cout << "1. a <value> | add value to arr" << endl;
    cout << "2. d <key> | delete value from arr" << endl;
    cout << "3. p | print arr" << endl;
    cout << "4. s | sum_arr" << endl;
    cout << "5. Exit" << endl;
    auto* tree = new Tree(a,1);
    while (ok) {
        cin>>s;
        if (s == "a") {
            cin>>a;//>>s;
            tree->insert(a,1);
        }
        else if (s == "d") {
            cin>>a;
            tree->remove(a);
        }
        else if (s == "p") {
            tree->printTree();
        }
        else if (s == "s") {
            auto* v = new vector<string>;
            tree->goThroughTree(v);
            int res = 0;
            for (int i = 0; i < v->size(); ++i) {
                string temp = v->at(i);
                res += sumNumsInStr(temp);
            }
            cout << "Sum of all values in the array: " << res << endl;
        }
        else if (s == "Exit")
            return 0;
        else{
            cout << "Enter valid-command again:" << endl;
        }

    }
}
