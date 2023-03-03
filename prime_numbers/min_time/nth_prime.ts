function nthPrime(n: number): number | null {
  if (n <= 0) {
    return null;
  }
  const primes = [2];
  let num = 3;
  while (primes.length < n) {
    let isPrime = true;
    const sqrtNum = Math.floor(Math.sqrt(num)) + 1;
    for (const p of primes) {
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

const times: number[] = [];
const results: (number | null)[] = [];
for (let i = 0; i < 20; i++) {
  const startTime = Date.now();
  results.push(nthPrime(50000));
  times.push((Date.now() - startTime) / 1000);
}

console.log(`${times}\n${results}\nMinimum: ${Math.min(...times)} s.`);
