In terms of expected convergence rate, the proximal-gradient method has a better performance on the dual problem(D). 

D is strongly convex so a linear convergence rate is expected.

P is non strongly convex so the sublinear convergence rate is expercted.


In terms of ease of implementation, the proximal-gradient method is easier to implement on the primal problem(P). 

For P, we need to deal with non-smooth component h(x), but it is still manageable with method metioned in _Inexact Proximal Gradient Methods for
Non-Convex and Non-Smooth Optimization
_.

For D, we need to work with the dual variables, compute the dual objective function, and find the proximal operator of the conjugate of the dual problem's objective. 

Gu, B., Wang, D., Huo, Z., &amp; Huang, H. (2018). Inexact proximal gradient methods for non-convex and non-smooth optimization. Proceedings of the AAAI Conference on Artificial Intelligence, 32(1). https://doi.org/10.1609/aaai.v32i1.11802 