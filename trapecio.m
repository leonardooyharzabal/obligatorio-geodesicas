time=cputime;

n=100000;
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
     for j=1:10
     u=ua+h*pa
     v=va+h*qa
     p=pa+h*(-2*va*pa*qa)/(1+ua^2+va^2)
     q=qa+h*(-2*ua*pa*qa)/(1+ua^2+va^2)
     x(1)=u
     x(2)=v
     x(3)=p
     x(4)=q
     J=[1,0,-(h/2),0;0,1,0,-(h/2);-(h*v*p*q*(-2*u))/((1+u^2+v^2)^2),-(h*p*q*(-1+v^2-u^2))/((1+u^2+v^2)^2),1+((h*v*q)/(1+u^2+v^2)),(h*v*p)/(1+u^2+v^2);-(h*p*q*(-1+u^2-v^2))/((1+u^2+v^2)^2),-(h*u*p*q*(2*v))/((1+u^2+v^2)^2),(h*u*q)/(1+u^2+v^2),1+((h*u*p)/(1+u^2+v^2))]
     B=(-1)*[u-(h/2)*p-ua-(h/2)*pa;v-(h/2)*q-va-(h/2)*qa;p+(h/2)*(2*h*v*p*q)/(1+u^2+v^2)-pa+(h/2)*(2*h*va*pa*qa)/(1+ua^2+va^2);q+(h/2)*(2*h*u*p*q)/(1+u^2+v^2)-qa+(h/2)*(2*h*ua*pa*qa)/(1+ua^2+va^2)]
     s = J\B
     x=x+(1/2)*s'
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
printf('Tiempo de cálculo: %f segundos\n', cputime-time);

plot(T,X);
axis([0 10 0 10]);
title("Solución según Método del Trapecio 100000 iteraciones");
text(9,4.5,'u','Color','blue','FontSize',14);
text(9,3,'v','Color','red','FontSize',14);
text(8.7,0.7,'p','Color',[1 0.9 0],'FontSize',14);
text(9.1,0.7,'q','Color','magenta','FontSize',14);