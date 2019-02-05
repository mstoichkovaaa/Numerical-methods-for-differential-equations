u0                     = 0.25;
x0                     = 0;
xEnd                   = 1;

u                      = dsolve('Du = t + 2*u','u(0) = u0','t');

step                   = [ 1/5 , 1/10 , 1/100 ];
numberOfNodes          = (xEnd-x0) ./ step;

func                    = @(x,y) x+2*y;
subplotNumber           = 1;

for i = 1 : length(step)

    [ximplicit, yimplicit]     = implicitEuler(func, x0, xEnd, numberOfNodes(i), u0);
    [ximproved, yimproved]     = improvedEuler(func, x0, xEnd, numberOfNodes(i), u0);
    
    uimplicit              = eval(subs(u, 't', 'ximplicit'));
    errorImplicit          = uimplicit - yimplicit;
    
    uimproved              = eval(subs(u, 't', 'ximproved'));
    errorImproved          = uimproved - yimproved;
    
    
    subplot(length(step), 2, subplotNumber);
    plot(ximplicit, errorImplicit, 'g');
    legend('Implicit Euler');
    title(['step = ',num2str( step(i) )]);
    
    subplot(length(step), 2, subplotNumber + 1);
    plot(ximproved, errorImproved, 'b');
    legend('Improved Euler');
    title(['step = ', num2str( step(i) )]);
    
    subplotNumber = subplotNumber + 2;
end

