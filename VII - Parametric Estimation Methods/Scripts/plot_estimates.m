plot(history_of_coeficients, 'LineWidth',1)
hold on
plot(ones(1,N)*-1.5,'Color','#D95319','LineStyle','--')
hold on
plot(ones(1,N)*0.5,'Color','#A2142F','LineStyle','--')
hold on
plot(ones(1,N)*0.7,'Color','#77AC30','LineStyle','--')
hold on
plot(ones(1,N),'Color','#0072BD','LineStyle','--')
hold off
legend('$a_1$','$a_2$','$b_1$','$b_2$','Interpreter','Latex')
ylim([-2 2.5])
grid