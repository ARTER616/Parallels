#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <time.h>

#define ROWS 10000
#define COLS 5000

void initialize_matrix(double *matrix, int local_rows, int rank, int size);
void transpose_block(const double *local_matrix, double *local_transposed, int local_rows, int cols);


int main(int argc, char *argv[]) {
    MPI_Init(&argc, &argv);

    int size, rank;
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    int rows_per_proc = ROWS / size;
    int remaining_rows = ROWS % size;
    int local_rows = (rank < remaining_rows) ? rows_per_proc + 1 : rows_per_proc;

    double *local_matrix = malloc(local_rows * COLS * sizeof(double));
    double *local_transposed = malloc(local_rows * COLS * sizeof(double));

    initialize_matrix(local_matrix, local_rows, rank, size);

    MPI_Barrier(MPI_COMM_WORLD);
    double start_time = MPI_Wtime();

    transpose_block(local_matrix, local_transposed, local_rows, COLS);

    MPI_Barrier(MPI_COMM_WORLD);
    double end_time = MPI_Wtime();

    double local_elapsed_ns = (end_time - start_time) * 1e9;
    double global_elapsed_ns;

    MPI_Reduce(&local_elapsed_ns, &global_elapsed_ns, 1, MPI_DOUBLE, MPI_MAX, 0, MPI_COMM_WORLD);

    if (rank == 0) {
        printf("Execution Time: %.0f ns\n", global_elapsed_ns);
    }

    free(local_matrix);
    free(local_transposed);

    MPI_Finalize();
    return 0;
}

void initialize_matrix(double *matrix, int local_rows, int rank, int size) {
    int global_row_index = rank * (ROWS / size) + (rank < (ROWS % size) ? rank : (ROWS % size));
    for (int i = 0; i < local_rows; i++) {
        for (int j = 0; j < COLS; j++) {
            matrix[i * COLS + j] = (global_row_index + i) * 100 + j;
        }
    }
}

void transpose_block(const double *src, double *dst, int local_rows, int cols) {
    for (int i = 0; i < local_rows; i++) {
        for (int j = 0; j < cols; j++) {
            dst[j * local_rows + i] = src[i * cols + j];
        }
    }
}
