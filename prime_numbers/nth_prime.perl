use Time::HiRes qw/gettimeofday/;

sub nth_prime {
    my $n = shift;
    if ($n <= 0) {
        return undef;
    }
    my @primes = (2);
    my $num = 3;
    while (@primes < $n) {
        my $is_prime = 1;
        my $sqrt_num = int(sqrt($num)) + 1;
        foreach my $p (@primes) {
            if ($p > $sqrt_num) {
                last;
            }
            if ($num % $p == 0) {
                $is_prime = 0;
                last;
            }
        }
        if ($is_prime) {
            push @primes, $num;
        }
        $num += 2;
    }
    return $primes[-1];
}

my $start_time = gettimeofday();
for (my $i = 0; $i < 10; $i++) {
    print nth_prime(50000), "\n";
}
my $end_time = gettimeofday();
printf "Dauer: %f\n", $end_time - $start_time;
