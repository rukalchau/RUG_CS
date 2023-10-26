import numpy as np

def conjugate_gradient(A, b, x0, tol=1e-6, max_iter=1000000):
    x = x0
    r = b - np.dot(A, x)
    p = r
    rsold = np.dot(r.T, r)

    for i in range(max_iter):
        Ap = np.dot(A, p)
        alpha = rsold / np.dot(p.T, Ap)
        x = x + alpha * p
        r = r - alpha * Ap

        # Check for convergence
        rsnew = np.dot(r.T, r)
        if np.sqrt(rsnew) < tol:
            break

        # Avoid division by zero and numerical instability
        beta = rsnew / rsold
        p = r + beta * p
        rsold = rsnew

    return x

# Example usage:
k = 2**2

A = np.random.random((k, k))
b = np.random.random((k, 1))
x0 = np.zeros((k, 1))
A = np.dot(A, A.T)  # Make it symmetric
A = A + 4 * np.eye(4)  # Make it positive definite

solution = conjugate_gradient(A, b, x0)
print("Solution:", solution)
print(A @ solution - b)
