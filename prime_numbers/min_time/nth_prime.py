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
