function [x, y] = secondOrderRK(rhs, x0, xEnd, numberOfNodes, u0)

p			   = [1/2 1/2];
alpha          = [0 1];
beta           = [-1; 1];

[x, y]         = Runge_Kutta(rhs, x0, xEnd, numberOfNodes, u0, p, alpha, beta);

end
