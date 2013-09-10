def isPrime(n):
    try:
        n / 2
        if n <= 0: raise ValueError
    except TypeError:
        raise TypeError

    for i in range(2, n / 2 + 1):
        print n, i
        print n % i
        if n % i == 0: return False
    return True


class Queue:
    def __init__(self):
        self.vals = []

    def insert(self, n):
        self.vals.append(n)

    def remove(self):
        try:
            result = self.vals.pop(0)
            print result
        except IndexError:
            raise ValueError


q = Queue()
q.insert(1)
q.remove()
q.remove()
