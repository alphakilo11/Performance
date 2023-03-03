#include <iostream>
#include <vector>
#include <cmath>
#include <chrono>
#include <algorithm>

using namespace std;

int nth_prime(int n) {
    if (n <= 0) return -1;

    vector<int> primes{2};
    int num = 3;

    while (primes.size() < n) {
        bool is_prime = true;
        int sqrt_num = sqrt(num) + 1;
        for (int p : primes) {
            if (p > sqrt_num) break;
            if (num % p == 0) {
                is_prime = false;
                break;
            }
        }
        if (is_prime) primes.push_back(num);
        num += 2;
    }
    return primes.back();
}

int main() {
    vector<double> times;
    vector<int> results;
    for (int i = 0; i < 20; ++i) {
        auto start_time = chrono::high_resolution_clock::now();
        results.push_back(nth_prime(50000));
        auto end_time = chrono::high_resolution_clock::now();
        times.push_back(chrono::duration_cast<chrono::duration<double>>(end_time - start_time).count());
    }
    cout << "[";
    for (double t : times) cout << t << ", ";
    cout << "]\n[";
    for (int r : results) cout << r << ", ";
    cout << "]\nMinimum: " << *min_element(times.begin(), times.end()) << " s." << endl;
    return 0;
}
