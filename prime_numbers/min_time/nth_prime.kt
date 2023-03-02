import kotlin.math.sqrt

fun nthPrime(n: Int): Int? {
    if (n <= 0) return null
    var primes = listOf(2)
    var num = 3
    while (primes.size < n) {
        var isPrime = true
        val sqrtNum = sqrt(num.toDouble()).toInt() + 1
        for (p in primes) {
            if (p > sqrtNum) break
            if (num % p == 0) {
                isPrime = false
                break
            }
        }
        if (isPrime) primes += num
        num += 2
    }
    return primes.last()
}

fun main() {
    val times = mutableListOf<Double>()
    val results = mutableListOf<Int>()
    repeat(20) {
        val start = System.nanoTime()
        results += nthPrime(50000)!!
        times += (System.nanoTime() - start) / 1_000_000_000.0
    }
    println("$times\n$results\nMinimum: ${times.minOrNull()} s.")
}
