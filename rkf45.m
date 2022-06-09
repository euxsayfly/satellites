function y=rkf45(h,t,x,u,f)
%h：时间步长
%t：当前时间
%x：当前状态
%u：控制力
%f：动力学微分方程的函数名称


K1=feval(f,t,x,u);
K2=feval(f,t+h/2,x+h/2*K1,u);
K3=feval(f,t+h/2,x+h/2*K2,u);
K4=feval(f,t+h,x+h*K3,u);
y=x+h/6*(K1+2*K2+2*K3+K4);
