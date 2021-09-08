
[per,w] = periodogram(v); %periodogram(___) returns the normalized frequency vector, w.

figure(1)
loglog(w(3:end),per(3:end), 'LineWidth', 1)
yticks([1 10 100])
yticklabels({'1','10','100'})
xticks([0.1 1])
xticklabels({'0.1','1'})
ylim([1e-2 1e3])
grid
xlabel('$\omega$','interpreter','Latex')
ylabel('$|V_N(\omega)|^2 $','interpreter','Latex')
title('Periodogram - $v(t)$','interpreter','Latex','FontSize',13)
