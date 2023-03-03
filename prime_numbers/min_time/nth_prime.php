<?php

function nth_prime($n) {
    /**
     * This function takes an integer n and returns the nth prime number.
     * Source: ChatGPT Feb 13 Version
     */
    if ($n <= 0) {
        return null;
    }
    $primes = [2];
    $num = 3;
    while (count($primes) < $n) {
        $is_prime = true;
        $sqrt_num = intval(sqrt($num)) + 1;
        foreach ($primes as $p) {
            if ($p > $sqrt_num) {
                break;
            }
            if ($num % $p == 0) {
                $is_prime = false;
                break;
            }
        }
        if ($is_prime) {
            $primes[] = $num;
        }
        $num += 2;
    }
    return end($primes);
}

$times = [];
$results = [];
for ($i = 0; $i < 20; $i++) {
    $start_time = microtime(true);
    $results[] = nth_prime(50000);
    $times[] = microtime(true) - $start_time;
}

echo implode("\n", $times) . "\n";
echo implode("\n", $results) . "\n";
echo "Minimum: " . min($times) . " s.";

?>
