 clc;clear;
%[xe,ye,ze]=sphere();surf(6371000*xe,6371000*ye,6371000*ze);%绘制地球
a=42378137;
u=3.986005e+14;
n=sqrt(u/a^3);T=2*pi/n;
t=0:T;
a=42378137;e=0;wc=pi/6;Wc=pi/3;ic=pi/4;fc=n*t;%主星轨道根数
uc=wc+fc;%近地点幅角加真近地点角

hc=sqrt(2*a*u);Vrc=0;Vtc=hc/a;


% vxc=(Vrc.*cos(uc)-Vtc.*sin(uc))*cos(Wc)-(Vrc.*sin(uc)+Vtc.*cos(uc))*sin(Wc)*sin(ic);
% vyc=(Vrc.*cos(uc)-Vtc.*sin(uc))*sin(Wc)+(Vrc.*sin(uc)+Vtc.*cos(uc))*cos(Wc)*sin(ic);
% vzc=(Vrc.*sin(uc)+Vtc.*cos(uc))*sin(ic);
vxc=sqrt(u/a).*(-cos(Wc).*sin(uc)-sin(Wc).*cos(ic).*cos(uc));
vyc=sqrt(u/a).*(cos(Wc).*cos(ic).*cos(uc)-sin(Wc).*sin(uc));
vzc=sqrt(u/a).*(sin(ic).*cos(uc));
xc=a.*(cos(Wc).*cos(uc)-sin(Wc).*sin(uc).*cos(ic));
yc=a.*(sin(Wc).*cos(uc)+cos(Wc).*sin(uc).*cos(ic));
zc=a.*sin(uc).*sin(ic);


xc0=xc(1);
yc0=yc(1);
zc0=zc(1);
vxc0=vxc(1);
vyc0=vyc(1);
vzc0=vzc(1);
 
r=100000/sqrt(3);

xd10=0;
vxd10=n*r/2;
yd10=2/n*vxd10;
vyd10=-2*n*xd10;
zd10=sqrt(3)*xd10;
vzd10=sqrt(3)*vxd10; %第一颗星在参考坐标系下的初始位置，初始相角为零

xd20=sqrt(3)/4*r;
vxd20=-n/sqrt(3)*xd20;
yd20=2/n*vxd20;  
vyd20=-2*n*xd20;
zd20=sqrt(3)*xd20;
vzd20=sqrt(3)*vxd20;%第二颗星在参考坐标系下的初始位置，初始相角为120°

xd30=-sqrt(3)/4*r;
vxd30=-n/sqrt(3)*xd20;
yd30=2/n*vxd30;
vyd30=-2*n*xd30;
zd30=sqrt(3)*xd30;
vzd30=sqrt(3)*vxd30;%第三颗星在参考坐标系下的初始位置，初始相角为-120°

xd1=r/2*sin(n*t);               vxd1=n*r/2*cos(n*t);
yd1=r*cos(n*t);                 vyd1=-n*r*sin(n*t); 
zd1=r*sqrt(3)/2*sin(n*t);       vzd1=n*r*sqrt(3)/2*cos(n*t);    
%参考坐标系下第一颗星的状态量
xd2=r/2*sin(n*t+2/5*pi);               vxd2=n*r/2*cos(n*t+2/3*pi);
yd2=r*cos(n*t+2/5*pi);                 vyd2=-n*r*sin(n*t+2/3*pi); 
zd2=r*sqrt(3)/2*sin(n*t+2/5*pi);       vzd2=n*r*sqrt(3)/2*cos(n*t+2/3*pi);
%参考坐标系下第二颗星的状态量
xd3=r/2*sin(n*t+4/5*pi);               vxd3=n*r/2*cos(n*t-2/3*pi);
yd3=r*cos(n*t+4/5*pi);                 vyd3=-n*r*sin(n*t-2/3*pi); 
zd3=r*sqrt(3)/2*sin(n*t+4/5*pi);       vzd3=n*r*sqrt(3)/2*cos(n*t-2/3*pi);

xd4=r/2*sin(n*t+6/5*pi);               
yd4=r*cos(n*t+6/5*pi);                 
zd4=r*sqrt(3)/2*sin(n*t+6/5*pi);    


xd5=r/2*sin(n*t+8/5*pi);               
yd5=r*cos(n*t+8/5*pi);                 
zd5=r*sqrt(3)/2*sin(n*t+8/5*pi); 