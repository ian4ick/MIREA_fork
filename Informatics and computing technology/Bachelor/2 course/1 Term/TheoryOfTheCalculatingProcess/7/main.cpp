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


        /*this->key = curr->key;
        this->value = curr->value;
        this->left->key = l->key;
        this->left->value = l->value;
        this->left->level = l->level;
        this->left->parent = this;
        this->level = curr->level;
        r->parent = this;
        this->right = r;*/
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



        /*Tree* curr = new Tree(this);
        if (curr->right != nullptr) {
            curr->right = new Tree(this->right->left);
            curr->right->parent = curr;
        }
        this->key = this->right->key;
        this->value = this->right->value;
        this->right = new Tree(this->right->right);
        this->right->parent = this;
        this->level = this->right->level;
        curr->parent = this;
        this->left = curr;*/
    }
    void lr() {
        /*
         *Tree* l = new Tree(this->left);
        Tree* r = new Tree(this->left->right);
        this->left = new Tree(r->key, r->value);
        this->left->parent = this;
        if (r->right != nullptr) {
            this->left->right = r->right;
            this->left->right->parent = this->left;
        }
        this->left->left = new Tree(l->key, l->value);
        this->left->left->parent = this->left;
        if (l->left != nullptr) {
            this->left->left->left = l->left;
            this->left->left->left->parent = this->left->left;
        }
        if (l->right != nullptr) {
            this->left->left->right = r->left;
            this->left->left->right->parent = this->left;
        }*/
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
        /*Tree* r = new Tree(this->right);
        Tree* l = new Tree(this->right->left);
        this->right = new Tree(l->key, l->value);
        this->right->parent = this;
        if (l->left != nullptr) {
            this->right->left = l->left;
            this->right->left->parent = this->right;
        }
        this->right->right = new Tree(r->key, r->value);
        this->right->right->parent = this->right;
        if (r->right != nullptr) {
            this->right->right->right = r->right;
            this->right->right->right->parent = this->right->right;
        }
        if (r->left != nullptr) {
            this->right->right->left = l->right;
            this->right->right->left->parent = this->right;
        }*/
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
            if (a > b)
                root->ll();
            else if (b > a)
                root->lr();
        }
        else if (b - a > 1) {
            (root->right->left == nullptr)? a = -1: a = root->right->left->level;
            (root->right->right == nullptr)? b = -1: b = root->right->right->level;
            if (a > b)
                root->rl();
            else if (b > a)
                root->rr();
        }
        balanceTree(root->parent);

        /*Tree* p = root->parent;
        if (p == nullptr) {
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

        */

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

 */
/*
4
3
2
4
1
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
    cin>>a;
    tree->remove(a);
    tree->printTree();
    return 0;
}
