def iteration_timer():
    from timeit import default_timer as timer
    size = int(1e6)
    start_time = timer()
    for i in range(size):
        timer()
    elapsed_time = timer() - start_time
    return size / elapsed_time
