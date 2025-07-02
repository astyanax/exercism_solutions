import java.util.Arrays;

class Matrix {
    private int[][] rows;
    Matrix(String input) {
        String[] temp = input.split("\n");
        int[][] arr = new int[temp.length][];
        for(int i=0; i<temp.length; i++){
            arr[i] = Arrays.stream(temp[i].split(" ")).mapToInt(Integer::parseInt).toArray();
        }
        rows = arr;
    }

    int[] getRow(int rowNumber) {
        return rows[rowNumber-1];
    }

    int[] getColumn(int columnNumber) {
        int[] col = new int[rows.length];
        for(int i=0; i<col.length; i++){
            col[i] = rows[i][columnNumber-1];
        }
        return col;
    }
}