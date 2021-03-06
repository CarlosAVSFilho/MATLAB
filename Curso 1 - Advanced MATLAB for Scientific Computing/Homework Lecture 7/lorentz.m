function f = lorentz(beta,t,x1,x2,x3)
%LORENTZ
%    F = LORENTZ(BETA,T,X1,X2,X3)

%    This function was generated by the Symbolic Math Toolbox version 6.2.
%    01-Dec-2018 18:02:57

t2 = beta.^2;
t3 = -t2+1.0;
t4 = 1.0./sqrt(t3);
f = [t4.*(x1-beta.*t),x2,x3,t4.*(t-beta.*x1)];
