nth_prime <- function(n) {
  if (n <= 0) {
    return(NULL)
  }
  primes <- c(2)
  num <- 3
  while (length(primes) < n) {
    is_prime <- TRUE
    sqrt_num <- ceiling(sqrt(num))
    for (p in primes) {
      if (p > sqrt_num) {
        break
      }
      if (num %% p == 0) {
        is_prime <- FALSE
        break
      }
    }
    if (is_prime) {
      primes <- c(primes, num)
    }
    num <- num + 2
  }
  return(primes[length(primes)])
}

start_time <- timer()
for (i in 1:10) {
  print(nth_prime(50000))
}
cat("Dauer: ", timer() - start_time)
