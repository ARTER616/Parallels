#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define ROWS 10000
#define COLS 5000

int transpose_sequential(const double** input_matrix, double* output_matrix, int rows, int cols);

int main() {
    struct timespec start_time, end_time;
    double** original_matrix = (double**)malloc(ROWS * sizeof(double*));
    for (int i = 0; i < ROWS; i++) {
        original_matrix[i] = (double*)malloc(COLS * sizeof(double));
    }
    double* transposed_matrix = (double*)malloc(ROWS * COLS * sizeof(double));
    for (int i = 0; i < ROWS; i++) {
        for (int j = 0; j < COLS; j++) {
            original_matrix[i][j] = 10 * i + j;
        }
    }
    long elapsed_time;

    clock_gettime(CLOCK_MONOTONIC, &start_time);
    int result = transpose_sequential((const double**)original_matrix, transposed_matrix, ROWS, COLS);
    clock_gettime(CLOCK_MONOTONIC, &end_time);
    elapsed_time = 1000000000 * (end_time.tv_sec - start_time.tv_sec) + (end_time.tv_nsec - start_time.tv_nsec);
    printf("Took time: %ld \n", elapsed_time);

    for (int i = 0; i < ROWS; i++) {
        free(original_matrix[i]);
    }
    free(original_matrix);
    free(transposed_matrix);

    return 0;
}

int transpose_sequential(const double** input_matrix, double* output_matrix, int rows, int cols) {
    if (!input_matrix || !output_matrix)
        return 1;
    printf("Unoptimized variant:\n");
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            output_matrix[i + rows * j] = input_matrix[i][j];
        }
    }
    return 0;
}
