syms q;
H = (1+0.5*q)/(0.7*q^2 -1.5*q + 1);
spectrum = vpa(abs(subs(H,q,exp(-j*logspace(-2,1,N))))).^2;
loglog(logspace(-2,1,N),spectrum,'LineWidth',1)
grid;
yticks([1 10 100])
yticklabels({'1','10','100'})
xticks([0.1 1])
xticklabels({'0.1','1'})
ylim([1e-1 1e3])
xlim([1e-2 4])
xlabel('$\omega$','interpreter','Latex');
ylabel('$\Phi_s(\omega)$','interpreter','Latex');
title('Spectrum - $v(t)$','interpreter','Latex','FontSize',13)



syms q;
H = (q+0.5*q^2)/(1-1.5*q+0.7*q^2);
spectrum = vpa(abs(subs(H,q,exp(-j*logspace(-2,1,N))))).^2;
loglog(logspace(-2,1,N),spectrum,'LineWidth',1)
grid;
yticks([1 10 100])
xticks([0.1 1])
xlabel('$\omega$','interpreter','Latex');
ylabel('$\Phi_s(\omega)$','interpreter','Latex');
title('Spectrum - $v(t)$','interpreter','Latex','FontSize',13)