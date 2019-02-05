% local truncation error

step        = [1/5 1/10 1/100 1/1000];
t0          = 0;
tEnd        = 3;
plotNumber  = 1;

for i = 1 : length( step )

    t                          = t0 : step(i) : tEnd;

    nodesCount                 = length( t );
    A                          = zeros(nodesCount);
    rhs                        = zeros(nodesCount, 1);

    A(1, 1)                    = ( (9.8 * step(i) * step(i)) / 2)-1;
    A(1, 2)                    = 1;
    A(nodesCount, nodesCount)  = 1;
    rhs(1, 1)                  = 5 * step(i);

    for j = 2 : nodesCount-1
        A(j, j - 1)            = 1;
        A(j, j)                = ( 9.8 * step(i) * step(i) - 2 );
        A(j, j + 1)            = 1;
    end

    aproximation   = Thomas(A,rhs);
	exact          = eval( dsolve( 'D2u + 9.8*u=0', 'Du(0)=5', 'u(3)=0', 't' ) );
    error          = exact - aproximation;

    subplot(length(step), 1, plotNumber);
    plot(t, error);
    title(['step = ', num2str(step(i))]);
    plotNumber = plotNumber + 1;

end

