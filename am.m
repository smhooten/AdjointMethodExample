%% Test Adjoint Method

p = sym('p'); % designable parameter

A = [-5*(1i)*p^2, 20+(1i)*p^4, 4+(1i); 
     3+2*(1i), p+(1i)*p, 12; 
     13-15*(1i) -5+(1i), 1/p*(1i)-p*(1i)]; % Sample system matrix is a function of p
b = [10+(1i); 4-3*(1i); -12]; % sample input vector
tranA = transpose(A);

x = A\b; % Forward solution, solve Ax=b for x given A and b

f = transpose(conj(x))*x; % merit function is f(x) = |x|^2

dfdx = conj(x); % df/dx = x*

y = tranA\dfdx; % Adjoint solution, solve (A^T)y = df/dx for y given A^T and df/dx

dAdp = [-10*(1i)*p (1i)*4*p^3 0; 
        0 1+(1i) 0; 
        0 0 -(1i)/p^2-(1i)]; % derivative of A with respect to p

dfdp = -2*real(transpose(y)*dAdp*x); % adjoint method derivative of f

pnom = 1.5; % choose some nominal value of design parameter (this can be varied)

p=pnom;
adj = eval(subs(dfdp)); % adjoint method derivative evaluated at p=pnom

% Find finite-difference (taking central differences for accuracy)
dp = 1e-8;
p = pnom+dp/2;
fd1 = eval(subs(f));
p = pnom-dp/2;
fd2 = eval(subs(f));

fd = (fd1-fd2)/dp;

% Compare adjoint and finite-difference derivatives
disp(['Adjoint Method: ', num2str(adj)])
disp(['Finite Difference: ', num2str(fd)])
