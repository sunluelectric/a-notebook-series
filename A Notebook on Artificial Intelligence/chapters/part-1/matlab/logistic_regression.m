%% logistic function

x = linspace(-10,10,100);
y = 1./(1+exp(-x));

figure
hold on
plot(x,y)
grid on
xlabel('$z$', 'Interpreter','latex')
ylabel('$g(z)$', 'Interpreter','latex')
hold off