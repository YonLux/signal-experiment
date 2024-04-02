%%
%(1）周期信号的傅里叶级数MATLAB实现利用MATLAB画出图3.33所示的周期三角波信号的频谱。
%三角形脉冲信号的傅里叶级数的实现
N = 10;
n1=-N:-1;
c1= -4* j * sin(n1 * pi/2)/pi^2./n1.^2; %计算n= -N到-1时的傅里叶级数系数
c0=0;  %计算n=0时的傅里叶级数系数
n2=1:N;c2=-4*j*sin(n2*pi/2)/pi^2./n2.^2; %计算n=1到N时的傅里叶级数系数

cn =[c1 c0 c2];n=-N:N;
subplot 211;stem(n,abs(cn));ylabel('Cn的幅度');
subplot 212;stem(n,angle(cn));ylabel('Cn的相位');
xlabel( '0_0')
%%
% 创建Simulink模型
close_system('SquareWaveHarmonic', 0);
model = 'SquareWaveHarmonic';
new_system(model);

% 添加Discrete模块
add_block('simulink/Discrete/Discrete', [model '/Discrete']);

% 设置Discrete模块参数
set_param([model '/Discrete'], 'SampleTime', '1');
set_param([model '/Discrete'], 'DiscreteStateSpace', 'on');
set_param([model '/Discrete'], 'InitialState', '1');
set_param([model '/Discrete'], 'ExtMode', 'off');
set_param([model '/Discrete'], 'StateName', 'x');
set_param([model '/Discrete'], 'StateType', 'scalar');

% 添加Scope模块
add_block('simulink/Sinks/Scope', [model '/Scope']);

% 连接模块
add_line(model, 'Discrete/1', 'Scope/1');

% 设置Scope模块参数
set_param([model '/Scope'], 'TimeSpan', '10');
set_param([model '/Scope'], 'SampleTime', '0.1');

% 运行模型
sim(model);

% 从Scope模块获取波形数据
data = get(scope, 'yout');

% 绘制波形图
figure;
plot(data.time, data.signals.values);
xlabel('Time');
ylabel('Amplitude');
title('Square Wave with 1st Harmonic');
