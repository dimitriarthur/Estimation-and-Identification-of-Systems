
N = 200;
e = wgn(N,1,0);
w = zeros(3,N);
r = rand(N,1);
p1 = 0.01; %prob 1 
p2 = 0.01; %prob 2
v1 = sqrt(50); %threshold 1 of e(t)
v2 = -sqrt(50);%threshold 1 of e(t)
k = zeros(size(r));
rng(1);


%first 3 models
for n=2:N
    w(1,n) = 0.9*w(1,n-1) + e(n);
    w(2,n) = -0.9*w(2,n-1) + e(n);
    if(n>=3)
        w(3,n) = 0.5*w(3,n-1) - 0.7*w(3,n-2) + e(n) + 0.5*e(n-1);
    end
end

% not normally distributed e(t)
k(find(r<=p1))=v1;
k(find((r>p1)&(r<=(p1+p2))))=v2;


figure()
title('')
subplot(4,2,1)
plot(w(1,:),'LineWidth',1)
grid;

subplot(4,2,2)
[c,lags] = xcov(w(1,:),20,'normalized');% [c,lags] = xcov(___) also returns the lags at which the covariances are computed.
plot(lags,c,'LineWidth',1)
grid;

subplot(4,2,3)
plot(w(2,:),'LineWidth',1)
grid;

subplot(4,2,4)
[c,lags] = xcov(w(2,:),20,'normalized');
plot(lags,c,'LineWidth',1)
grid;

subplot(4,2,5)
plot(w(3,:),'LineWidth',1)
grid;

subplot(4,2,6)
[c,lags] = xcov(w(3,:),20,'normalized');
plot(lags,c,'LineWidth',1)
grid;

subplot(4,2,7)
plot(k,'LineWidth',1)
grid;

subplot(4,2,8)
[c,lags] = xcov(k,20,'normalized');
plot(lags,c,'LineWidth',1)
grid;

h1 = annotation('textbox',[0.19 0.95 0.2 0.05],...
    'string','Realizations of $w(t)$', 'interpreter','Latex');
h2 = annotation('textbox',[0.58 0.95 0.2 0.05],...
    'string','Covariance Functions of $w(t)$', 'interpreter','Latex');
set([h1 h2], 'fitboxtotext','on',...
    'edgecolor','none')