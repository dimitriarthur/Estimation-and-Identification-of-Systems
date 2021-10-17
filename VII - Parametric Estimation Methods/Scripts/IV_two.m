x = zeros(1,N); 
zeta = zeros(4,N);
theta_IV_two=zeros(N,4);
for k = 3: N
    x(k) = -history_of_coeficients_N_100(N,1)*x(k-1)-history_of_coeficients_N_100(N,2)*x(k-2)+...
           history_of_coeficients_N_100(N,3)*u(k-1)+history_of_coeficients_N_100(N,4)*u(k-2);
    zeta(:,k) = [-x(k-1) -x(k-2) u(k-1) u(k-2)]';
    theta_IV_two(k,:) = (inv(zeta*phi')*(zeta*y))';
end

history_of_coeficients=zeros(N,4);
history_of_coeficients = theta_IV_two;