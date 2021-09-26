function [y,u] = simulateSystem(N)
    e = wgn(N,1,0);
    y = zeros(1,N);
    u = idinput(N); % returns a single-channel random binary input signal u of length N. 
    
    for n=3:N
        y(n) = 1.5*y(n-1) - 0.7*y(n-2) + u(n-1) + 0.5*u(n-2)+ e(n);
    end
    
end
