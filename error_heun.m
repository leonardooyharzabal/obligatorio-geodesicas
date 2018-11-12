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

%divisor

Xh = x;
Uh = x(1);
Vh = x(2);
Ph = x(3);
Qh = x(4);
for i = 1 : n

  u = x(1);
  v = x(2);
  p = x(3);
  q = x(4);

  x(1) = u + (h/2)  * p + (h/2)  * (p+h*((-2*v*p*q)/(1+u^2+v^2)));
  x(2) = v + (h/2)  * q + (h/2)  * (q+h*((-2*u*p*q)/(1+u^2+v^2)));
  x(3) = p + (h/2)  * ((-2*v*p*q)/(1+v^2+u^2)) + (h/2)  * ((-2*v*p*q)/(1+u^2+v^2)-(2*h*((-2*v*((v*p*q^2+u*p^2*q)/(1+u^2+v^2)))+(p*q^2))*(1+u^2+v^2)+(2*v*p*q)*(2*u*p+2*v*q))/((1+u^2+v^2)^2));
  x(4) = q + (h/2)  * ((-2*u*p*q)/(1+v^2+u^2)) + (h/2)  * ((-2*u*p*q)/(1+u^2+v^2)-(2*h*((-2*u*((v*p*q^2+u*p^2*q)/(1+u^2+v^2)))+(p^2*q))*(1+u^2+v^2)+(2*u*p*q)*(2*u*p+2*v*q))/((1+u^2+v^2)^2));

  t = a + i * h;

  
  T = [ T, t ];
  Xh = [ Xh, x ];
  Uh = [ Uh, x(1) ];
  Vh = [ Vh, x(2) ];
  Ph = [ Ph, x(3) ];
  Qh = [ Qh, x(4) ];
    
end;


E=Xs'-Xh
plot(T,E)
title('Error local del metodo de Heun con 10000 iteraciones.')