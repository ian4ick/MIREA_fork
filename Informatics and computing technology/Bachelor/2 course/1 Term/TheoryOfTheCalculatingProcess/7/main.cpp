#include <functional>
#include <iostream>
#include <vector>
/*10
5
e
3
c
4
d
7
h
6
f
8
i
1
a
2
b
9
j
11
l
10
k
5
4 6
3 7
2 8
1 9
10
11
 */
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
        while (p != nullptr) {
            level ++;
            p = p->parent;
        }
    }


    void balanceTree() {
        return;
        /*if (this->left != nullptr) {
            if (this->left->left != nullptr && this->right == nullptr) {
                this->ll();
            }
            else if(this->left->right != nullptr && this->right == nullptr) {
                this->lr();
            }
            else {
                this->left->balanceTree();
                this->right->balanceTree();
            }
        }
        if (this->right != nullptr) {
            if (this->right->right != nullptr && this->left == nullptr) {
                this->rr();
            }
            else if(this->right->left != nullptr && this->left == nullptr) {
                this->rl();
            }
            else {
                this->right->balanceTree();
                this->left->balanceTree();
            }
        }*/
    }

    /*
     *
     *int getLen(int l) {
        Tree* current = this;
        while (current->parent != nullptr) {
            current = current->parent;
            l++;
        }
        this->level = l;
        return l;
    }*/

    void ll() {
        Tree* r = this;
        Tree* l = this->left->left;
        Tree* t = this->left;

        this->right = r;
        this->right->parent = this;
        this->key = t->key;
        this->value = t->value;
        this->left = l;
    }
    /*void rr() {
        this->left = this;
        --this->left->level;
        this = this->right;
    }
    void lr() {
        this->left->left = this->left->right;
        this->ll();
    }
    void rl() {
        this->right->right = this->right->left;
        this->rr();
    }*/

    void insert(int k, T v) {
        if (this->key == k) {
            this->value = v;
            return;
        }
        if (this->key > k) {
            if (this->left == nullptr) {
                this->left = new Tree(k, v, this);
            }
            else {
                this->left->insert(k, v);
            }
        }
        else {
            if (this->right == nullptr) {
                this->right = new Tree(k, v, this);
            }
            else {
                this->right->insert(k, v);
            }
        }
        balanceTree();

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
    void goThroughTree() {

    }
    void printTree() {
        vector<string>* v = new vector<string>;
        Tree* temp = this;
        while (temp->left != nullptr) {
            temp = temp->left;
        }
        v->push_back(temp);
        for (int i; i < v->size(); i++) {
            cout << v->at(i) << endl;
        }
    }
};

int main() {
    int a, n;
    string s;
    cin>>n;
    cin>>a;
    cin>>s;
    Tree<string> tree(a, s);
    for (int i =0; i < n; i++) {
        cin>>a;
        cin>>s;
        tree.insert(a, s);
    }
    tree.printTree();
    tree.ll();
    tree.printTree();
    return 0;
}
