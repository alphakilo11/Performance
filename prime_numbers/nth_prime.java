import java.util.ArrayList;

public class Main {

    public static int nthPrime(int n) {
        if (n <= 0) {
            return 0;
        }
        ArrayList<Integer> primes = new ArrayList<>();
        primes.add(2);
        int num = 3;
        while (primes.size() < n) {
            boolean isPrime = true;
            int sqrtNum = (int)Math.sqrt(num) + 1;
            for (int p : primes) {
                if (p > sqrtNum) {
                    break;
                }
                if (num % p == 0) {
                    isPrime = false;
                    break;
                }
            }
            if (isPrime) {
                primes.add(num);
            }
            num += 2;
        }
        return primes.get(primes.size()-1);
    }

    public static void main(String[] args) {
        long startTime = System.nanoTime();
        for (int i =
