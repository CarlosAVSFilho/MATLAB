%% Plota asa
function PlotAsa(croot,ctip,Xw,Zw,b_t,bw,enfin,enfout,diedin,diedout,alfa,torc,crVT,ctVT,xLE_vt,bVT,sweepVT,crHT,ctHT,xLE_ht,bHT,sweepHT,xN,xC,xT,d)

load naca2412.dat

p = naca2412;

x = p(:,1)'-.25; % Menos .25 para que o alinhamento seja próximo à CMA do perfil
y = p(:,2)'*1;

xref    = .25;
yref    = (max(y)+min(y))/2;

X = [croot*((x-xref)*cosd(-(alfa)) - (y-yref)*sind(-(alfa)) + xref)
     croot*((x-xref)*cosd(-(alfa)) - (y-yref)*sind(-(alfa)) + xref)         + b_t*bw/2*tand(enfin) 
     ctip *((x-xref)*cosd(-(alfa+torc)) - (y-yref)*sind(-(alfa+torc)) + xref)  + (1-b_t)*bw/2*tand(enfout)]+croot*.25;
 
Y = [croot*((y-yref)*cosd(-(alfa)) + (x-xref)*sind(-(alfa)) + yref) - sind(alfa)*x 
     croot*((y-yref)*cosd(-(alfa)) + (x-xref)*sind(-(alfa)) + yref) - sind(alfa)*x + b_t*bw/2*sind(diedin)
     ctip*((y-yref)*cosd(-(alfa+torc)) + (x-xref)*sind(-(alfa+torc)) + yref)+ (1-b_t)*bw/2*sind(diedout)];
 
Z = [zeros(1,length(x))
     ones(1,length(x))*bw/2*b_t
     ones(1,length(x))*bw/2] ;



hold off
axis equal

view(3)
PlotLeme(crVT,ctVT,xLE_vt,0,bVT,sweepVT,sweepVT,0,0,0,0)
hold on
PlotProf(crHT,ctHT,xLE_ht,0,0,bHT,sweepHT,sweepHT,0,0,0,0)
hold on
PlotFuselagem(xN,xC,xT,d)

surf(X+Xw,Z,Y+Zw,'FaceColor',[0 .2 .5],'FaceAlpha',1,'EdgeAlpha',0);

hold on

surf(X+Xw,-Z,Y+Zw,'FaceColor',[0 .2 .5],'FaceAlpha',1,'EdgeAlpha',0);hold off
axis([-1 xC+xN+xT+3 -bw/2-1 bw/2+1 -4 d+bVT ])

