from __future__ import division

def linspace(start, stop, n):
    if n == 1:
        yield stop
        return
    h = (stop - start) / (n - 1)
    for i in range(n):
        yield start + h * i

for mu in linspace (0,1,10):
    for lam in linspace (0,1,10):
        p = experiment(mu, lam)
        print ("%10.4f"*8 %
               (p,
                mu,
                lam,
                1-mu,
                (1-lam)*mu + lam * (1-mu),
                mu*(1 - 2*lam) + lam,
                (1-lam)*(1-mu) + lam*mu,
                mu*(-1 + 2*lam) - lam + 1))
