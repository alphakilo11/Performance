import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        long start_time = System.nanoTime();
        for (int i = 0; i < 10; i++) {
            System.out.println(nth_prime(50000));
        }
        long end_time = System.nanoTime();
        System.out.printf("Dauer: %f seconds%n", (end_time - start_time) / 1_000_000_000.0);
    }

    public static int nth_prime(int n) {
        if (n <= 0) {
            return -1;
        }
        int[] primes = {2};
        int num = 3;
        while (primes.length < n) {
            boolean is_prime = true;
            int sqrt_num = (int) Math.sqrt(num) + 1;
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
                primes = Arrays.copyOf(primes, primes.length + 1);
                primes[primes.length - 1] = num;
            }
            num += 2;
        }
        return primes[primes.length - 1];
    }
}
