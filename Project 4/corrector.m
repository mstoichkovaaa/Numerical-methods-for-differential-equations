function ynew = corrector(x, ypredicted, func, step)

epsilon               = 10e-4;
breakCondition        = false;

iterations            = 1;
maxNumberOfIterations = 3;

yold                  = ypredicted;
ynew                  = zeros(1,length(x));

coeff                 = [3/8 19/24 -5/24 1/24];

rhsValues             = zeros(1, length(x));

while( iterations < maxNumberOfIterations || not(breakCondition))
    
    for i = 1 : 4
        ynew(i)      = yold(i);
        rhsValues(i) = func(x(i), ynew(i));
    end
    
    for i = 4 : length(x)-1

        ynew( i+1 ) = ynew( i ) + step * ( coeff(1) * func( x(i+1),yold(i+1) ) + coeff(2) * rhsValues(i) + coeff(3) * rhsValues(i-1) + coeff(4) * rhsValues(i-2));
        rhsValues(i+1) = func(x(i+1), ynew(i+1));
        
    end
    
    if( all( abs( yold - ynew ) < epsilon))
        breakCondition = true;
    end
    
    yold       = ynew;
    iterations = iterations + 1;
    
end


end