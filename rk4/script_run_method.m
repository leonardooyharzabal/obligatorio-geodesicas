



## Octave script for solving system:
##du/dt = p
##dv/dt = q
##dp/dt = pq (-2v/1+v^2+u^2)
##dq/dt = pq (-2u/1+v^2+u^2)

## with the Runge-Kutta method (implemented in rk4.m).
[T,X]=rk4('g',[0,10],[1;0.5;0.5;0.5],0.01); # added timestep parameter, dt=0.01
plot(T,X);
pause(60);


