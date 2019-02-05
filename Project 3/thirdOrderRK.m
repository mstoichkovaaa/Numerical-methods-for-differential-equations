function [x, y] = thirdOrderRK(rhs, x0, xEnd, numberOfNodes, u0)

p              = [1/6 1/6 2/3];
alpha          = [0 1  1/2];
beta           = [-1 -1; 1 -1; 1/4 1/4];

[x, y]         = Runge_Kutta(rhs, x0, xEnd, numberOfNodes, u0, p, alpha, beta);

end
