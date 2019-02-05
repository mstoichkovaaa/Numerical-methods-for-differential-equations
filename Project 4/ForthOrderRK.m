function [x, y] = ForthOrderRK(rhs, x0, xEnd, numberOfNodes, u0)

p			    = [1/6 1/3 1/3 1/6];
alpha           = [0 1/2 1/2 1];
beta            = [0 0 0 ; 1/2 0 0; 0 1/2 0; 0 0 1];

[x, y] = Runge_Kutta(rhs, x0, xEnd, numberOfNodes, u0, p, alpha, beta);

end