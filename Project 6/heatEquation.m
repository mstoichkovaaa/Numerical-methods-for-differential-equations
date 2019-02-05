function [x, t, Y] = heatEquation(endX, endT, step, u0)

tal = ( step * step ) / 3;
x   = 0 :  step  : endX;
t   = 0 : tal : endT;

Y = zeros( length(t), length(x) );

for i = 1 : length(x)
   Y(1, i) = u0( x(i) ); % first time layer is given by u0
end

stepsq = step * step; % step squared
for j = 1 : length(t) - 1 % for each time layer
   
      Y(j+1 , 1) = ( -1 / stepsq ) * ( 4 * tal * step - ( step * 2 * tal + stepsq - 2*tal ) * Y(j,1) + 2 * tal * Y(j,1) );
  
  for i = 2 : length(x)-1
      Y(j+1, i)  = ( 1 - ( 2*tal ) / stepsq ) * Y(j, i) + ( tal / stepsq ) * ( Y(j, i-1) + Y(j, i+1) ); 
  end
  
     Y(j+1, length(x)) = ( 1 / stepsq ) * ( 2 * tal * Y(j, length(x)-1) - ( 2 * tal - stepsq ) * Y(j, length(x)));
end

end