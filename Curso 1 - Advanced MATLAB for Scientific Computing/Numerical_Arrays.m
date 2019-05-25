%% Array Creation and Indexing

% s = 0; n = 1000; A = ones(n);
% tic;
% for i = 1:n
%     for j = 1:n
%         s = s + A(j,i);
%     end
% end
% toc;
% 
% A = rand(1000,1000)
% A(4)


% x = linspace(0,2*pi,1000);
% y = sin(x);
% plot(x,y,'k-','linew',2); hold on;
% 
% scatter([A],[B],'r*');
% A = x(x<=pi)
% B = y(x<=pi)
% 
% scatter([C],[D],'b.');
% C = x(y>-0.5 & y<0.5)
% D = y(y>-0.5 & y<0.5)

%Paschoal Triangle
% A = zeros(100);
% A(1,1) = 1;
% A(2,1) = 1;
% A(2,2) = A(1,1)+A(1,2);
% A(3,1) = 1;
% A(3,2) = A(2,1)+A(2,2);
% A(3,3) = A(2,2)+A(2,3);
% A(4,1) = 1;
% A(4,2) = A(3,1) + A(3,2);
% A(4,3) = A(3,2) + A(3,3);
% A(4,4) = A(3,3) + A(3,4);

A = zeros(100);
A(:,1) = 1;
tic;
for i = 2:100
    for j = 2:100
        A(j,i) = A(j-1,i-1) + A(j-1,i);
    end
end
toc; %[j,i](Preenchimento das colunas primeiro) Elapsed time is 0.000244 seconds.
     %[i,j](Preenchimento das linhas primeiro) Elapsed time is 0.000188 seconds.
     % O resultado esperado era o contrário

     
%% Array manipulation













