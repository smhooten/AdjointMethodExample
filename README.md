# AdjointMethodExample
A simple demonstration of the adjoint method.

We are interested in solving the following optimization problem:

ps = argmin\_p f(x): s.t. Ax=b

where f is a real-valued scalar function of complex-valued vector x; x must satisfy some linear equation Ax=b; A is a complex-valued matrix with some dependence on a design element p; and b is some known input vector. We would like to find the best value of p to minimize f. Using the adjoint method, we may obtain the derivative of f with respect to p, which can then be fed into a gradient-based algorithm.

Here we compute the df/dp using the adjoint method, compared to finite-difference, for a simplified example where A is a 3x3 matrix with known dependence on p.
