A0=[(cos(wc)*cos(Wc)-sin(wc)*cos(ic)*sin(Wc)),(cos(wc)*sin(Wc)+sin(wc)*cos(ic)*cos(Wc)),sin(wc)*sin(ic);
    (-sin(wc)*cos(Wc)-cos(wc)*cos(ic)*sin(Wc)),(-sin(wc)*sin(Wc)+cos(wc)*cos(ic)*cos(Wc)),cos(wc)*sin(ic);
    -sin(ic)*sin(Wc),-sin(Wc),cos(ic);];
B0=A0.';%坐标转换矩阵

Wb=cross([xc0;yc0;zc0],[vxc0;vyc0;vzc0])/a^2;
WbM=[0,-Wb(3,:),Wb(2,:);Wb(3,:),0,-Wb(1,:);-Wb(2,:),Wb(1,:),0];
Xd10=[xd10;yd10;zd10];VXd10=[vxd10;vyd10;vzd10];
Xd20=[xd20;yd20;zd20];VXd20=[vxd20;vyd20;vzd20];
Xd30=[xd30;yd30;zd30];VXd30=[vxd30;vyd30;vzd30];
Xd1e0=[xc0;yc0;zc0]+B0*Xd10;
Xd2e0=[xc0;yc0;zc0]+B0*Xd20;
Xd3e0=[xc0;yc0;zc0]+B0*Xd30;
VXd1e0=[vxc0;vyc0;vzc0]+B0*VXd10+WbM*B0*VXd10+WbM*B0*[vxc0;vyc0;vzc0];
VXd2e0=[vxc0;vyc0;vzc0]+B0*VXd20+WbM*B0*VXd20+WbM*B0*[vxc0;vyc0;vzc0];
VXd3e0=[vxc0;vyc0;vzc0]+B0*VXd30+WbM*B0*VXd30+WbM*B0*[vxc0;vyc0;vzc0];
rd1e=norm(Xd1e0);
rd2e=norm(Xd2e0);
rd3e=norm(Xd3e0);
vd1e=norm(VXd1e0);
vd2e=norm(VXd2e0);
vd3e=norm(VXd3e0);%三颗星在惯性系下的初始状态量

H10=cross(Xd1e0,cross(cross(Xd1e0,VXd1e0),Xd1e0))/rd1e^2;
H20=cross(Xd2e0,cross(cross(Xd2e0,VXd2e0),Xd2e0))/rd2e^2;
H30=cross(Xd3e0,cross(cross(Xd3e0,VXd3e0),Xd3e0))/rd3e^2;%三颗星的初始角动量

h10=norm(H10);
h20=norm(H20);
h30=norm(H30);
Vr1=dot(Xd1e0,VXd1e0)/rd1e;
Vr2=dot(Xd2e0,VXd2e0)/rd2e;
Vr3=dot(Xd3e0,VXd3e0)/rd3e;
Vt1=h10/rd1e;
Vt2=h20/rd2e;
Vt3=h30/rd3e;
W1=H10(1,:)^2+H10(2,:)^2;
W2=H20(1,:)^2+H20(2,:)^2;
W3=H30(1,:)^2+H30(2,:)^2;%参量设置  
      
id1=atan(sqrt(W1)/H10(3,:));
id2=atan(sqrt(W2)/H20(3,:));
id3=atan(sqrt(W3)/H30(3,:));%求解轨道倾角

Wd1=atan(H10(1,:)/(-H10(2,:)));
Wd2=atan(H20(1,:)/(-H20(2,:)));
Wd3=atan(H30(1,:)/(-H30(2,:)));%求解升交点赤径

ud1=atan(Xd1e0(3,:)*h10/(H10(1,:)*Xd1e0(2,:)-H10(2,:)*Xd1e0(1,:)));
ud2=atan(Xd1e0(3,:)*h20/(H20(1,:)*Xd2e0(2,:)-H20(2,:)*Xd2e0(1,:)));
ud3=atan(Xd1e0(3,:)*h30/(H30(1,:)*Xd3e0(2,:)-H30(2,:)*Xd3e0(1,:)));%求解维度幅角

a01=2*u/rd1e-vd1e^2;
a02=2*u/rd2e-vd2e^2;
a03=2*u/rd3e-vd3e^2;
a1=u/a01;
a2=u/a02;
a3=u/a03;
%求解半长轴

e1=sqrt((1-rd1e/a1)^2+(rd1e*Vr1/sqrt(u*a1))^2);
e2=sqrt((1-rd2e/a2)^2+(rd2e*Vr2/sqrt(u*a2))^2);
e3=sqrt((1-rd3e/a3)^2+(rd3e*Vr3/sqrt(u*a3))^2);%求解偏心率

fd1=atan(h10*(1-rd1e/a1)*sqrt(sqrt(a01^2))/((rd1e*Vr1/sqrt(u*a1))-e1));
fd2=atan(h20*(1-rd2e/a2)*sqrt(sqrt(a02^2))/((rd2e*Vr2/sqrt(u*a2))-e2));
fd3=atan(h30*(1-rd3e/a1)*sqrt(sqrt(a03^2))/((rd3e*Vr3/sqrt(u*a3))-e3));%求解真近点角%youwenti

wd1=ud1-fd1;
wd2=ud2-fd2;
wd3=ud3-fd3;%求解近地点幅角

Q1=[a1,e1,Wd1,wd1,id1,fd1];
Q2=[a2,e2,Wd2,wd2,id2,fd2];
Q3=[a3,e3,Wd3,wd3,id3,fd3];%轨道根数



