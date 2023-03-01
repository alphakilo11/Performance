#(4876, 3489, 1563) on GDB online

import time

def is_prime(num):
    if num <= 1:
        return False
    for i in range(2, int(num**0.5)+1):
        if num % i == 0:
            return False
    return True

n = 50000
start_time = time.time()
count = 0
i = 2

while count < n:
    if is_prime(i):
        count += 1
    i += 1

end_time = time.time()
duration = (end_time - start_time) * 1000

print("Time taken to calculate first", n, "prime numbers: ", duration, "milliseconds")
