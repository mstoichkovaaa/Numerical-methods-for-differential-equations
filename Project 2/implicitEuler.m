function [x,y] = implicitEuler(func, intervalStart, intervalEnd, numberOfNodes, initialValue)

step           = (intervalEnd - intervalStart) / numberOfNodes;
 
x              = intervalStart : step : intervalEnd;
y              = zeros(1,length(x));
y(1)           = initialValue;

options        = optimset('Display','off');

function F     = iteration(currentY, prevX, prevY, step)
         F     = currentY - prevY - step * func(prevX, prevY);
end

for i = 1 : length(x)-1
  
    yEstimate  = y(i) + step * func(x(i), y(i));
    y(i+1)     = fsolve(@iteration, yEstimate, options, x(i),y(i), step);

end

end