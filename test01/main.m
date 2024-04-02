%% 信号实验仿真1
%(1)已知描述某连续系统的微分方程为2y"(t)+y'＋8y(t)= f(t)。试用MATLAB绘出该系统的冲激响应和阶跃响应的波形。
%冲激响应与阶跃响应
b=[1];
a=[2 1 8];
subplot 121
impulse(b,a)
subplot 122
step(b,a)

%% 信号实验仿真2
%描述某连续系统的微分方程为y"(t)+2y'(t)+y(t) =f'(t)+2f(t).当输如信号为f(t)=5e-2t*E(t)时,该系统的零状态响应y(t).
%LTI连续系统的响应实现程序
a=[1 2 1];
b=[1 2];
p=0.01;
t = 0:p:5
f=5 * exp(-2 * t);
lsim(b,a,f,t);
ylabel('y(t)')


%% test
% 单位冲激响应 h(t)
t = linspace(0, 4*pi, 1000); % 范围为从0到4π，1000个数据点
h = sin(t); % 填入单位冲激响应的表达式或向量

% 激励信号 x(t)
x = zeros(size(t)); % 初始化 x 为与 t 相同大小的零向量
x(t>=0 & t<= 2*pi) = t(t>=0 & t<= 2*pi); % 填入激励信号的表达式或向量
x(t>=2*pi & t<= 4*pi) = 4*pi - t(t>=2*pi & t<= 4*pi); 

% 零输入响应 y(t)
y = conv(x, h, 'same');

% 绘制图形
figure;
subplot(3,1,1);
plot(t, h);
xlabel('时间');
ylabel('幅值');
title('单位冲激响应');

subplot(3,1,2);
plot(t, x);
xlabel('时间');
ylabel('幅值');
title('激励信号');

subplot(3,1,3);
plot(t, y);
xlabel('时间');
ylabel('幅值');
title('零输入响应');