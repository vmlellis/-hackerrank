from bisect import bisect

n = int(input().strip())
a = []
for a_i in range(n):
    a_t = int(input().strip())
    a.insert(bisect(a, a_t), a_t)

    if a_i % 2:
        start = len(a) // 2
        slice_ = slice(start-1, start+1)
        print(sum(a[slice_]) / 2)
    else:
        print(float(a[len(a) // 2]))
