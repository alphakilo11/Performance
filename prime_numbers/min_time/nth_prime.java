import java.util.ArrayList;
import java.util.List;
import java.lang.Math;
import java.time.Duration;
import java.time.Instant;

public class Main {
    public static Integer nth_prime(int n) {
        if (n <= 0) {
            return null;
        }
        List<Integer> primes = new ArrayList<Integer>();
        primes.add(2);
        int num = 3;
        while (primes.size() < n) {
            boolean is_prime = true;
            int sqrt_num = (int)Math.sqrt(num) + 1;
            for (Integer p : primes) {
                if (p > sqrt_num) {
                    break;
                }
                if (num % p == 0) {
                    is_prime = false;
                    break;
                }
            }
            if (is_prime) {
                primes.add(num);
            }
            num += 2;
        }
        return primes.get(primes.size() - 1);
    }

    public static void main(String[] args) {
        List<Double> times = new ArrayList<Double>();
        List<Integer> results = new ArrayList<Integer>();
        for (int i = 0; i < 20; i++) {
            Instant start_time = Instant.now();
            results.add(nth_prime(50000));
            Instant end_time = Instant.now();
            Duration elapsed_time = Duration.between(start_time, end_time);
            times.add(elapsed_time.toMillis() / 1000.0);
        }
        System.out.print("Times: [");
        for (Double t : times) {
            System.out.print(t + ", ");
        }
        System.out.print("]\nResults: [");
        for (Integer r : results) {
            System.out.print(r + ", ");
        }
        System.out.println("]\nMinimum: " + times.stream().min(Double::compare).get() + " s.");
    }
}
