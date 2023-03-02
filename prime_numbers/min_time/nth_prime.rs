use std::time::{Duration, Instant};

fn nth_prime(n: i32) -> i32 {
    if n <= 0 {
        return -1;
    }
    let mut primes = vec![2];
    let mut num = 3;
    while primes.len() < n as usize {
        let sqrt_num = (num as f64).sqrt().ceil() as i32 + 1;
        let mut is_prime = true;
        for &p in primes.iter() {
            if p > sqrt_num {
                break;
            }
            if num % p == 0 {
                is_prime = false;
                break;
            }
        }
        if is_prime {
            primes.push(num);
        }
        num += 2;
    }
    primes[n as usize - 1]
}

fn main() {
    let mut times = Vec::new();
    let mut results = Vec::new();
    for _ in 0..20 {
        let start_time = Instant::now();
        results.push(nth_prime(50000));
        times.push(start_time.elapsed());
    }
    println!("{:?}\n{:?}\nMinimum: {} s.", times, results, times.iter().min().unwrap().as_secs_f64());
}
