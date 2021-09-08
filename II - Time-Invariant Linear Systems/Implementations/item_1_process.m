N = 200;
e = wgn(N,1,0);
v = zeros(1,N);

for n=3:N
    v(n) = 1.5*v(n-1) - 0.7*v(n-2) + e(n) + 0.5*e(n-1);
end
