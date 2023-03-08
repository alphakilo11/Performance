def iteration_addition():
    from timeit import default_timer as timer
    size = int(1e6)
    a = 8
    b = 11
    start_time = timer()
    for i in range(size):
        a + b
    elapsed_time = timer() - start_time
    return size / elapsed_time
