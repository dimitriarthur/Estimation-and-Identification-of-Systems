%define number of samples and simulate
N = 1000;
[y,u] = simulateSystem(N);
omega_0 = linspace(0,2*pi,N);
xi_frequency = linspace(-pi,pi,N);

%compute manual dft
U_N = compute_dft(N,u',omega_0);
Y_N = compute_dft(N,y,omega_0);

U_N = U_N./sqrt(N);
Y_N = Y_N./sqrt(N);

%compute approximate TF and ground-truth TF
G_double_hat = abs(Y_N./U_N);
syms q
z = tf('z');
H = (z+0.5*z^2)/(0.7*z^2 - 1.5*z +1);
[mag_groundTruth,phase_groundTruth, omega_groundTruth] = bode(H);

module_squared_U_N = abs(U_N).^2;
G_smoothed_=zeros(3,N);
cont=0;


for gamma=[10, 50, 200]
   cont=cont+1;
   %computing equation 6.46
   for i=1:N
       
       window = parzenWindow(gamma,xi_frequency-omega_0(i));
       num = sum(window.*module_squared_U_N.*abs(Y_N./U_N));
       den = sum(window.*module_squared_U_N);
       G_smoothed(cont,i) = num./den;
   end
end

figure()
subplot(2,2,1)
magnitude_plot(omega_0,omega_groundTruth,G_double_hat,squeeze(mag_groundTruth),'ETFE','$|G_0(e^{j\omega})|$');
subplot(2,2,2)
magnitude_plot(xi_frequency,omega_groundTruth,G_smoothed(1,:),squeeze(mag_groundTruth),'$|\hat G(e^{j\omega})|$','$|G_0(e^{j\omega})|$');
subplot(2,2,3)
magnitude_plot(xi_frequency,omega_groundTruth,G_smoothed(2,:),squeeze(mag_groundTruth),'$|\hat G(e^{j\omega})|$','$|G_0(e^{j\omega})|$');
subplot(2,2,4)
magnitude_plot(xi_frequency,omega_groundTruth,G_smoothed(3,:),squeeze(mag_groundTruth),'$|\hat G(e^{j\omega})|$','$|G_0(e^{j\omega})|$');

