require 'benchmark'

def nth_prime(n)
  return nil unless n > 0
  primes = [2]
  num = 3
  while primes.length < n
    is_prime = true
    sqrt_num = (num ** 0.5).to_i + 1
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

times = []
results = []
20.times do
  elapsed_time = Benchmark.realtime do
    results << nth_prime(50000)
  end
  times << elapsed_time
end

puts times
puts results
puts "Minimum: #{times.min} s."
