a = 0;
b = 10;
x0 = [1;0.5;0.5;0.5];
n = 10000;
h = ( b - a ) / n;
t = a;
x = x0;
T = t;

function sis=ec_dif(Xs,l)
 us = Xs(1);
 vs = Xs(2);
 ps = Xs(3);
 qs = Xs(4);

 sis(1) = ps;
 sis(2) = qs;
 sis(3) = ((-2*vs*ps*qs)/(1+vs^2+us^2));
 sis(4) = ((-2*us*ps*qs)/(1+vs^2+us^2));

endfunction;

l = (0:h:10);

Xs = lsode("ec_dif",x0,l)

%

## with the Runge-Kutta method (implemented in rk4.m).
[T,X]=rk4('g',[0,10],[1;0.5;0.5;0.5],0.001); # added timestep parameter, dt=0.01
%

E=Xs-X
plot(T,E)
title('Error local de RK4 con 10000 iteraciones.')