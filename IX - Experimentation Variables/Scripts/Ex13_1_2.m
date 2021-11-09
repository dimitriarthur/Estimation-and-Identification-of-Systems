
[w,E] = raw_FFT(e,N);
[~,RBS] = raw_FFT(rbs,N);

figure()
semilogy(w(1:N/2),RBS(1:N/2),'--','LineWidth',1,'color','#EDB120'); hold on;
semilogy(w(1:N/2),E(1:N/2),'LineWidth',1,'color','#7E2F8E'); hold off,
xlabel('$\omega$ ','Interpreter','Latex'), grid on
xlim([0,3]), ylim([1e-3, 1e1])
legend("$RBS(\omega)$","$E(\omega)$",'Interpreter','Latex',...
    "Location","northwest")