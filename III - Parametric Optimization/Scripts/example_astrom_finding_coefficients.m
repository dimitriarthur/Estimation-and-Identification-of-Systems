A = [1 0.7 0.5 -0.3];
B = [1 0.3 0.2 0.1];

order = length(A);
a_aux = A;
b_aux = B;
a = zeros(1,order-1);
b = zeros(1,order-1);
tracking_a = zeros(order);
tracking_a(1,:) = A;
tracking_b = zeros(order);
tracking_b(1,:) = B;
integral = 0;

for line=1:order-1
    for term=1:order-line
       a(term) = a_aux(term) - a_aux(order-line+1)/a_aux(1)*a_aux(order+2-line-term);
       b(term) = b_aux(term) - b_aux(order-line+1)/a_aux(1)*a_aux(order+2-line-term);
       order+1-line-term;
    end
    
    a_aux = a(1:order-line);
    b_aux = b(1:order-line);
    
    tracking_a(line+1,1:order-line)=a_aux;
    tracking_b(line+1,1:order-line)=b_aux;
    
end

for idx=1:order
    k=order-idx+1;
    integral = integral + tracking_b(k,idx)^2/tracking_a(k,1);
end

integral = integral/tracking_a(1,1)