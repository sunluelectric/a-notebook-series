% plotfigs.m
significance_level = 0.01;
u_alpha = sqrt(2) * erfinv(1-2*significance_level);
x = -5:0.01:5;
y = normpdf(x);
x1 = u_alpha:0.01:5;
y1 = normpdf(x1);
x2 = -5:0.01:u_alpha;
y2 = normpdf(x2);
figure
ax = subplot(1,1,1);
hold on
plot(ax,x,y,'k-', 'linewidth', 2)
patch([x2 fliplr(x2)], [zeros(size(x2)) fliplr(y2)], 'g')
patch([x1 fliplr(x1)], [zeros(size(x1)) fliplr(y1)], 'r')
xline(u_alpha)
xlabel('$\frac{\sigma}{\sqrt{m}}\left(\mu - \bar{X}\right)$','interpreter','latex')
ylabel('$\mathcal{N}\left(0,1\right)$','interpreter','latex')
grid on