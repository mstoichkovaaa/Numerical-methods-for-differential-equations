function homework1

initialValues     = [0 , 3 , 4.9 , 6 , 10];
earthGravity      = 9.8;
KoverM            = 2;   % m/k = 0.5
numberOfNodes     = 100; 

intervalBeginning = 0;
intervalEnd       = 5;

t = linspace( intervalBeginning , intervalEnd ); 

func = @(~,y) earthGravity - KoverM * y;

for i = 1 : length( initialValues )
    
    % we use Euler's method to find approximation
    % the bigger the number of nodes, the better the approximation
   [net, approximation] = ForwardEuler(func, intervalBeginning, intervalEnd, numberOfNodes, initialValues(i));
   
   exactSolution = eval(dsolve('Dv = earthGravity - KoverM*v','v(0) = initialValues(i)','t'));
   
   subplot(ceil ( length ( initialValues ) / 2), 2 , i);
   
   plot(intervalBeginning, initialValues(i), '*');
   hold on
   plot(t, exactSolution,'k', net, approximation, 'b');
   
   title(['Initial value = ', num2str( initialValues( i ) )]);
   axis([intervalBeginning-0.2, intervalEnd, min(exactSolution)-0.2, max(exactSolution)+0.2]);
   
end

end

% after enough period of time, the speed will become and remain constant at 4.9