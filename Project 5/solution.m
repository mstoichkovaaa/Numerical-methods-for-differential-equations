
step                      = 1/100;
t0                        = 0;
tEnd                      = 3;
t                         = t0 : step : tEnd;

numberOfNodes             = length(t);
A                         = zeros(numberOfNodes);
rhs                       = zeros(numberOfNodes,1);

A(1,1)                    = ( (9.8 * step * step) / 2) - 1;
A(1,2)                    = 1;
A(numberOfNodes, numberOfNodes) = 1;
rhs(1,1)                  = 5 * step;

for j = 2 : numberOfNodes-1
    A(j, j - 1) = 1;
    A(j, j)     = ( 9.8 * step * step - 2);
    A(j, j + 1) = 1;
end

approximation = Thomas(A,rhs);

x     = sin( approximation );
y     = -cos( approximation );
L     = 1;

for k = 1 : length(t)
    
  plot(0,0,'ko','LineWidth',2); % draw the circle in the center
  rectangle('Position',[-0.10 -0.10 0.2 0.2],'Curvature',1,'FaceColor','k')
  
  hold on
  axis([-L-0.5 L+0.5  -L-0.5 0.5]);
  daspect([1,1,1])
  
  line([0,x(k)],[0,y(k)],'Color','k','LineWidth',2);
             
  rectangle('Position',[x(k)-0.15 y(k)-0.15 0.3 0.3],'Curvature',1,'FaceColor','r') 
       
  hold off
  getframe;
  
end

