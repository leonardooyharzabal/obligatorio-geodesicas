n=10;
a=0;
b=10;
h = ( b - a ) / n;
x0=[1 0.5 0.5 0.5];
z=x0
t=a;
x=x0;
T=t;
X=x;
U = x0(1);
V = x0(2);
P = x0(3);
Q = x0(4);
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
     J=[1,0,-h,0;0,1,0,-h;-(2*h*v*p*q*(2*u))/((1+u^2+v^2)^2),(2*h*p*q*(-1+v^2-u^2))/((1+u^2+v^2)^2),1+((2*h*v*q)/(1+u^2+v^2)),(2*h*v*p)/(1+u^2+v^2);(2*h*p*q*(-1+u^2-v^2))/((1+u^2+v^2)^2),-(2*h*u*p*q*(2*v))/((1+u^2+v^2)^2),(2*h*u*q)/(1+u^2+v^2),1+((2*h*u*p)/(1+u^2+v^2))]
     B=(-1)*[u-(h)*p-ua;v-(h)*q-va;p+(2*h*v*p*q)/(1+u^2+v^2)-pa;q+(2*h*u*p*q)/(1+u^2+v^2)-qa]
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
  U = [ U, u ];
  V = [ V, v ];
  P = [ P, p ];
  Q = [ Q, q ];
endfor
X=[U' V' P' Q']
plot(T,X)
disp(X)
axis([0 10 0 10]);
title("Solucion segun Euler hacia atras");
text(9,3.2,'u','Color','cyan','FontSize',14);
text(9,2,'v','Color',[255/255 127/255 80/255],'FontSize',14);
text(8.7,0.7,'p','Color',[255/255 165/255 0/255],'FontSize',14);
text(9.1,0.7,'q','Color',[139/255 10/255 80/255],'FontSize',14);