phi = zeros(6,N);
for k=4:N
    phi(:,k) = [-y(k-1) -y(k-2) -y(k-3) u(k-1) u(k-2) u(k-3)]';
end
theta_model1 = (inv(phi*phi')*(phi*y))'
theta_model2 = (inv(phi(:,1:301)*phi(:,1:301)')*(phi(:,1:301)*y(1:301)))'