package main

import (
    "fmt"
    "math"
    "time"
)

func nthPrime(n int) int {
    if n <= 0 {
        return -1
    }
    primes := []int{2}
    num := 3
    for len(primes) < n {
        isPrime := true
        sqrtNum := int(math.Sqrt(float64(num))) + 1
        for _, p := range primes {
            if p > sqrtNum {
                break
            }
            if num%p == 0 {
                isPrime = false
                break
            }
        }
        if isPrime {
            primes = append(primes, num)
        }
        num += 2
    }
    return primes[len(primes)-1]
}

func main() {
    var times []float64
    var results []int
    for i := 0; i < 20; i++ {
        start := time.Now()
        results = append(results, nthPrime(50000))
        times = append(times, time.Since(start).Seconds())
    }
    fmt.Printf("%v\n%v\nMinimum: %v s.", times, results, min(times))
}

func min(nums []float64) float64 {
    min := nums[0]
    for _, num := range nums {
        if num < min {
            min = num
        }
    }
    return min
}
