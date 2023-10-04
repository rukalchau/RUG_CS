# We want to test and compare different methods discussed in class. Each method should be
# coded as a function that takes the following input:
# 1. the matrix A,
# 2. the vector b,
# 3. the initial guess x0,
# 4. a tolerance for convergence ϵ,
# 5. a maximal number of iterations m.


# Each function should return at least the following:
# 1. the last iterate, x
# 2. a flag confirming convergence, flag
# 3. the number of iterations, n
# 4. an array of past iterates. x_array

import numpy as np 

# 1. Gradient Descent with constant step size,
def GD_constant(A,b,x0,e,m):
  alpha=0.01  #learning rate
  x = x0
  x_array = [x]
  n = 0
  flag = False
  b=b.T

  while n < m:
      r = b - np.dot(A, x)
      if np.linalg.norm(r) < e:
          flag = True
          break
        
      x = x + alpha * np.dot(A.T, r)
      x_array.append(x)
      n += 1
    
  return x, flag, n, x_array


M=10
N=10
np.random.seed(42)
A=np.random.random((M,N))
b=np.random.random((1,M))
x0=np.zeros((N,1))
e=0.1
m=1000000
GD_constant(A,b,x0,e,m)




# 2. Gradient Descent with Armijo rule,
# 3. Gradient Descent with exact line search,
# 4. Conjugate Gradient Method,
# 5. Quasi-Newton Method (BFGS),
# 6. Polyak’s Heavy Ball accelerated Gradient Descent,
# 7. Nesterov’s momentum applied to Gradient Descent, and
# 8. Stochastic Gradient Descent.