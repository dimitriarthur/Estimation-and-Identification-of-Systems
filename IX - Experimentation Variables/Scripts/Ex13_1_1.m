
rng('default')
N = 1000;
gauss = normrnd(0,1,[1 N]);
[b,a] = butter(5,[1 2]/pi,"bandpass");
e = filter(b,a,gauss);
rbs = -ones(size(e))+2*(e>0);

figure()
subplot(2,1,1)
stairs(e, "LineWidth", 1), 
xlabel('$t$','Interpreter','Latex'),
ylabel('$e(t)$','Interpreter','Latex'), grid on, xlim([0 100])

subplot(2,1,2), 
stairs(rbs,"LineWidth", 1,'color','#7E2F8E'), 
ylim([-1.2,1.2]),
xlabel('$t$','Interpreter','Latex'),
ylabel('$RBS(t)$','Interpreter','Latex'), grid on, xlim([0 100])