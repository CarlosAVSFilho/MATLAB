%% Plota fuselagem
%close all, clear all, clc
function [] = PlotNariz(xN,xC,xT,d)
t = pi/4:pi/200:(360+45)*pi/180;

a = d;
b = d;
c = .5;
p = 0;
h = 0;

x = a*cos(t) + p;
y = b*sin(t) + h;

l    = linspace(0,xN,100);
% l = [0.0,0.74,8.35,13.14,19.35,24.41,28.41,30.77]*0.29172;
% l = [xN xN+xC];
prop = linspace(0,1,100);
% prop = [d d];

X = zeros(1,length(t));
Y = zeros(1,length(t));
Z = zeros(1,length(t));

for i = 1: length(l)

X(i,:) = x*prop(i)^c;
Y(i,:) = y*prop(i)^c;
Z(i,:) =  l(i); 

end

surf(Z,Y,X,'FaceColor',[.8 .8 .8],'FaceAlpha',.9,'EdgeAlpha',.2)
axis equal
