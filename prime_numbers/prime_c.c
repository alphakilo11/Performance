// (249, 389, 570) ms on GDB online

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <sys/time.h>

bool isPrime(int num);

int main(void) {
    int n = 50000;
    long startTime, endTime, duration;
    int count = 0;
    struct timeval tval;

    gettimeofday(&tval, NULL);
    startTime = tval.tv_sec * 1000 + tval.tv_usec / 1000;

    for (int i = 2; count < n; i++) {
        if (isPrime(i)) {
            count++;
        }
    }

    gettimeofday(&tval, NULL);
    endTime = tval.tv_sec * 1000 + tval.tv_usec / 1000;

    duration = endTime - startTime;

    printf("Time taken to calculate first %d prime numbers: %ld milliseconds\n", n, duration);

    return 0;
}

bool isPrime(int num) {
    if (num <= 1) {
        return false;
    }
    for (int i = 2; i <= sqrt(num); i++) {
        if (num % i == 0) {
            return false;
        }
    }
    return true;
}
