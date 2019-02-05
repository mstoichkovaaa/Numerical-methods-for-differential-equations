function x = Thomas(lhs,rhs)

rowNumber = size(lhs,1);
A         = zeros(1,rowNumber);
B         = zeros(1,rowNumber);
C         = zeros(1,rowNumber);

alpha     = zeros(1,rowNumber);
beta      = zeros(1,rowNumber);

for i = 1 : rowNumber
    if(i ~= 1) 
        A(i) = lhs(i, i-1); % A starts from 2
    end
    
    B(i) = lhs(i, i);
   
   if(i ~= rowNumber)
        C(i) = lhs(i,i+1); % C doesn't have nth element
   end
end

alpha(1) = ( - C(1) ) / B(1);
beta(1) = rhs(1) / B(1);

for i = 2 : rowNumber
    denominator = (A(i) * alpha(i-1) + B(i));
    
    if(i ~= rowNumber) % alpha doesn't have nth element
        alpha(i) = (-C(i)) / denominator;
    end
    
    beta(i) = (rhs(i) - A(i) * beta(i-1)) / denominator;
end

x            = zeros(1, rowNumber);
x(rowNumber) = beta(rowNumber);

for i   = (rowNumber-1) : -1 : 1 % evaluate backwards
   x(i) = alpha(i) * x(i+1) + beta(i);
end


end