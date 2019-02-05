function [x, y]  = Adams_Bashforth_4(func, x0, xEnd, numberOfNodes, u0)

step             = (xEnd - x0) / numberOfNodes;

[~, yStart]      = ForthOrderRK(func, x0, x0 + 3*step, 3, u0);
x                = x0 : step : xEnd;
y                = zeros(1, numberOfNodes);
rhsValues        = zeros(1, numberOfNodes);

for i = 1 : 4
    y(i)         = yStart(i);
    rhsValues(i) = func(x(i), y(i));
end

for i = 4 : length(x)-1
    
    y( i+1 ) = y(i) + (step/24) * (55 * rhsValues(i) - 59 * rhsValues(i-1) + 37 * rhsValues(i-2) - 9 * rhsValues(i-3)) ;
    rhsValues( i+1 ) = func(x(i+1), y(i+1));
    
end

end