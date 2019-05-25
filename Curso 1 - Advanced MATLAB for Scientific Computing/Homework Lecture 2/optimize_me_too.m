function D = optimize_me_too(D1,nx,a,dt)

D1 = D1*a*dt; %delayed copy can make a huge difference (when large matrix passed to function, don't unnecessarily modify it)
D = eye(nx) - D1;

end