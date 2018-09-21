#!/usr/bin/octave -q



a = 0;
b = 10;

x0 = [1;0.5;0.52721;0.5];

% Numero de intervalos

n = 10000;

% Inicializamos con los datos anteriores

h = ( b - a ) / n;
t = a;
x = x0;

% T y X son arrays que contienen cada valor de t y x calculado.  
% No son necesarios para conseguir la solucion final, pero son usados
% para producir el plot de la curva.

T = t;
X = x;
U = x(1);
V = x(2);
P = x(3);
Q = x(4);

% Empezamos la iteracion.

for i = 1 : n

  u = x(1);
  v = x(2);
  p = x(3);
  q = x(4);


  x(1) = u + h * t * p;
  x(2) = v + h * t * q;
  x(3) = p + h * t * ((-2*v*p*q)/(1+v^2+u^2));
  x(4) = q + h * t * ((-2*u*p*q)/(1+v^2+u^2));

  % At this point x contains the value x(t+h) so we need to compute the
  % new t value.  This could be done with either t = t+h or the form below.
  % The from below is preferred to avoid accumulated roundoff error from
  % the repeated addition of h.

  t = a + i * h;

  % Guardamos los valores de. t y las funciones para el plotting.

  T = [ T, t ];
  X = [ X, x ];
  U = [ U, x(1) ];
  V = [ V, x(2) ];
  P = [ P, x(3) ];
  Q = [ Q, x(4) ];
    
end;

% Graficamos las funciones

plot(T,X);
axis([0 10 0 10]);
