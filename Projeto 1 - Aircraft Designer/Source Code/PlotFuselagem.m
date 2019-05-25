%% Plota fuselagem
%close all, clear all, clc
function [] = PlotFuselagem(xN,xC,xT,d)
t = 0:pi/50:2*pi;
r = d/2;
a = r;
b = r;
p = 0;
h = 0;

x = a*cos(t) + p;
y = b*sin(t) + h;
%% Nariz:
cN = .5;

lN    = linspace(0,xN,50);

propN = linspace(0,1,50);

Xn = zeros(1,length(t));
Yn = zeros(1,length(t));
Zn = zeros(1,length(t));

for i = 1: length(lN)

Xn(i,:) = x*propN(i)^cN;
Yn(i,:) = y*propN(i)^cN;
Zn(i,:) =  lN(i); 

end

%% Cabine:
c    = 1;
l    = [xN  xN+xC];
prop = [1 1];

Xc = zeros(1,length(t));
Yc = zeros(1,length(t));
Zc= zeros(1,length(t));

for j = 1: length(l)

Xc(j,:) = x*prop(j)^c;
Yc(j,:) = y*prop(j)^c;
Zc(j,:) =  l(j); 

end

%% Calda:

cT = 1/1.5;

lT    = linspace(xN+xC,xN+xC+xT,50);

propT = linspace(1,0,50);

Xt = zeros(1,length(t));
Yt = zeros(1,length(t));
Zt= zeros(1,length(t));

for i = 1: length(lT)

Xt(i,:) = x*propT(i)^cT;
Yt(i,:) = y*propT(i)^cT;
Zt(i,:) =  lT(i); 

end

%% Plot:

% Plot do Nariz:
surf(Zn,Yn,Xn,'FaceColor',[.8 .8 .8],'FaceAlpha',1,'EdgeAlpha',.1)
hold on
% Plot da Cabine:
surf(Zc,Yc,Xc,'FaceColor',[.8 .8 .8],'FaceAlpha',1,'EdgeAlpha',.1)

% Plot da Calda:
surf(Zt,Yt,Xt,'FaceColor',[.8 .8 .8],'FaceAlpha',1,'EdgeAlpha',.1)

axis equal
