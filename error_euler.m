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

z=x;
Xt=x;
Ut = x0(1);
Vt = x0(2);
Pt = x0(3);
Qt = x0(4);
for i=1:n
ua = z(1);
va = z(2);
pa = z(3);
qa = z(4);
     u=ua+h*pa
     v=va+h*qa
     p=pa+h*(-2*va*pa*qa)/(1+ua^2+va^2)
     q=qa+h*(-2*ua*pa*qa)/(1+ua^2+va^2)
     x(1)=u
     x(2)=v
     x(3)=p
     x(4)=q
     for j=1:10
     J=[1,0,-(h/2),0;0,1,0,-(h/2);-(h*v*p*q*(-2*u))/((1+u^2+v^2)^2),-(h*p*q*(-1+v^2-u^2))/((1+u^2+v^2)^2),1+((h*v*q)/(1+u^2+v^2)),(h*v*p)/(1+u^2+v^2);-(h*p*q*(-1+u^2-v^2))/((1+u^2+v^2)^2),-(h*u*p*q*(2*v))/((1+u^2+v^2)^2),(h*u*q)/(1+u^2+v^2),1+((h*u*p)/(1+u^2+v^2))]
     B=(-1)*[u-(h/2)*p-ua-(h/2)*pa;v-(h/2)*q-va-(h/2)*qa;p+(h/2)*(2*h*v*p*q)/(1+u^2+v^2)-pa+(h/2)*(2*h*va*pa*qa)/(1+ua^2+va^2);q+(h/2)*(2*h*u*p*q)/(1+u^2+v^2)-qa+(h/2)*(2*h*ua*pa*qa)/(1+ua^2+va^2)]
     s = J\B
     x=x+s'
     u = x(1);
     v = x(2);
     p = x(3);
     q = x(4);
     endfor
z=x    
t = t + h;
T = [ T, t ];
Ut = [ Ut, u ];
Vt = [ Vt, v ];
Pt = [ Pt, p ];
Qt = [ Qt, q ];
endfor
Xt=[Ut' Vt' Pt' Qt']

E=Xs-Xt
plot(T,E)
title('Error local del metodo del trapecio con 100 iteraciones.')
text(2,-0.012,'Error de u en azul, v en verde, p en celeste y q en rojo.')