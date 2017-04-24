from math import sqrt

def isPrime(p):
    if p < 2:
        return False
    elif p <= 3:
        return True
    elif p % 2 == 0 or p % 3 == 0:
        return False
    else:
        for i in range(3, int(sqrt(p)+1), 2):
            if p % i == 0:
                return False
    return True

p = int(input().strip())
for a0 in range(p):
    n = int(input().strip())
    if isPrime(n):
        print('Prime')
    else:
        print('Not prime')
