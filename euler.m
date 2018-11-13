#!/usr/bin/octave -q

time=cputime;

a = 0;
b = 10;

x0 = [1;0.5;0.5;0.5];
n = 100000;
h = ( b - a ) / n;
t = a;
x = x0;
T = t;
X = x;
U = x(1);
V = x(2);
P = x(3);
Q = x(4);
for i = 1 : n

  u = x(1);
  v = x(2);
  p = x(3);
  q = x(4);


  x(1) = u + h * p;
  x(2) = v + h * q;
  x(3) = p + h * ((-2*v*p*q)/(1+v^2+u^2));
  x(4) = q + h * ((-2*u*p*q)/(1+v^2+u^2));
  t = a + i * h;

  T = [ T, t ];
  X = [ X, x ];
  U = [ U, x(1) ];
  V = [ V, x(2) ];
  P = [ P, x(3) ];
  Q = [ Q, x(4) ];
    
end;

printf('Tiempo de cálculo: %f segundos\n', cputime-time);

plot(T,X);
axis([0 10 0 10]);
title("Solución según Euler hacia adelante 100000 iteraciones");
text(9,4.5,'u','Color','blue','FontSize',14);
text(9,3,'v','Color','red','FontSize',14);
text(8.7,0.7,'p','Color',[1 0.9 0],'FontSize',14);
text(9.1,0.7,'q','Color','magenta','FontSize',14);



