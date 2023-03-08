def np_zeros():
    import numpy as np
    from timeit import default_timer as timer
    size = int(1e13)
    start_time = timer()
    spam = np.zeros(size, dtype=np.int8)
    elapsed_time = timer() - start_time
    return size / elapsed_time
