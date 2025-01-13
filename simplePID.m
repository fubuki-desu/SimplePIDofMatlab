clear 
clc
% -------------------------- 以放水漏水为例 -------------------------------- 
h0=0;
H=5;
error=H-h0;% 初始差值
sumError=0; % 积分
error0=0; % 前一个差值
dt=0.1; % 时间间隔
T=1000; % 总时间
t=linspace(0,T-1,T); % 时间轴
h=zeros(1,length(t)); % 位置/水位
Kp=0.5;
Ki=0.02;
Kd=0.02;
hleak=0.1;    % 漏水/s
for i = 2:length(h)
%     tt=t(i);
    sumError=sumError+error;    %积分
    error=H-h(i-1); % 目标水位-当前水位
    derror=error-error0; % 差值微分
    h(i)=h(i-1)+Kp*error-hleak*dt+Ki*sumError*dt+Kd*derror/dt; % 当前水位
    error0=error; % 赋值
end
figure
plot(t,h)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       只需要PI即可使之收敛于目标值       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
