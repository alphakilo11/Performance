import Foundation

func nthPrime(_ n: Int) -> Int? {
    if n <= 0 {
        return nil
    }
    var primes = [2]
    var num = 3
    while primes.count < n {
        var isPrime = true
        let sqrtNum = Int(sqrt(Double(num))) + 1
        for p in primes {
            if p > sqrtNum {
                break
            }
            if num % p == 0 {
                isPrime = false
                break
            }
        }
        if isPrime {
            primes.append(num)
        }
        num += 2
    }
    return primes.last
}

var times: [TimeInterval] = []
var results: [Int] = []
for _ in 0..<20 {
    let start = Date()
    results.append(nthPrime(50000)!)
    times.append(Date().timeIntervalSince(start))
}

print("\(times)\n\(results)\nMinimum: \(times.min()!) s.")
