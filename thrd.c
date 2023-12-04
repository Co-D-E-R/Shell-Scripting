// WAP in C to create two threads. The Main thread will take a series of integers as
// input and send the first half of the series to Thread-1 and second half to Thread2. Thread-1 will sort the elements in ascending order and return it back to Main,
// where Thread-2 will sort the elements in descending order and return it back to
// Main. The Main #include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define SIZE 10  // Size of the array

int compare_ascending(const void *a, const void *b) {
    return (*(int*)a - *(int*)b);
}

int compare_descending(const void *a, const void *b) {
    return (*(int*)b - *(int*)a);
}

void *sort_ascending(void *param) {
    int *half = (int *)param;
    qsort(half, SIZE / 2, sizeof(int), compare_ascending);
    return half;
}

void *sort_descending(void *param) {
    int *half = (int *)param;
    qsort(half, SIZE / 2, sizeof(int), compare_descending);
    return half;
}

int main() {
    pthread_t tid1, tid2;

    int size;
    printf("Enter the size of the array: ");
    scanf("%d", &size);

    int *half1 = malloc(size / 2 * sizeof(int));
    int *half2 = malloc(size / 2 * sizeof(int));

    printf("Enter %d integers: ", size);
    for (int i = 0; i < size; i++) {
        int num;
        scanf("%d", &num);
        if (i < size / 2) {
            half1[i] = num;
        } else {
            half2[i - size / 2] = num;
        }
    }

    pthread_create(&tid1, NULL, sort_ascending, half1);
    pthread_create(&tid2, NULL, sort_descending, half2);

    void *sorted_half1;
    void *sorted_half2;
    pthread_join(tid1, &sorted_half1);
    pthread_join(tid2, &sorted_half2);

    printf("First half sorted in ascending order: ");
    for (int i = 0; i < size / 2; i++) {
        printf("%d ", ((int *)sorted_half1)[i]);
    }
    printf("\n");

    printf("Second half sorted in descending order: ");
    for (int i = 0; i < size / 2; i++) {
        printf("%d ", ((int *)sorted_half2)[i]);
    }
    printf("\n");

    free(half1);
    free(half2);

    return 0;
}