clc; clear all;

[RGB] = get_rgb('palm.png');
A = RGB;

% By using SVD function you will get a diagonal matrix whose diagonal elements are singular values.
% In v(k) expression numerator is sum of singular values up to k. Denominator is sum of all singular values.

%TASK 3
[u,s,v] = svd(A);
p = rank(A);

soma_t3 = 0;
for i = 1:p
    soma_t3 = soma_t3 + (s(i,i))^2;
end

%Resposta task 3:
v_k_t3 = 1 - ((s(1,1))^2)/soma_t3

%TASK 4
q = 1; %1, 5 or 10 (1 according to the Task 4)
p = 50; %Taking just the 50th first "S" diag values

[~,n] = size(A);
G = randn(n,p);
Y = ((A* A')^q)*A*G;
[Q,~] = qr(Y,0);
B = (Q')*A;
[U_ , S, V] = svd(B,0);
U = Q*U_;

soma_t4 = 0;
for i = 1:50
    soma_t4 = soma_t4 + (S(i,i))^2;
end

%Resposta task 4: v(1) = 0.147
v_k_t4 = 1 - ((S(1,1))^2)/soma_t4

