/******************************************************************************

(194, 196, 195) ms on GDB Online.

*******************************************************************************/
public class Main
{

    public static void main(String[] args) {
        int n = 50000;
        long startTime = System.currentTimeMillis();
        int count = 0;
        for (int i = 2; count < n; i++) {
            if (isPrime(i)) {
                count++;
            }
        }
        long endTime = System.currentTimeMillis();
        long duration = endTime - startTime;
        System.out.println("Time taken to calculate first " + n + " prime numbers: " + duration + " milliseconds");
    }

    private static boolean isPrime(int num) {
        if (num <= 1) {
            return false;
        }
        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) {
                return false;
            }
        }
        return true;
    }

}
