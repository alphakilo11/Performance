program nth_prime_timer
    implicit none
    integer :: i
    double precision :: start_time, end_time, elapsed_time
    integer, parameter :: n = 50000
    integer :: nth_prime

    call cpu_time(start_time)
    do i = 1, 10
        print*, nth_prime(n)
    end do
    call cpu_time(end_time)

    elapsed_time = end_time - start_time
    print*, 'Duration: ', elapsed_time
end program nth_prime_timer

integer function nth_prime(n)
    implicit none
    integer, intent(in) :: n
    integer :: num, p, sqrt_num
    logical :: is_prime
    integer, dimension(:), allocatable :: primes

    if (n <= 0) then
        nth_prime = -1
        return
    end if

    allocate(primes(1))
    primes(1) = 2
    num = 3

    do while (size(primes) < n)
        is_prime = .true.
        sqrt_num = nint(sqrt(real(num))) + 1
        do p = 1, size(primes)
            if (primes(p) > sqrt_num) exit
            if (mod(num, primes(p)) == 0) then
                is_prime = .false.
                exit
            end if
        end do
        if (is_prime) then
            primes = [primes, num]
        end if
        num = num + 2
    end do

    nth_prime = primes(n)
end function nth_prime
