#include <stdio.h>
#include <pthread.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <time.h>
#include <stdlib.h>
#include <unistd.h>

typedef struct {
    const double** input_matrix;
    double* result_matrix;
    int start_row;
    int end_row;
    int columns;
} ThreadInfo;

void* transpose_worker(void* args);
int parallel_transpose(const double** matrix, double* transposed, int rows, int cols);

#define ROWS 10000
#define COLS 5000

int main() {
    struct timespec start_time, end_time;
    double** matrix = (double**)malloc(ROWS * sizeof(double*));
    for (int i = 0; i < ROWS; i++) {
        matrix[i] = (double*)malloc(COLS * sizeof(double));
    }
    double* transposed_matrix = (double*)malloc(ROWS * COLS * sizeof(double));
    
    for (int i = 0; i < ROWS; i++) {
        for (int j = 0; j < COLS; j++) {
            matrix[i][j] = 10 * i + j;
        }
    }

    clock_gettime(CLOCK_MONOTONIC, &start_time);
    int res = parallel_transpose((const double**)matrix, transposed_matrix, ROWS, COLS);
    clock_gettime(CLOCK_MONOTONIC, &end_time);

    long elapsed_time = 1000000000 * (end_time.tv_sec - start_time.tv_sec) + (end_time.tv_nsec - start_time.tv_nsec);
    printf("Took time: %ld ns\n", elapsed_time);

    for (int i = 0; i < ROWS; i++) {
        free(matrix[i]);
    }
    free(matrix);
    free(transposed_matrix);

    return res;
}

void* transpose_worker(void* args) {
    ThreadInfo* thread_data = (ThreadInfo*)args;
    for (int i = thread_data->start_row; i < thread_data->end_row; i++) {
        for (int j = 0; j < thread_data->columns; j++) {
            thread_data->result_matrix[j * thread_data->columns + i] = thread_data->input_matrix[i][j];
        }
    }
    return NULL;
}

int parallel_transpose(const double** matrix, double* transposed, int rows, int cols) {
    int thread_count = sysconf(_SC_NPROCESSORS_ONLN);
    int rows_per_thread = rows / thread_count;
    pthread_t* threads = (pthread_t*)malloc(thread_count * sizeof(pthread_t));
    ThreadInfo* thread_data = (ThreadInfo*)malloc(thread_count * sizeof(ThreadInfo));

    printf("Parallel variant:\n");
    for (int i = 0; i < thread_count; i++) {
        thread_data[i].start_row = i * rows_per_thread;
        thread_data[i].end_row = (i == thread_count - 1) ? rows : (i + 1) * rows_per_thread;
        thread_data[i].input_matrix = matrix;
        thread_data[i].result_matrix = transposed;
        thread_data[i].columns = cols;

        pthread_create(&threads[i], NULL, transpose_worker, &thread_data[i]);
    }

    for (int i = 0; i < thread_count; i++) {
        pthread_join(threads[i], NULL);
    }

    free(threads);
    free(thread_data);
    return 0;
}
