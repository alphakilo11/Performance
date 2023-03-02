require 'benchmark'

def nth_prime(n)
  return nil if n <= 0
  primes = [2]
  num = 3
  while primes.length < n
    is_prime = true
    sqrt_num = Integer(Math.sqrt(num)) + 1
    primes.each do |p|
      break if p > sqrt_num
      if num % p == 0
        is_prime = false
        break
      end
    end
    primes << num if is_prime
    num += 2
  end
  primes.last
end

time = Benchmark.measure do
  10.times do
    puts nth_prime(50000)
  end
end

puts "Dauer: #{time.real}"
