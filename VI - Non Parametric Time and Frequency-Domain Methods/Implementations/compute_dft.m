function signal_transformed = compute_dft(N,signal,omega)

     signal_transformed = zeros(1,N);
     k=1:N;
     
     for sampling_w=1:N
         signal_transformed(sampling_w) = sum(signal.*exp(-j*omega(sampling_w)*k));  
     end
     
end