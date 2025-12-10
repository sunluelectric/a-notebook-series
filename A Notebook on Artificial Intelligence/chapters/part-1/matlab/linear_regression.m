% 1-d linear regression
a = 2.5;
b = 1;
m = 50;
x_sample = linspace(0,10,m);
y_sample = a*x_sample + b + normrnd(0,1,[1,m]);

ahat = 0;
bhat = 0;

num_of_epoch = 30;
mini_batch_size = 50;
mini_batch_num = ceil(m/mini_batch_size);
learning_rate = 0.0001;

audit_j = zeros(1,num_of_epoch);
audit_ahat = zeros(1,num_of_epoch);
audit_bhat = zeros(1,num_of_epoch);

audit_j_initial = 0;
for idx = 1:m
    audit_j_initial = audit_j_initial + 0.5*(ahat*x_sample(idx)+bhat-y_sample(idx))^2;
end

for idx = 1:num_of_epoch
    for idx_mini_batch = 1:mini_batch_num
        mini_batch_start_idx = mini_batch_size*(idx_mini_batch-1)+1;
        mini_batch_end_idx = min(m,mini_batch_size*idx_mini_batch);
        mini_batch_x = x_sample(mini_batch_start_idx:mini_batch_end_idx);
        mini_batch_y = y_sample(mini_batch_start_idx:mini_batch_end_idx);
        % gradient
        ahat_gradient = 0;
        bhat_gradient = 0;
        for idx_gradient = 1:mini_batch_end_idx-mini_batch_start_idx+1
            ahat_gradient = ahat_gradient + (ahat*mini_batch_x(idx_gradient)+bhat-mini_batch_y(idx_gradient))*mini_batch_x(idx_gradient);
            bhat_gradient = bhat_gradient + (ahat*mini_batch_x(idx_gradient)+bhat-mini_batch_y(idx_gradient));
        end
        ahat = ahat - learning_rate*ahat_gradient;
        bhat = bhat - learning_rate*bhat_gradient;
    end
    % audit
    audit_ahat(idx) = ahat;
    audit_bhat(idx) = bhat;
    for idx_audit = 1:m
        audit_j(idx) = audit_j(idx) + 0.5*(ahat*x_sample(idx_audit)+bhat-y_sample(idx_audit))^2;
    end
end

figure
hold on;
plot(x_sample, y_sample, 'rx')
plot(x_sample,ahat*x_sample+bhat, 'b-')
grid on
xlabel('$x$', 'Interpreter', 'latex')
ylabel('$y$', 'Interpreter', 'latex')
hold off

figure
hold on
plot(1:num_of_epoch,audit_j)
grid on
xlabel('Training Epoch', 'Interpreter', 'latex')
ylabel('$J$', 'Interpreter', 'latex')
hold off