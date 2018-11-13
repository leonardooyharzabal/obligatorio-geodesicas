

## with the Runge-Kutta method (implemented in rk4.m).
[T,X]=rk4('g',[0,10],[1;0.5;0.5;0.5],0.00001); # added timestep parameter, dt=0.01
%

plot(T,X);
axis([0 10 0 10]);
title('Error local de RK4 con 1000000 iteraciones.');
text(9,4.5,'u','Color','blue','FontSize',14);
text(9,3,'v','Color','red','FontSize',14);
text(8.7,0.7,'p','Color',[1 0.9 0],'FontSize',14);
text(9.1,0.7,'q','Color','magenta','FontSize',14);