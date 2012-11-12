def isPrime(n):
    try:
        n / 2
        if n <= 0: raise ValueError
    except TypeError:
        raise TypeError

    for i in range(2, n / 2 + 1):
        if n % i == 0: return False
    return True

