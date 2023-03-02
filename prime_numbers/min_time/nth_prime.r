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

times <- numeric(20)
results <- integer(20)
for (i in 1:20) {
  start_time <- Sys.time()
  results[i] <- nth_prime(50000)
  times[i] <- difftime(Sys.time(), start_time, units = "secs")
}

cat(paste(times, collapse = ", "), "\n")
cat(paste(results, collapse = ", "), "\n")
cat("Minimum: ", min(times), "s.", "\n")
