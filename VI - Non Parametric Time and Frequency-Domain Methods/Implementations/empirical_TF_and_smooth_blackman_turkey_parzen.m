%calculating the auto-correlation of u

%as N->\infty : |U_N|^2 -> \phi_u
R_u = xcorr(u,u');
Phi_u = compute_dft(N,R_u',xi_frequency);
Phi_u = Phi_u./sqrt(N);
G_smoothed_blackman_turkey=zeros(3,N);
cont = 0;

for gamma=[10, 50, 200]
   cont=cont+1;
   %computing equation 6.51
   for i=1:N
       window = parzenWindow(gamma,xi_frequency-omega_0(i));
       num = sum(window.*Phi_u.*abs(Y_N./U_N));
       den = sum(window.*Phi_u);
       G_smoothed_blackman_turkey(cont,i) = num./den;
   end
   
end

figure()
subplot(2,2,1)
magnitude_plot(omega_0(:,1:500),omega_groundTruth,G_double_hat(:,1:500),squeeze(mag_groundTruth),'ETFE','$|G_0(e^{j\omega})|$');
subplot(2,2,2)
magnitude_plot(xi_frequency,omega_groundTruth,G_smoothed_blackman_turkey(1,:),squeeze(mag_groundTruth),'$|\hat G(e^{j\omega})|_{\Phi_u; \gamma = 10}$','$|G_0(e^{j\omega})|$');
subplot(2,2,3)
magnitude_plot(xi_frequency,omega_groundTruth,G_smoothed_blackman_turkey(2,:),squeeze(mag_groundTruth),'$|\hat G(e^{j\omega})|_{\Phi_u; \gamma = 50}$','$|G_0(e^{j\omega})|$');
subplot(2,2,4)
magnitude_plot(xi_frequency,omega_groundTruth,G_smoothed_blackman_turkey(3,:),squeeze(mag_groundTruth),'$|\hat G(e^{j\omega})|_{\Phi_u; \gamma = 200}$','$|G_0(e^{j\omega})|$');

