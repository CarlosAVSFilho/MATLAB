%% Plota Leme
% clear all %close all, clc
function [] = PlotLeme(croot,ctip,Xvt,b_t,bvt,enfin,enfout,diedin,diedout,alfa,torc)
load naca0008.dat

p = naca0008;

x = p(:,1)'-.25; % Menos .25 para que o alinhamento seja próximo à CMA do perfil
y = p(:,2)'*1;


X = [croot*x*cosd(alfa)
     croot*x*cosd(alfa)         + b_t*bvt*tand(enfin) 
     ctip *x*cosd(alfa + torc)  + (1-b_t)*bvt*tand(enfout)]+croot*.25;
 
Y = [croot*y - sind(alfa)*x 
     croot*y - sind(alfa)*x + b_t*bvt*sind(diedin)
     ctip*y  - sind(alfa + torc)*x+ (1-b_t)*bvt*sind(diedout)];
 
Z = [zeros(1,length(x)); ones(1,length(x))*bvt*b_t; ones(1,length(x))*bvt];


surf(X+Xvt,Y,Z,'FaceColor',[1 1 .3],'FaceAlpha',1,'EdgeAlpha',.2);

axis equal

%% OBS.: Caso precise usar várias cordas:
% z = linspace(0,bw,100);
% c = linspace(croot,ctip,100);
% X = zeros(1,length(x));
% Y = zeros(1,length(x));
% Z = zeros(1,length(x));
% for i = 1:100
%     
%     X(i,:) = c(i)*x*cosd(alfa + torc)  + (1-b_t)*z(i)*tand(enf2)+ croot*.25;
%     Y(i,:) = c(i)*y  - sind(alfa + torc)*x+ (1-b_t)*z(i)*sind(died2) ;
%     Z(i,:) = z(i);
%     
% end