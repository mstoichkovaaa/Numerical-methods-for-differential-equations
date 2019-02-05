function [x, t, Y] = waveEquation(endX, endT, step, u0)

tal = step / 2;
x   = 0 : step : endX;
t   = 0 : tal  : endT;

Y = zeros( length(t), length(x) );

const = ( tal*tal ) / ( step*step );

for i = 1 : length(x)
    
   Y(1,i) = u0(x(i));
   
   if i > 1 && i < length(x)
     Y(2, i) = u0( x(i) ) + ( const/2 ) * ( u0 ( x(i+1) ) - 2 * u0( x(i) ) + u0( x(i-1) ));
   end
   
end


for j = 2 : length(t)-1 % for each time layer
    
   for i = 2 : length(x)-1
      Y(j+1, i) =  const * ( Y(j, i-1) + Y(j, i+1) ) - Y(j-1, i) + 2 * Y(j, i) * ( 1-const );
   end
   
end

end