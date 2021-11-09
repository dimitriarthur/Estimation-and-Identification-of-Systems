%% parameters
rng('default') % For reproducibility
% generating signals
d = 10;
N = 300;
w = linspace(1,2,d);
u = zeros(4,N); 
t = 1:N;

phi = zeros(1,d);
for i=2:d
    phi(i) = phi(1)-i*(i-1)*pi/d;
end
phi_all = [zeros(1,d); phi; randn(1,d);];

%% sum of senoids
for i=1:d
    u(1,:) = u(1,:) + cos(w(i)*t + phi_all(1,i));
end
%% Schroeder choice
for i=1:d
    u(2,:) = u(2,:) + cos(w(i)*t+phi_all(2,i));
end
%% random phases
phi = randn(1,d);
for i=1:d
    u(3,:) = u(3,:) + cos(w(i)*t+phi_all(3,i));
end
%%  swept cossine
u(4,:) = cos(t+t.^2/2/N);
% plot

%% plots
figure()
subplot(4,1,1); stairs(u(1,:),"Linewidth",1),
xlim([200,300]), ylim([-10,10]), xlabel("$t$",'Interpreter','Latex'),
ylabel("$u(t)$",'Interpreter','Latex'), grid minor
subplot(4,1,2); stairs(u(2,:),"Linewidth",1,'color','#D95319'),
xlim([200,300]), ylim([-10,10]), xlabel("$t$",'Interpreter','Latex'),
ylabel("$u_{Schr}(t)$",'Interpreter','Latex'), grid minor
subplot(4,1,3); stairs(u(3,:),"Linewidth",1,'color','#7E2F8E'),
xlim([200,300]), ylim([-10,10]), xlabel("$t$",'Interpreter','Latex'),
ylabel("$u_{Rand}(t)$",'Interpreter','Latex'), grid minor
subplot(4,1,4); stairs(u(4,:),"Linewidth",1,'color','#A2142F'),
xlim([200,300]), ylim([-1,1]), xlabel("$t$",'Interpreter','Latex'),
ylabel("$u_{Swept}(t)$",'Interpreter','Latex'), grid minor