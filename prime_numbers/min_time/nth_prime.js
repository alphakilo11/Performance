function nthPrime(n) {
    if (n <= 0) {
        return null;
    }
    var primes = [2];
    var num = 3;
    while (primes.length < n) {
        var isPrime = true;
        var sqrtNum = Math.sqrt(num) + 1;
        for (var i = 0; i < primes.length; i++) {
            var p = primes[i];
            if (p > sqrtNum) {
                break;
            }
            if (num % p === 0) {
                isPrime = false;
                break;
            }
        }
        if (isPrime) {
            primes.push(num);
        }
        num += 2;
    }
    return primes[primes.length - 1];
}

var times = [];
var results = [];
for (var i = 0; i < 20; i++) {
    var start = new Date().getTime();
    results.push(nthPrime(50000));
    times.push((new Date().getTime() - start) / 1000);
}
print(times);
print(results);
print("Minimum: " + Math.min.apply(null, times) + " s.");
