%% Plota Profundor
% clear all %close all, clc
function [] = PlotProf(croot,ctip,Xht,Zht,b_t,bht,enfin,enfout,diedin,diedout,alfa,torc)
load Prof.dat

p = Prof;

x = p(:,1)'-.25; % Menos .25 para que o alinhamento seja próximo à CMA do perfil
y = p(:,2)'*1;


X = [croot*x*cosd(alfa)
     croot*x*cosd(alfa)         + b_t*bht/2*tand(enfin) 
     ctip *x*cosd(alfa + torc)  + (1-b_t)*bht/2*tand(enfout)]+croot*.25;
 
Y = [croot*y - sind(alfa)*x 
     croot*y - sind(alfa)*x + b_t*bht/2*sind(diedin)
     ctip*y  - sind(alfa + torc)*x+ (1-b_t)*bht/2*sind(diedout)];
 
Z = [zeros(1,length(x)); ones(1,length(x))*bht/2*b_t; ones(1,length(x))*bht/2];



% figure
surf(X+Xht,Z,Y+Zht,'FaceColor',[0 .2 .5],'FaceAlpha',1,'EdgeAlpha',.2);
hold on
surf(X+Xht,-Z,Y+Zht,'FaceColor',[0 .2 .5],'FaceAlpha',1,'EdgeAlpha',.2);hold off
axis equal
% view (3)