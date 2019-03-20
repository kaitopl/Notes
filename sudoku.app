#include <iostream>

using namespace std;
int sudoku[9][9] = { 0 };

int CheckSomeone(int x, int y) //检查某个格子的解是否合法
{
    for (int i = 0; i < 9; i++) //行
        if (i != y)
            if (sudoku[x][y] == sudoku[x][i])
                return 0;
    for (int i = 0; i < 9; i++) //列
        if (i!=x)
            if (sudoku[x][y] == sudoku[i][y])
                return 0;
    for (int i = x / 3 * 3; i < x / 3 * 3 + 3; i++) //宫
        for (int j = y / 3 * 3; j < y / 3 * 3 + 3; j++)
            if (i != x || j != y)
                if (sudoku[i][j] == sudoku[x][y])
                    return 0;
    return 1;
}

void DFSsudoku(int x, int y)
{
    if (x == 9) //得到解,输出结果
    {
        cout << endl;
        for (int i = 0; i < 9; i++)
            for (int j = 0; j < 9; j++)
            {
                printf("%d", sudoku[i][j]);
                if (j == 8)
                    cout << endl;
            }
    }

    if (sudoku[x][y] != 0) //跳过已填项
        DFSsudoku(x + (y + 1) / 9, (y + 1) % 9);
    else
    {
        for (int i = 1; i <= 9; i++)
        {
            sudoku[x][y] = i;
            if (CheckSomeone(x, y))
                DFSsudoku(x + (y + 1) / 9, (y + 1) % 9);
        }
        sudoku[x][y] = 0;
    }
}


int main()
{
    for (int i = 0; i < 9; i++)
        for (int j = 0; j < 9; j++)
            scanf("%1d", &sudoku[i][j]);
    DFSsudoku(0, 0);
}
