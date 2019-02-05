function [x, y] = Runge_Kutta(rhs, x0, xEnd, numberOfNodes, u0, p, alpha, beta) 

order           = length(p);

h               = (xEnd-x0) / numberOfNodes;

x               = x0 : h : xEnd;
y               = zeros(1, length(x));
y(1)            = u0;
    
k               = zeros(1, order);

for i = 1 : length(x)-1

	for s = 1 : length(k)
		sum = 0;
		if( s ~= 1)
			for n   = 2 : s
				sum = sum + k(n-1) * beta(s, n-1);
			end
		end

		k(s) = h * rhs( x(i) + alpha(s) * h, y(i) + sum);
	end

	y(i + 1) = y(i);

	for m = 1 : order
		y(i+1) = y(i + 1) + p(m) * k(m); 
	end
        
end


end

