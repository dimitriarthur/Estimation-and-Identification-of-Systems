x = zeros(1,N); zeta = zeros(4,N);
theta_IV_one = zeros(N,4);
for k = 3: N
    x(k) = u(k-2);
    zeta(:,k) = [-x(k-1) -x(k-2) u(k-1) u(k-2)]';
    theta_IV_one(k,:) = (inv(zeta*phi')*(zeta*y))';
end

theta_IV_one(N,:)
c= zeros(N,4);
history_of_coeficients=theta_IV_one;