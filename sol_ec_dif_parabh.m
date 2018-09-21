#!/usr/bin/octave -q

x0 = [0;0;0;1];

function sis=ec_dif(x,t)
 u = x(1);
 v = x(2);
 p = x(3);
 q = x(4);

 sis(1) = p;
 sis(2) = q;
 sis(3) = ((-2*v*p*q)/(1+v^2+u^2));
 sis(4) = ((-2*u*p*q)/(1+v^2+u^2));

endfunction;

t = (0:2:20);


x = lsode("ec_dif",x0,t);
plot(t,x)
