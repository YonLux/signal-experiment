%%  第一个题
A=1;
T=2;
tao=1;
t=-2:0.001:2;
X0=A*tao/T;
w0=2*pi/T;
X=X0*ones(1,length(t));
%三次谐波
for k=1:1:3
X=X+2*X0*sinc(k*w0*tao/2/pi) *cos (k*w0*t);
end
subplot(2,2,1);
plot (t,X)
xlabel('三次谐波')
%五
for k=1:1:5
X=X+2*X0*sinc(k*w0*tao/2/pi) *cos (k*w0*t);
end
subplot(2,2,2);
plot (t,X)
xlabel('五次谐波')
%32次
for k=1:1:31
X=X+2*X0*sinc(k*w0*tao/2/pi) *cos (k*w0*t);
end
subplot(2,2,3);
plot (t,X)
xlabel('31次谐波')