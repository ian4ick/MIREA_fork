#include <iostream>
using namespace std;
class Graph {
    public:
    int n;
    int g[100][100];
    string names[100];
    Graph(const int x) {
        n=x;
        for(int i=0;i<n;i++) {
            for(int j=0;j<n;j++) {
                g[i][j]=0;
            }
            names[i]="";
        }
    }

    void addEdge(const int x, const int y, const int cost) {
        if (x>=n || y>=n || x<0 || y<0) {
            std::cout<<"Invalid Input\n";
            return;
        }
        if (x==y) {
            std::cout << "Same vertex";
            return;
        }
        g[x][y]=cost;
        g[y][x]=cost;
    }

    void removeEdge(const int x, const int y) {
        if (x>=n || y>=n || x<0 || y<0) {
            std::cout<<"Invalid Input\n";
            return;
        }
        if (x==y) {
            std::cout << "Same vertex";
            return;
        }
        g[x][y]=0;
        g[y][x]=0;
    }

    void displayAdjacencyMatrix() const {
        cout << "\nAdjacency Matrix:";
        for(int i=0;i<n;i++) {
            cout << "\n";
            for(int j=0;j<n;j++) {
                cout << g[i][j] << " ";
            }
        }
    }
    void addVertex(const string& name) {
        n++;
        for(int i=0;i<n;i++) {
            g[i][n - 1]=0;
            g[n-1][i]=0;
            names[n-1]=name;
        }
    }
    void removeVertex(int x) {
        if (x>=n || x<0) {
            std::cout<<"Invalid Input\n";
            return;
        }
        while (x<n) {
            for(int i=x;i<n;i++) {
                g[i][x]=g[i][x+1];
                names[i] = names[i+1];
            }
            for (int j=x;j<n;j++) {
                g[x][j]=g[x+1][j];
            }
            x++;
        }
        n--;
    }

    string getVertexName(const int x) {
        return names[x];
    }

    int get_by_power(const string& sx, const string&  sy) {
        int x,y;
        for(int i=0;i<n;i++) {
            if (sx==names[i]) {
                x = i;
            }
            if (sy==names[i]) {
                y = i;
            }
        }
        int temp[100][100];
        for(int i=0;i<n;i++) {
            for(int j=0;j<n;j++) {
                temp[i][j]=g[i][j];
            }
        }
        int k = 1;
        int temp2[100][100];
        while (temp[x][y] == 0) {
            k++;
            for(int i=0;i<n;i++) {
                for(int j=0;j<n;j++) {
                    temp2[i][j] = 0;
                    for (int k=0;k<n;k++) {
                        temp2[i][j] += temp[i][k] * g[k][j];
                    }
                }
            }
            for (int j=0;j<n;j++) {
                for(int k=0;k<n;k++) {
                    temp[k][j] = temp2[k][j];
                }
            }
        }
        return k;
    }



};

int main()
{
    Graph g(0);
    g.addVertex("A");
    g.addVertex("B");
    g.addVertex("C");
    g.addVertex("D");
    g.addVertex("E");
    g.addVertex("F");
    g.addEdge(0,1,1);
    g.addEdge(0,2,1);
    g.addEdge(1,3,1);
    g.addEdge(2,4,1);
    g.addEdge(4,3,1);
    g.addEdge(3,5,1);
    g.displayAdjacencyMatrix();
    cout << "\nMin path is: "<<g.get_by_power("A", "F")<<" steps";
    return 0;
}
