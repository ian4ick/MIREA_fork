#include <functional>
#include <iostream>
#include <vector>
/*
11
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
        Tree* curr = new Tree(this);
        this->key = this->left->key;
        this->value = this->left->value;
        this->left = new Tree(this->left->left);
        this->left->parent = this;
        this->right = this->left->right;
        this->level = this->left->level;
        this->parent = curr->parent;
        curr->parent = this;
        curr->left = nullptr;
        this->right = curr;


    }
    void rr() {
        Tree* curr = new Tree(this);
        this->key = this->right->key;
        this->value = this->right->value;
        this->right = new Tree(this->right->right);
        this->right->parent = this;
        this->left = this->right->left;
        this->level = this->right->level;
        this->parent = curr->parent;
        curr->parent = this;
        curr->right = nullptr;
        this->left = curr;
    }
    void lr() {
        Tree* temp = new Tree(this->left);
        Tree* curr = new Tree(this->left->right);
        this->left->key = curr->key;
        this->left->value = curr->value;
        this->left->right = nullptr;
        this->left->left = temp;
        this->left->left->parent = this->left;
        this->left->left->left = nullptr;
        this->left->left->right = nullptr;
        this->ll();
    }
    void rl() {
        Tree* temp = new Tree(this->right);
        Tree* curr = new Tree(this->right->left);
        this->right->key = curr->key;
        this->right->value = curr->value;
        this->right->left = nullptr;
        this->right->right = temp;
        this->right->right->parent = this->right;
        this->right->right->right = nullptr;
        this->right->right->left = nullptr;
        this->rr();
    }

    void insert(int k, T v) {
        if (this->key == k) {
            this->value = v;
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
                v->push_back(to_string(t->key));
            }
            else if (v->size() < t->level) {
                while (v->size() > t->level) {
                    v->push_back("");
                }
                v->push_back(to_string(t->key));
            }
            else {
                v->at(t->level) += " " + to_string(t->key);
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
            v->push_back(to_string(t->key));
        }
        else if (v->size() < t->level) {
            while (v->size() > t->level) {
                v->push_back("");
            }
            v->push_back(to_string(t->key));
        }
        else {
            v->at(t->level) += " " + to_string(t->key);
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
        Tree* temp_p = root;
        while (temp_p->parent != nullptr) {
            temp_p = temp_p->parent;
        }
        temp_p->updateLevels();
        Tree* p = root->parent;
        if (p == nullptr || p->parent == nullptr) {
            return;
        }
        if (p->left == root) {
            if (p->right == nullptr) {
                if (p->parent->left == p && p->parent->right == nullptr) {
                    p->parent->ll();
                    balanceTree(p->parent);
                    return;
                }
                if (p->parent->right == p && p->parent->left == nullptr) {
                    p->parent->rl();
                    balanceTree(p->parent);
                    return;
                }
            }
        }
        else if (p->right == root) {
            if (p->left == nullptr) {
                if (p->parent->right == p && p->parent->left == nullptr) {
                    p->parent->rr();
                    balanceTree(p->parent);
                    return;
                }
                if (p->parent->left == p && p->parent->left == nullptr) {
                    p->parent->lr();
                    balanceTree(p->parent);
                    return;
                }
            }
        }



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
};
/*
11
5
3
4
7
6
8
1
2
9
11
10
5

 */
/*
4
1
3
2
4
 */
int main() {
    int a, n;
    string s="Debug";
    cin>>n;
    cin>>a;
    //cin>>s;
    auto* tree = new Tree(a, s);
    for (int i = 1; i < n; i++) {
        cin>>a;
        //cin>>s;
        tree->insert(a, s);
        tree->printTree();
    }

    return 0;
}
