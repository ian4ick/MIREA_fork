#include <iostream>
class Graph {
    int n;
    int g[10][10];
public:
    Graph(const int x) {
        n=x;
        for(int i=0;i<n;i++) {
            for(int j=0;j<n;j++) {
                g[i][j]=0;
            }
        }
    }

    void addEdge(const int x, const int y) {
        if (x>=n || y>=n || x<0 || y<0) {
            std::cout<<"Invalid Input\n";
            return;
        }
        if (x==y) {
            std::cout << "Same vertex";
            return;
        }
        g[x][y]=1;
        g[y][x]=1;
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
    void addVertex() {
        n++;
        for(int i=0;i<n;i++) {
            g[i][n - 1]=0;
            g[n-1][i]=0;
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
            }
            for (int j=x;j<n;j++) {
                g[x][j]=g[x+1][j];
            }
            x++;
        }
        n--;
    }

    static Graph unionGraph(const Graph &g1, const Graph &g2) {
        Graph result = g1;
        Graph temp = g2;
        if (g1.n < g2.n) {
            result = g2;
            temp = g1;
        }
        for (int i=0;i<temp.n;i++) {
            for (int j=0;j<temp.n;j++) {
                result.g[i][j] |= temp.g[i][j];
            }
        }
        return result;
    }

    static Graph intersectionGraph(const Graph &g1, const Graph &g2) {
        Graph result = g1;
        Graph temp = g2;
        if (g1.n > g2.n) {
            result = g2;
            temp = g1;
        }
        for (int i=0;i<result.n;i++) {
            for (int j=0;j<result.n;j++) {
                result.g[i][j] &= temp.g[i][j];
            }
        }
        return result;
    }
};

int main()
{
    int x,y;
    std::cout<<"Enter number of vertices in the first graph\n";
    std::cin >> x;
    std::cout<<"Enter number of vertices in the second graph\n";
    std::cin >> y;
    Graph g1(x-1);
    Graph g2(y-1);

    g1.addVertex();
    g1.addEdge(0,1);
    g2.addVertex();
    g2.addEdge(0,2);

    g1.displayAdjacencyMatrix();
    g2.displayAdjacencyMatrix();

    std::cout<<"\nIntersection graph is";
    g1.intersectionGraph(g1,g2).displayAdjacencyMatrix();
    g2 = g1.unionGraph(g1,g2);
    std::cout << "\nUnion graph is";
    g2.displayAdjacencyMatrix();

    std::cout<<"\nCurrent graph is";
    g2.displayAdjacencyMatrix();
    g2.removeEdge(0,1);
    std::cout << "\nGraph after removing edge 0,1";
    g2.displayAdjacencyMatrix();
    g2.removeVertex(0);
    std::cout << "\nGraph after removing vertex 0";
    g2.displayAdjacencyMatrix();
    return 0;
}
