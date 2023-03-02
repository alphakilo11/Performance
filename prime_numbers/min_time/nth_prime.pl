use Time::HiRes qw(gettimeofday tv_interval);

sub nth_prime {
    my ($n) = @_;
    return unless $n > 0;
    my @primes = (2);
    my $num = 3;
    while (@primes < $n) {
        my $is_prime = 1;
        my $sqrt_num = int(sqrt($num)) + 1;
        for my $p (@primes) {
            last if $p > $sqrt_num;
            if ($num % $p == 0) {
                $is_prime = 0;
                last;
            }
        }
        push @primes, $num if $is_prime;
        $num += 2;
    }
    return $primes[-1];
}

my @times;
my @results;
for (my $i = 0; $i < 20; $i++) {
    my $start_time = [gettimeofday];
    push @results, nth_prime(50000);
    push @times, tv_interval($start_time);
}

print join("\n", @times) . "\n";
print join("\n", @results) . "\n";
my $min_time = (sort {$a <=> $b} @times)[0];
print "Minimum: $min_time s.\n";
