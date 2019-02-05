function [x, y] = Adams_Moulton_4(func, x0, xEnd, numberOfNodes, u0)

step         = (xEnd - x0) / numberOfNodes;

[~, yStart]  = ForthOrderRK(func, x0, x0 + 3*step, 3, u0);
x            = x0 : step : xEnd;
y            = zeros(1, length(x));
funcValues   = zeros(1, length(x));
options      = optimset('Display','off');

for i = 1 : 4
    y(i)          = yStart(i);
    funcValues(i) = func(x(i), y(i));
end

for i = 4 : length(x)-1
    
    yEstimate = y(i) + ( step/24 ) * (55 * funcValues(i) - 59 * funcValues(i-1) + 37 * funcValues(i-2) - 9 * funcValues(i-3)) ;
    y(i+1)    = fsolve(@iteration, yEstimate, options, i);
    funcValues( i+1)  = func(x(i+1), y(i+1));
end

function F     = iteration(nextY, i)
         F     = nextY - y(i) - (step/24) * (9 * func(x(i+1),nextY) + 19 * funcValues(i) - 5 * funcValues(i-1) + funcValues(i-2));
end 

end