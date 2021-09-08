svariance = 1;
N = 200;
e = wgn(N,1,0); %1000 element white gaussian noise with variance 1 and 0db power 
u = wgn(N,1,0);
y1 = zeros(1,N);
y2 = zeros(1,N);
theta_model_1 = zeros(2,length(y1));
theta_model_2 = zeros(2,length(y2));

for n=2:N
    y1(n) = u(n-1) + 0.8*y1(n-1) + e(n-1);
    y2(n) = u(n-1) + 0.8*y2(n-1) + e(n) - 0.8*e(n-1);
end

R = 0; %the sum of all phi*phi'
F = 0; %the sum of all phi*y(t)
for t=2:N
    phi = [-y1(t-1) u(t-1)]'; %regressor variable
    psi = phi*y1(t);
    R = R + phi*phi'; %regressor times regressor transposed term
    F = F + psi;
    theta_model_1(:,t) = inv(R)*F;
end

R = 0; %the sum of all phi*phi'
F = 0; %the sum of all phi*y(t)
for t=2:N
    phi = [-y2(t-1) u(t-1)]'; %regressor variable
    psi = phi*y2(t);
    R = R + phi*phi'; %regressor times regressor transposed term
    F = F + psi;
    theta_model_2(:,t) = inv(R)*F;
end

%z = zeros(size(y1));
%for k=3:N
%    phi = [-z(t-1) u(t-1)];
%    z(k) = phi*theta_model_1(:,end) + e(k-1);
%end

