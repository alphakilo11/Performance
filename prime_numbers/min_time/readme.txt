The timings vary greatly between runs (it seems that the virtual machines available as free online compilers are completely useless to benchmark anything)
(2.24, 2.03, 2.233262948997435) #s Python
(0.028105974197387695, 0.014826059341430664, 0.01475977897644043) #s Julia



Convert the following Python code to each of these languages: (C, C#, C++, Java, Perl, Ruby, Cobol, Kotlin, Ocaml, Pascal, PHP, R, VB, Fortran, Haskell, Assembly(GCC), Objective C, SQLite, Javascript(Rhino), Prolog, Swift, Rust, Go, Bash)

from timeit import default_timer as timer
def nth_prime(n):
    """
    This function takes an integer n and returns the nth prime number.
    Source: ChatGPT Feb 13 Version
    """
    if n <= 0:
        return None
    primes = [2]
    num = 3
    while len(primes) < n:
        is_prime = True
        sqrt_num = int(num ** 0.5) + 1
        for p in primes:
            if p > sqrt_num:
                break
            if num % p == 0:
                is_prime = False
                break
        if is_prime:
            primes.append(num)
        num += 2
    return primes[-1]
  
times = []
results = []
for i in range(20):
  start_time = timer()
  results.append(nth_prime(50000))
  times.append(timer() - start_time)
  
print(f'{times}\n{results}\nMinimum: {min(times)} s.')
