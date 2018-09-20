#!/usr/bin/octave -q



a = 0;
b = 10;

x0 = [1;0.5;0.52721;0.5];

% Desired number of subintervals

n = 10000;

% Begin the solution process...

h = ( b - a ) / n;
t = a;
x = x0;

% T and X are arrays that will contain each t value and each x value
% computed.  They are not necessary for the final solution, but are used
% to produce a plot of the solution curve.

T = t;
X = x;
U = x(1);
V = x(2);
P = x(3);
Q = x(4);

% Enter the main loop.

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

  % Now we can save the current values of t and x(t) for plotting.

  T = [ T, t ];
  X = [ X, x ];
  U = [ U, x(1) ];
  V = [ V, x(2) ];
  P = [ P, x(3) ];
  Q = [ Q, x(4) ];
    
end;

plot( T, X);
axis([0 10 0 10])