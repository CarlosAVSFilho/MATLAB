clc; clear all
% a = 100;
% b = 1;
% x = (a-b)*(a^2+a*b+b^2)

% a = 100;
% b = 1;
% syms a b;
% x = simplify((a-b)*(a^2+a*b+b^2))
% x = 1;

% syms x
% y = expand((x+1)*(x+2)*(x+3)*(x+4)*(x+5)*(x+6))

% syms a b c;
% A = [a, b; b, c]
% eig(A)


% syms X Y Z;
% isAlways((X+Y+Z)^7 - (X^7 + Y^7 + Z^7) == 7*(X+Y)*(X+Z)*(Y+Z)*((X^2+Y^2+Z^2+X*Y+X*Z+Y*Z)^2+X*Y*Z*(X+Y+Z))) %1 if yes 0 if no

% syms E m_0 c v
% solve(E == (m_0*c^2)/(sqrt(1-((v^2)/c^2))))

% syms x a;
% assume(a~=-1);
% int(x^a,x)

% syms x
% y = solve(x^4 - x + 1, x)
% vpa(y,4)

% syms a t s;
% assume(a>0);
% assume(s,'real');
% f = exp(-a*t);
% 
% assume(s>-a)
% inv(int(f*exp(-s*t),t,0,inf))

% syms a b c d e f g h i
% A = [a,b,c;
%     d,e,f;
%     g,h,i];
% 
% B = inv(A);
% 
% B(1,1)


% syms t x1 x2 x3 beta
% x1_prime = (x1-beta*t)/sqrt(1-beta^2);
% x2_prime = x2;
% x3_prime = x3;
% t_prime = (t-beta*x1)/sqrt(1-beta^2);
% f = [x1_prime, x2_prime, x3_prime, t_prime];
% y = matlabFunction(f,'file','lorentz')
% latex(f)


%EULER EQUATION
% B = A.' transpose matrix

% diff(F) %Derivar uma equação

syms rho u v e p gamma c

% p = (gamma-1)*(e - p*((u^2+v^2)/2));

U = [rho, rho*u, rho*v, e].';
V = [rho, u, v, p].';
F = [rho*u, rho*u^2 + p, rho*u*v, (e + p)*u].';
G = [rho*v, rho*v*u, rho*v^2 + p, (e+p)*v].';
e=(p/(gamma-1))+(rho*(u^2+v^2)/2);
% c = sqrt((gamma*p)/rho);
gamma = (rho*c^2)/p;
%####

A = inv(jacobian(subs(U),V))*jacobian(subs(F),V);
%Resposta Letra A:
A(2,2)

[C D]=eig(A);
% C
% D
%Resposta Letra C:
C(3,2)

B = inv(jacobian(subs(U),V))*jacobian(subs(G),V);
%Resposta Letra B;
B(3,3)

[E H]=eig(B);
% E
% H
%Resposta Letra D:
E(1,4)

%Resposta Letra E:
% eig(A)
%Resposta Letra F:
% (eig(B)
