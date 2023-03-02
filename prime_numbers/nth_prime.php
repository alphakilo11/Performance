function nthPrime($n) {
    if ($n <= 0) {
        return null;
    }
    $primes = [2];
    $num = 3;
    while (count($primes) < $n) {
        $isPrime = true;
        $sqrtNum = intval(sqrt($num)) + 1;
        foreach ($primes as $p) {
            if ($p > $sqrtNum) {
                break;
            }
            if ($num % $p == 0) {
                $isPrime = false;
                break;
            }
        }
        if ($isPrime) {
            $primes[] = $num;
        }
        $num += 2;
    }
    return end($primes);
}

$start = microtime(true);
for ($i = 0; $i < 10; $i++) {
    echo nthPrime(50000) . "\n";
}
echo "Duration: " . (microtime(true) - $start) . "\n";
