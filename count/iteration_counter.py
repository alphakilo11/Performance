def iteration_counter():
    from timeit import default_timer as timer
    size = int(1e6)
    start_time = timer()
    counter = 0
    for i in range(size):
        counter += 1
    elapsed_time = timer() - start_time
    return size / elapsed_time
