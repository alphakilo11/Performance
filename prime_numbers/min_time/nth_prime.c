#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

int nth_prime(int n) {
    if (n <= 0) {
        return NULL;
    }
    int *primes = (int*)malloc(n * sizeof(int));
    primes[0] = 2;
    int num = 3;
    int i = 1;
    while (i < n) {
        int is_prime = 1;
        int sqrt_num = sqrt(num) + 1;
        for (int j = 0; j < i; j++) {
            int p = primes[j];
            if (p > sqrt_num) {
                break;
            }
            if (num % p == 0) {
                is_prime = 0;
                break;
            }
        }
        if (is_prime) {
            primes[i++] = num;
        }
        num += 2;
    }
    int result = primes[n - 1];
    free(primes);
    return result;
}

int main() {
    clock_t start_time, end_time;
    double min_time = 500;
    double elapsed_time;
    double times[20];
    int results[20];
    for (int i = 0; i < 20; i++) {
        start_time = clock();
        results[i] = nth_prime(50000);
        end_time = clock();
        elapsed_time = ((double) (end_time - start_time)) / CLOCKS_PER_SEC;
        times[i] = elapsed_time;
        if (elapsed_time < min_time) {
            min_time = elapsed_time;
        }
    }
    printf("[");
    for (int i = 0; i < 20; i++) {
        printf("%.6f, ", times[i]);
    }
    printf("]\n[");
    for (int i = 0; i < 20; i++) {
        printf("%d, ", results[i]);
    }
    printf("]\nMinimum: %.6f s.\n", min_time);
    return 0;
}
