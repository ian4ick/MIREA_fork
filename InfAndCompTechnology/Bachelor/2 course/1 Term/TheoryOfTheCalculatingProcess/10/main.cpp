#include <iostream>
using namespace std;
class Graph {
    int n;
    int g[100][100];
    string names[100];
public:
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
        std::cout << "\nAdjacency Matrix:";
        for(int i=0;i<n;i++) {
            std::cout << "\n";
            for(int j=0;j<n;j++) {
                std::cout << g[i][j] << " ";
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


};

int main()
{
    Graph g(0);
    g.addVertex("A");
    g.addVertex("B");
    g.addEdge(0,1,2);
    g.displayAdjacencyMatrix();
    cout << g.getVertexName(0) << endl;
    return 0;
}
