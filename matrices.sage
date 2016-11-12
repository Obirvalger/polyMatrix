#! /usr/bin/env sage

ms5 =  [
  [
    [0,4,2,3,1,0,0],
    [0,0,4,2,3,1,0],
    [0,0,0,4,2,3,1],
    [1,0,0,0,4,2,3],
    [3,1,0,0,0,4,2],
    [2,3,1,0,0,0,4],
    [4,2,3,1,0,0,0],
  ],
  [
    [0,4,1,1,4,0,0],
    [0,0,4,1,1,4,0],
    [0,0,0,4,1,1,4],
    [4,0,0,0,4,1,1],
    [1,4,0,0,0,4,1],
    [1,1,4,0,0,0,4],
    [4,1,1,4,0,0,0],
  ],
  [
    [0,4,3,2,1,0,0],
    [0,0,4,3,2,1,0],
    [0,0,0,4,3,2,1],
    [1,0,0,0,4,3,2],
    [2,1,0,0,0,4,3],
    [3,2,1,0,0,0,4],
    [4,3,2,1,0,0,0],
  ],
  [
    [4,4,4,4,4,0,0],
    [0,4,4,4,4,4,0],
    [0,0,4,4,4,4,4],
    [4,0,0,4,4,4,4],
    [4,4,0,0,4,4,4],
    [4,4,4,0,0,4,4],
    [4,4,4,4,0,0,4],
  ],
  [
    [4,2,3,1,0,0,0],
    [0,4,2,3,1,0,0],
    [0,0,4,2,3,1,0],
    [0,0,0,4,2,3,1],
    [1,0,0,0,4,2,3],
    [3,1,0,0,0,4,2],
    [2,3,1,0,0,0,4],
  ],
  [
    [4,1,1,4,0,0,0],
    [0,4,1,1,4,0,0],
    [0,0,4,1,1,4,0],
    [0,0,0,4,1,1,4],
    [4,0,0,0,4,1,1],
    [1,4,0,0,0,4,1],
    [1,1,4,0,0,0,4],
  ],
  [
    [4,3,2,1,0,0,0],
    [0,4,3,2,1,0,0],
    [0,0,4,3,2,1,0],
    [0,0,0,4,3,2,1],
    [1,0,0,0,4,3,2],
    [2,1,0,0,0,4,3],
    [3,2,1,0,0,0,4],
  ],
  [
    [4,4,4,4,4,0,0],
    [0,4,4,4,4,4,0],
    [0,0,4,4,4,4,4],
    [4,0,0,4,4,4,4],
    [4,4,0,0,4,4,4],
    [4,4,4,0,0,4,4],
    [4,4,4,4,0,0,4],
  ],
  [
    [2,3,1,0,4,0,0],
    [0,2,3,1,0,4,0],
    [0,0,2,3,1,0,4],
    [4,0,0,2,3,1,0],
    [0,4,0,0,2,3,1],
    [1,0,4,0,0,2,3],
    [3,1,0,4,0,0,2],
  ],
  [
    [1,1,4,0,4,0,0],
    [0,1,1,4,0,4,0],
    [0,0,1,1,4,0,4],
    [4,0,0,1,1,4,0],
    [0,4,0,0,1,1,4],
    [4,0,4,0,0,1,1],
    [1,4,0,4,0,0,1],
  ],
  [
    [3,2,1,0,4,0,0],
    [0,3,2,1,0,4,0],
    [0,0,3,2,1,0,4],
    [4,0,0,3,2,1,0],
    [0,4,0,0,3,2,1],
    [1,0,4,0,0,3,2],
    [2,1,0,4,0,0,3],
  ],
  [
    [4,4,4,4,4,0,0],
    [0,4,4,4,4,4,0],
    [0,0,4,4,4,4,4],
    [4,0,0,4,4,4,4],
    [4,4,0,0,4,4,4],
    [4,4,4,0,0,4,4],
    [4,4,4,4,0,0,4],
  ],
  [
    [3,1,0,4,2,0,0],
    [0,3,1,0,4,2,0],
    [0,0,3,1,0,4,2],
    [2,0,0,3,1,0,4],
    [4,2,0,0,3,1,0],
    [0,4,2,0,0,3,1],
    [1,0,4,2,0,0,3],
  ],
  [
    [1,4,0,4,1,0,0],
    [0,1,4,0,4,1,0],
    [0,0,1,4,0,4,1],
    [1,0,0,1,4,0,4],
    [4,1,0,0,1,4,0],
    [0,4,1,0,0,1,4],
    [4,0,4,1,0,0,1],
  ],
  [
    [2,1,0,4,3,0,0],
    [0,2,1,0,4,3,0],
    [0,0,2,1,0,4,3],
    [3,0,0,2,1,0,4],
    [4,3,0,0,2,1,0],
    [0,4,3,0,0,2,1],
    [1,0,4,3,0,0,2],
  ],
  [
    [4,4,4,4,4,0,0],
    [0,4,4,4,4,4,0],
    [0,0,4,4,4,4,4],
    [4,0,0,4,4,4,4],
    [4,4,0,0,4,4,4],
    [4,4,4,0,0,4,4],
    [4,4,4,4,0,0,4],
  ],
  [
    [1,0,4,2,3,0,0],
    [0,1,0,4,2,3,0],
    [0,0,1,0,4,2,3],
    [3,0,0,1,0,4,2],
    [2,3,0,0,1,0,4],
    [4,2,3,0,0,1,0],
    [0,4,2,3,0,0,1],
  ],
  [
    [4,0,4,1,1,0,0],
    [0,4,0,4,1,1,0],
    [0,0,4,0,4,1,1],
    [1,0,0,4,0,4,1],
    [1,1,0,0,4,0,4],
    [4,1,1,0,0,4,0],
    [0,4,1,1,0,0,4],
  ],
  [
    [1,0,4,3,2,0,0],
    [0,1,0,4,3,2,0],
    [0,0,1,0,4,3,2],
    [2,0,0,1,0,4,3],
    [3,2,0,0,1,0,4],
    [4,3,2,0,0,1,0],
    [0,4,3,2,0,0,1],
  ],
  [
    [4,4,4,4,4,0,0],
    [0,4,4,4,4,4,0],
    [0,0,4,4,4,4,4],
    [4,0,0,4,4,4,4],
    [4,4,0,0,4,4,4],
    [4,4,4,0,0,4,4],
    [4,4,4,4,0,0,4],
  ]
]

ms5 = map(lambda m: matrix(GF(5), m), ms5)

ms3 = [
  [
    [0,2,1,0],
    [0,0,2,1],
    [1,0,0,2],
    [2,1,0,0],
  ],
  [
    [2,2,2,0],
    [0,2,2,2],
    [2,0,2,2],
    [2,2,0,2],
  ],
  [
    [2,1,0,0],
    [0,2,1,0],
    [0,0,2,1],
    [1,0,0,2],
  ],
  [
    [2,2,2,0],
    [0,2,2,2],
    [2,0,2,2],
    [2,2,0,2],
  ],
  [
    [1,0,2,0],
    [0,1,0,2],
    [2,0,1,0],
    [0,2,0,1],
  ],
  [
    [2,2,2,0],
    [0,2,2,2],
    [2,0,2,2],
    [2,2,0,2],
  ]
]

ms3 = map(lambda m: matrix(GF(3), m), ms3)

def list_transpose(l):
        return [list(i) for i in zip(*l)]

def rol(l,n):
    n = n % len(l)
    return l[n:] + l[:n]

def ror(l,n):
    n = n % len(l)
    return l[-n:] + l[:-n]

def a(k, d = 0):
    def a(i,j):
        if (i == 0 and j == 0):
            return 1
        elif(i == k-1):
            return (-1) % k
        elif(i == 0 or j == 0):
            return 0
        else:
            return (-(j)^((k-1-i) % k)) % k
    
    m = [[0 for i in range(k)] for j in range(k)]
    
    for i in range(k):
        for j in range(k):
            m[i][j] = a(i,j)
    
    m = list_transpose(rol(list_transpose(m), d))
    
    return matrix(GF(k), m)
    #return m

def a_i(k, i, l, d = 0):
    v = list(a(k,d)[i])
    v += [0] * (l - len(v))
    
    m = []
    for n in range(l):
        m.append(ror(v,n))
    
    return matrix(GF(k), m)
    #return m

def to_matrix(k, l):
    return map(lambda m: matrix(GF(k), m), l)

def matrices(k, t):
    return to_matrix(k, [a_i(k,i,t,d) for d in range(k) for i in range(1,k)])

def all_matrices(k, t):
    return to_matrix(k, [a_i(k,i,t,d) for d in range(k) for i in range(0,k)])

def kers(l, k = 0):
    if (type(l[0]) == sage.matrix.matrix_modn_dense_float.Matrix_modn_dense_float):
        k  = l[0].base_ring().cardinality()
        ks = map(lambda x: x.right_kernel(), l)
    else:
        if (k < 2):
            raise(ValueError("k is not get or has value < 2"))
        n  = len(l[0])
        ks = map(lambda m: matrix(GF(k), m).right_kernel(), l)
    return ks

def hypotes(k, start, stop = None):
    if stop is None:
        stop = start
        start = k+1
    
    return ["Error {}".format(p) for p in range(start, stop) if unit_kers(matrices(k,p)) != is_prime(p)]

def test_hypot(k, n):
    return unit_kers(matrices(k,n)) != is_prime(n)

def unit_kers(l, k = 0):
    if (type(l[0]) == sage.matrix.matrix_modn_dense_float.Matrix_modn_dense_float):
        n  = l[0].nrows()
        k  = l[0].base_ring().cardinality()
        ks = map(lambda x: x.right_kernel(), l)
    else:
        if (k < 2):
            raise(ValueError("k is not get or has value < 2"))
        n  = len(l[0])
        ks = kers(l, k)
    m  = []
    for i in range(k):
        m.append([i] * n)
    return len(filter(lambda y: m == y, map(lambda x: map(list, list(x)), ks))) == len(l)

def my(d,k = 5):
        m = [[0] * k for j in range(k)]
        for i in range(k):
            for j in range (k):
                if j >= i:
                    m[i][j] = binomial(j,i) * d^(j-i)
                    #m[i][j] = d^(j-i)
        print("d = {}".format(d))
        #print(matrix(GF(k), m))
        return matrix(GF(k), m)

def fg_mul_a(k = 5):
    def a_d(d):
        m = [[0] * k for j in range(k)]
        for i in range(k):
            for j in range (k):
                if j >= i:
                    m[i][j] = binomial(j,i) * d^(j-i)
        return matrix(GF(k), m)
    
    F.<f,g,d> = GF(k)[]
    result = [[],[]]
    l = '''\documentclass[a4paper, 14pt]{extarticle}

\usepackage[utf8]{inputenc}
\usepackage[russian]{babel}

\\begin{document}\n'''
    v1, v2, v3 = [], [], []
    
    for i in range(k):
        if (i % 2 == 0):
            v1.append([f])
            v2.append([g])
            v3.append([d^i * f])
        else:
            v1.append([g])
            v2.append([2*f])
            v3.append([d^i * g])
    
    v1 = matrix(v1)
    v2 = matrix(v2)
    v3 = matrix(v3)
    
    #l += latex(v1) + "\n" + latex(v2) + "\n" + latex(v3) + "\n\n"
    
    for i in range(k):
        l += latex(a_d(i)) + "\n"
        result[0].append(a_d(i) * v1)
        l += latex(result[0][-1]) + "\n"
        result[1].append(a_d(i) * v2)
        l += latex(result[1][-1]) + "\n\n"
    
    l += latex(a_d(1) * v3) + "\n\end{document}"
    result += [a_d(1) * v3, l]
    return result
