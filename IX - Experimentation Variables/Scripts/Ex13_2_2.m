
U = zeros(4,N); 
[w,U(1,:)] = raw_FFT(u(1,:),N);
[~,U(2,:)] = raw_FFT(u(2,:),N);
[~,U(3,:)] = raw_FFT(u(3,:),N);
[~,U(4,:)] = raw_FFT(u(4,:),N);

figure()
semilogy(w(1:N/2),U(1,1:N/2),'--','LineWidth',1.8)
hold on;
semilogy(w(1:N/2),U(2,1:N/2),'.','LineWidth',1.2)
semilogy(w(1:N/2),U(3,1:N/2),'-','LineWidth',1.5);
semilogy(w(1:N/2),U(4,1:N/2),'-.','LineWidth',1.6); hold off,
xlabel('$\omega$','Interpreter','Latex'), grid on
xlim([0,3]), ylim([1e-2, 1e1])
legend("$U(\omega)$","$U_{Schr}(\omega)$","$U_{rand}(\omega)$","$U_{swept}(\omega)$",...
    'Interpreter','Latex',...
    "Location","best")