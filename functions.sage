k = 5

# Use SR(), poly(x), polynomial(GF(k))
GF(k)['x']
g, h = GF(k)['g, h'].gens()
#var('x', domain='integer')
ga = x^4*g + x^3*h + x^2*g + x*h + g
ha = x^4*h + x^3*g + x^3*g + x^2*h + x*g + x*g + h
#ha = x^4*h + 2*x^3*g + x^2*h + 2*x*g + h
var('z')

'''
f0 = x^4*g + x^3*h + x^2*g + x*h + g
f1 = x^4*h + x^3*g + x^3*g + x^2*h + x*g + x*g + h
f2 = (g + h)*x^4 + (2*g + h)*x^3 + (g + h)*x^2 + (2*g + h)*x + g + h
f3 = (g + 2*h)*x^4 + (4*g + h)*x^3 + (g + 2*h)*x^2 + (4*g + h)*x + g + 2*h
f4 = (g + 3*h)*x^4 + (g + h)*x^3 + (g + 3*h)*x^2 + (g + h)*x + g + 3*h
f5 = (g + 4*h)*x^4 + (3*g + h)*x^3 + (g + 4*h)*x^2 + (3*g + h)*x + g + 4*h

#f2 = (g + h)*x^4 + (g + g + h)*x^3 + (g + h)*x^2 + (g + g + h)*x + g + h
#f3 = (g + h + h)*x^4 + (g + g + g + g + h)*x^3 + (g + h + h)*x^2 + (g + g + g + g + h)*x + g + h + h
#f4 = (g + h + h + h)*x^4 + (g + h)*x^3 + (g + h + h + h)*x^2 + (g + h)*x + g + h + h + h
#f5 = (g + h + h + h + h)*x^4 + (g + g + g + h)*x^3 + (g + h + h + h + h)*x^2 + (g + g + g + h)*x + g + h + h + h + h

def newF():
    #print("f0 = " + str(ga.expand().collect(x)))
    #print("f1 = " + str(ha.expand().collect(x)))
    for i in range(1,5):
        print("f{} = ".format(i+1) + str((ga + i*ha).expand().collect(x)))

def showPolynomials():
    for d in range(1):
        #var('y')
        #y = x + d
        print("d = {}".format(d))
        print("f0 = " + str(f0.expand().collect(x)))
        print("f1 = " + str(f1.expand().collect(x)))
        for i in range(1,k):
            print("f{} = ".format(i+1) + str((ga + i*ha).expand().collect(x)))
        print('')
'''
