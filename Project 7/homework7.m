
u0 = @(x) x*(x-1);

% waveEquation (xEnd, tEnd, step by x, initial)
[x, t, Y] = waveEquation(1, 10, 0.01, u0);

for i = 1 : length(t)
    
  plot(x, Y(i, :));
  axis([0 1 -1 1]);
  getframe;
  
end


