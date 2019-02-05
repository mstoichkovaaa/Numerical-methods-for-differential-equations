function [nodes, approximation] = ForwardEuler(func, intervalBeginning, intervalEnd, numberOfNodes, initialValue)


step             = (intervalEnd - intervalBeginning) / numberOfNodes ;
nodes            = linspace ( intervalBeginning , intervalEnd , numberOfNodes ) ;

approximation    = zeros( 1 , length(nodes) );
approximation(1) = initialValue;

for i = 2 : length(nodes)
    
   approximation(i) = approximation(i-1) + step * func( nodes(i-1) , approximation(i-1) ); 

end

end