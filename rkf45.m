function y=rkf45(h,t,x,u,f)
%h��ʱ�䲽��
%t����ǰʱ��
%x����ǰ״̬
%u��������
%f������ѧ΢�ַ��̵ĺ�������


K1=feval(f,t,x,u);
K2=feval(f,t+h/2,x+h/2*K1,u);
K3=feval(f,t+h/2,x+h/2*K2,u);
K4=feval(f,t+h,x+h*K3,u);
y=x+h/6*(K1+2*K2+2*K3+K4);
