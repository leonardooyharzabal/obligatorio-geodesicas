a = 0;
b = 10;
x0 = [1;0.5;0.5;0.5];
n = 100;
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

%divisor

Xe = x;
Ue = x(1);
Ve = x(2);
Pe = x(3);
Qe = x(4);

for i = 1 : n

  u = x(1);
  v = x(2);
  p = x(3);
  q = x(4);

  x(1) = u + h  * p;
  x(2) = v + h  * q;
  x(3) = p + h  * ((-2*v*p*q)/(1+v^2+u^2));
  x(4) = q + h  * ((-2*u*p*q)/(1+v^2+u^2));
  
  t = a + i * h;

  T = [ T, t ];
  Xe = [ Xe, x ];
  Ue = [ Ue, x(1) ]; %azul
  Ve = [ Ve, x(2) ]; %verde
  Pe = [ Pe, x(3) ]; %celeste
  Qe = [ Qe, x(4) ]; %rojo
    
end;

E=Xs'-Xe
plot(T,E)
title('Error local del metodo de Euler hacia adelante con 100 iteraciones.')
text(2,-0.012,'Error de u en azul, v en verde, p en celeste y q en rojo.')