u0            = 0.25;
x0            = 0;
xEnd          = 1;
numberOfNodes = [5, 10, 100, 1000];
step          = (xEnd - x0) ./ numberOfNodes;

t             = linspace(x0, xEnd);
u             = dsolve('Du = t + 2*u','u(0) = u0','t');
plotNumber    = 1;

func          = @(x, y) x + 2 * y;
urk2          = subs(u,'t','x2');
urk3          = subs(u,'t','x3');

for i = 1 : length(step)
    
   [x2, y2]    = secondOrderRK(func, x0, xEnd, numberOfNodes(i), u0);
   [x3, y3]    =  thirdOrderRK(func, x0, xEnd, numberOfNodes(i), u0);
   
   subplot(length(step), 3, plotNumber);
   plot(t, eval(u), 'k', x2, y2,'b', x3, y3,'g');
   legend('Exact solution', 'Second order Runge-Kutta', 'Third order Runge-Kutta', 'Location', 'northwest');
   title([ 'step = ', num2str( step(i) ) ]);
     
   subplot(length(step), 3, plotNumber + 1);
   plot(x2, ( eval(urk2) - y2 ));
   title([ 'Second order Runge-Kutta' newline 'error with step = ', num2str( step(i) ) ]);
   
   subplot(length(step), 3, plotNumber + 2);
   plot(x3, ( eval(urk3) - y3 ));
   title([ 'Third order Runge-Kutta' newline 'error with step = ', num2str( step(i) ) ]);
     
   plotNumber = plotNumber + 3;
      
end
[min2, max2, min3, max3] = convergence(func, x0, xEnd, step(4),u0)
