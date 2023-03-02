using System;
using System.Diagnostics;
using System.Linq;

namespace NthPrime
{
class Program
{
static int nth_prime(int n)
{
if (n <= 0)
return 0;
int[] primes = new int[1] {2};
int num = 3;
while (primes.Length < n)
{
bool is_prime = true;
int sqrt_num = (int)Math.Sqrt(num) + 1;
foreach (int p in primes)
{
if (p > sqrt_num)
break;
if (num % p == 0)
{
is_prime = false;
break;
}
}
if (is_prime)
{
Array.Resize(ref primes, primes.Length + 1);
primes[primes.Length - 1] = num;
}
num += 2;
}
return primes[primes.Length - 1];
}
    static void Main(string[] args)
    {
        double[] times = new double[20];
        int[] results = new int[20];
        for (int i = 0; i < 20; i++)
        {
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            results[i] = nth_prime(50000);
            stopwatch.Stop();
            times[i] = stopwatch.Elapsed.TotalSeconds;
        }
        Console.WriteLine(string.Join(", ", times));
        Console.WriteLine(string.Join(", ", results));
        Console.WriteLine($"Minimum: {times.Min()} s.");
    }
}
}
