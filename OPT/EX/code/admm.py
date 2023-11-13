from PIL import Image , ImageOps
import numpy as np
import scipy as sp
import scipy.sparse.linalg
from scipy . fftpack import dct , idct
import matplotlib . pyplot as plt
import matplotlib . cm as cm

# Load the image, Resize it, Grayscale it, and convert it to an array
img = Image.open("cat.jpg").resize((256, 256))
X_ref = np.asarray(ImageOps.grayscale(img)).astype('float32')

# Show image
plt.imshow(X_ref, cmap=cm.Greys_r, vmin=0, vmax=255)
plt.show()


# Black Box, Not Important how it works
def blackbox():
    s = 4
    size_filter = size = 9
    PSF = np.array([[np.exp(-0.5 * ((i - 4) / s)**2 - 0.5 * ((j - 4) / s)**2) 
                     for j in range(size)] for i in range(size)])
    PSF /= np.sum(PSF)

    def dctshift(PSF, center):
        m, n = PSF.shape
        i, j = center
        l = min(i, m - i - 1, j, n - j - 1)
        PP = PSF[i - l: i + l + 1, j - l: j + l + 1]
        Z1 = np.diag(np.ones(l + 1), k=l)
        Z2 = np.diag(np.ones(l), k=l + 1)
        PP = Z1 @ PP @ Z1.T + Z1 @ PP @ Z2.T + Z2 @ PP @ Z1.T + Z2 @ PP @ Z2.T
        Ps = np.zeros_like(PSF)
        Ps[0:2 * l + 1, 0:2 * l + 1] = PP
        return Ps

    dct2 = lambda a: dct(dct(a.T, norm='ortho').T, norm='ortho')
    idct2 = lambda a: idct(idct(a.T, norm='ortho').T, norm='ortho')
    Pbig = np.zeros_like(X_ref)
    Pbig[0:size_filter, 0:size_filter] = PSF
    e1 = np.zeros_like(X_ref)
    e1[0][0] = 1
    S = np.divide(dct2(dctshift(Pbig, (4, 4))), dct2(e1))
    R = lambda X, S_matrix=S: idct2(np.multiply(S_matrix, dct2(X)))
    return R

# Retrieve blurring and adjoint of blurring operators
R = blackbox()

# Blur Image and add noise
np.random.seed(10)
n = np.random.normal(0, 0.5, size=X_ref.shape)
X_blur = R(X_ref) + n

# Show blurry image
plt.imshow(X_blur, cmap=cm.Greys_r, vmin=0, vmax=255)
plt.show()

# The Discrete Gradient Linear Operator
# grad : R^{256 x 256} -> R^{2 x 256 x 256}
def grad(X):
    G = np.zeros_like([X, X])
    G[0, :, :-1] = X[:, 1:] - X[:, :-1]  # Horizontal Direction
    G[1, :-1, :] = X[1:, :] - X[:-1, :]  # Vertical Direction
    return G

# The Adjoint of the Discrete Gradient Linear Operator, the Discrete Divergence
# grad_T : R^{2 x 256 x 256} -> R^{256 x 256}
def grad_T(Y):
    G_T = np.zeros_like(Y[0])
    G_T[:, :-1] += Y[0, :, :-1]  # Corresponds to c[0]
    G_T[:-1, :] += Y[1, :-1, :]  # Corresponds to c[1]
    G_T[:, 1:] -= Y[0, :, :-1]   # Corresponds to c[0]
    G_T[1:, :] -= Y[1, :-1, :]   # Corresponds to c[1]
    return G_T


