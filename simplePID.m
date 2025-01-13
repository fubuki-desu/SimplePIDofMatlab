clear 
clc
% -------------------------- 以放水漏水为例 -------------------------------- 
h0=0;
H=5;
error=H-h0;
sumError=0;
error0=0;
dt=0.1;
T=1000;
t=linspace(0,T-1,T);
h=zeros(1,length(t));
Kp=0.5;
Ki=0.02;
Kd=0.02;
hleak=0.1;
for i = 2:length(h)
%     tt=t(i);
    sumError=sumError+error;
    error=H-h(i-1);
    derror=error-error0;
    h(i)=h(i-1)+Kp*error-hleak*dt+Ki*sumError*dt+Kd*derror/dt;
    error0=error;
end
figure
plot(t,h)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       只需要PI即可使之收敛于目标值       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%