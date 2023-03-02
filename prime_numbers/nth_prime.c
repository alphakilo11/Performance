#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

int nth_prime(int n) {
    if (n <= 0) {
        return 0;
    }
    int primes[n];
    primes[0] = 2;
    int num = 3;
    int count = 1;
    while (count < n) {
        int is_prime = 1;
        int sqrt_num = sqrt(num) + 1;
        for (int i = 0; i < count; i++) {
            int p = primes[i];
            if (p > sqrt_num) {
                break;
            }
            if (num % p == 0) {
                is_prime = 0;
                break;
            }
        }
        if (is_prime) {
            primes[count] = num;
            count++;
        }
        num += 2;
    }
    return primes[count-1];
}

int main() {
    clock_t start_time = clock();
    for (int i = 0; i < 10; i++) {
        printf("%d\n", nth_prime(50000));
    }
    double duration = (double)(clock() - start_time) / CLOCKS_PER_SEC;
    printf("Dauer: %f\n", duration);
    return 0;
}
