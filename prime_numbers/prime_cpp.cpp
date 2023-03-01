// this did not work

#include <iostream>
#include <chrono>
#include <cmath>

bool isPrime(int num);

int main() {
    int n = 5000;
    long startTime, endTime, duration;
    int count = 0;

    auto start = std::chrono::high_resolution_clock::now();
    while (count < n) {
        if (isPrime(count)) {
            count++;
        }
    }
    auto end = std::chrono::high_resolution_clock::now();

    duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
    std::cout << "Time taken to calculate first " << n << " prime numbers: " << duration << " milliseconds\n";

    return 0;
}

bool isPrime(int num) {
    if (num <= 1) {
        return false;
    }
    for (int i = 2; i <= std::sqrt(num); i++) {
        if (num % i == 0) {
            return false;
        }
    }
    return true;
}
