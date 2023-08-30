import java.util.*;

class NQueensRonit {

    public static void helper(char[][] board, List<List<String>> allBoards, int col) {
        if (col == board.length) {
            saveBoard(board, allBoards);
            return;
        }
        for (int row = 0; row < board.length; row++) {
            if (isSafe(row, col, board)) {
                board[row][col] = 'Q';
                helper(board, allBoards, col + 1);
                board[row][col] = '.';
            }
        }

    }

    public static boolean isSafe(int row, int col, char[][] board) {
        // horizontal
        for (int j = 0; j < board.length; j++) {
            if (board[row][j] == 'Q')
                return false;
        }
        for (int j = 0; j < board.length; j++) {
            if (board[j][col] == 'Q')
                return false;
        }
        // upper left
        int r = row;
        for (int c = col; c >= 0 && r >= 0; c--, r--) {
            if (board[r][c] == 'Q')
                return false;
        }
        // upper right
        r = row;
        for (int c = col; c < board.length && r >= 0; r--, c++) {
            if (board[r][c] == 'Q')
                return false;
        }
        // lower left
        r = row;
        for (int c = col; c >= 0 && r < board[0].length; c--, r++) {
            if (board[r][c] == 'Q')
                return false;
        }
        // lower right
        r = row;
        for (int c = col; c < board.length && r < board.length; c++, r++) {
            if (board[r][c] == 'Q')
                return false;
        }
        return true;
    }

    public static void saveBoard(char[][] board, List<List<String>> allBoards) {
        String row = "";
        List<String> newboard = new ArrayList();
        for (int i = 0; i < board.length; i++) {
            row = "";
            for (int j = 0; j < board.length; j++) {
                if (board[i][j] == 'Q')
                    row += 'Q';
                else
                    row += '.';
            }
            newboard.add(row);
        }
        allBoards.add(newboard);
    }

    public static List<List<String>> solveNQueens(int n) {
        List<List<String>> allBoards = new ArrayList<>();
        char[][] board = new char[n][n];
        helper(board, allBoards, 0);
        return allBoards;
    }

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        List<List<String>> FinalBoard = new ArrayList<>();
        List<String> access = new ArrayList();
        int n;
        System.out.println("Enter the size of the board");
        n = in.nextInt();
        FinalBoard = solveNQueens(n);

        for (int i = 0; i < FinalBoard.size(); i++) {
            for (int j = 0; j < FinalBoard.get(i).size(); j++)
                System.out.println(FinalBoard.get(i).get(j) + "    ");

            System.out.println();

        }

    }
}