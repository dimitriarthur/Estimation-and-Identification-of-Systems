
figure()
plot(theta_model_2(1,:),'LineWidth',1, 'color','#D95319')
hold on
plot(ones(1,length(theta_model_2(1,:))),'--','color','#7E2F8E')
hold on
plot(theta_model_2(2,:),'LineWidth',1,'color','#77AC30')
hold on
plot(ones(1,length(theta_model_2(1,:)))*-0.8,'--','color','#0072BD')
ylim([-1 1.5])
grid on
legend('$\hat{a}(t)$','','$\hat{b}(t)$','','Interpreter','Latex');
title('Parameter Estimation for the Second System')
