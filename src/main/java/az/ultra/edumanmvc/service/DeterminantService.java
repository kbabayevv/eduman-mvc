package az.ultra.edumanmvc.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DeterminantService {
    public int calculateDeterminant(int[][] matrix) {
        int n = matrix.length;

        if (n == 1) {
            return matrix[0][0];
        } else if (n == 2) {
            return matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0];
        }

        int determinant = 0;

        for (int i = 0; i < n; i++) {
            int[][] subMatrix = new int[n - 1][n - 1];
            for (int j = 1; j < n; j++) {
                for (int k = 0, columnIndex = 0; k < n; k++) {
                    if (k != i) {
                        subMatrix[j - 1][columnIndex] = matrix[j][k];
                        columnIndex++;
                    }
                }
            }
            determinant += matrix[0][i] * calculateDeterminant(subMatrix) * (int) Math.pow(-1, i);
        }
        return determinant;
    }

}
