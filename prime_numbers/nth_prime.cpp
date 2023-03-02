#include <iostream>
#include <vector>
#include <cmath>
#include <chrono>

int nth_prime(int n) {
    if (n <= 0) {
        return 0;
    }
    std::vector<int> primes;
    primes.push_back(2);
    int num = 3;
    while (primes.size() < n) {
        bool is_prime = true;
        int sqrt_num = sqrt(num) + 1;
        for (int p : primes) {
            if (p > sqrt_num) {
                break;
            }
            if (num % p == 0) {
                is_prime = false;
                break;
            }
        }
        if (is_prime) {
            primes.push_back(num);
        }
        num += 2;
    }
    return primes.back();
}

int main() {
    auto start_time = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < 10; i++) {
        std::cout << nth_prime(50000) << std::endl;
    }
    auto end_time = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration = end_time - start_time;
    std::cout << "Dauer: " << duration.count() << std::endl;
    return 0;
}
