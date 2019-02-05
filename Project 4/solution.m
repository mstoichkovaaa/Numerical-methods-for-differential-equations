u0            = 0.25;
x0            = 0;
xEnd          = 1;
numberOfNodes = [5, 10, 100];
step          = (xEnd - x0) ./ numberOfNodes;

t             = linspace(x0, xEnd);
u             = dsolve('Du = t + 2*u','u(0) = u0','t');
evalExact     = eval(u);
u             = subs(u,'t', 'x');

func          = @(x, y) (x + 2 * y);
plotNumber    = 1;


for i=1:length(step)
    
    [x, yBashforth]    = Adams_Bashforth_4(func, x0, xEnd, numberOfNodes(i), u0); % predictor formula
    [~, yMoulton]      = Adams_Moulton_4(func, x0, xEnd, numberOfNodes(i), u0); 
   
    yCorrected         = corrector(x, yBashforth, func, step(i)); % correct the prediction
    exact              = eval(u);
    
    subplot(length(step), 4, plotNumber);
    plot(t, evalExact, 'k', x, yCorrected, 'b');
    
    title(['step = ', num2str( step(i) )]);
    legend('Exact solution', 'Approximation');
  
    errorBashforth = exact - yBashforth; 
    subplot(length(step), 4, plotNumber + 1);
    plot(x, errorBashforth);
    title([ 'Adams-Bashforth method error' newline 'step = ', num2str( step(i) ) ]);
  
    errorMoulton = exact - yMoulton;
    subplot(length(step), 4, plotNumber + 2);
    plot(x, errorMoulton);
    title([ 'Adams-Moulton method error' newline 'step = ', num2str( step(i) ) ]);
    
    methodError = exact-yCorrected;
    subplot(length(step), 4, plotNumber + 3);
    plot(x, methodError);
    title([ 'Predictor - Corrector method error' newline 'step = ', num2str( step(i) ) ]);
       
    plotNumber = plotNumber + 4;    
end
