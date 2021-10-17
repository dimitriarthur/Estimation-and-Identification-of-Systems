
x = zeros(1,N); zeta = zeros(4,N);
theta_IV_three=zeros(N,4);
for k = 3: N
    x(k) = 1.5*x(k-1)-0.7*x(k-2)+u(k-1)+0.5*u(k-2);
    zeta(:,k) = 1.5*zeta(:,k-1)-0.7*zeta(:,k-2)+[-x(k-1) -x(k-2) u(k-1) u(k-2)]';
    theta_IV_three(k,:) = (inv(zeta*phi')*(zeta*y));
end
history_of_coeficients= zeros(N,4);
history_of_coeficients=theta_IV_three;