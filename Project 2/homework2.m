u0                  = 0.25;
x0           	    = 0;
xEnd                = 1;

t                   = linspace(x0, xEnd);
u                   = eval(dsolve('Du = t + 2*u','u(0) = u0','t')); % exact solution

step                = [ 1/5 , 1/10 , 1/100 ]; 
numberOfNodes       = (xEnd-x0) ./ step;

func                = @(x,y) x + 2 * y;

for i = 1 : length(step)

    [ximplicit, yimplicit]   = implicitEuler(func, x0, xEnd, numberOfNodes(i), u0);
    [ximproved, yimproved]   = improvedEuler(func, x0, xEnd, numberOfNodes(i), u0);

    subplot(ceil(length(step)/2), 2, i);
    plot(t, u, 'k', ximplicit, yimplicit, 'g', ximproved, yimproved, 'b');

    legend('Exact solution', 'Implicit Euler', 'Improved Euler(Heun)', 'Location', 'northwest');
    title(['step = ', num2str( step(i) )]);
end
