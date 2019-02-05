u0 = @(x) sin(x) + 0.125 * cos( 50*x );

% heatEquation(Limit for X, limir for T, step, initial condition)
[x, t, Y] = heatEquation( 2*pi , 0.03 , 0.01, u0);

for i = 1 : length( t )
 plot(x, Y( i, : ));
 
 axis([0 2*pi -1.5 1.5]);
 getframe;
 pause(0.2)
end

