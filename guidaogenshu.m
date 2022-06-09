A0=[(cos(wc)*cos(Wc)-sin(wc)*cos(ic)*sin(Wc)),(cos(wc)*sin(Wc)+sin(wc)*cos(ic)*cos(Wc)),sin(wc)*sin(ic);
    (-sin(wc)*cos(Wc)-cos(wc)*cos(ic)*sin(Wc)),(-sin(wc)*sin(Wc)+cos(wc)*cos(ic)*cos(Wc)),cos(wc)*sin(ic);
    sin(ic)*sin(Wc),-sin(Wc),cos(ic);];
B0=A0.';%坐标转换矩阵

Wb=cross([xc0;yc0;zc0],[vxc0;vyc0;vzc0])/a^2;
WbM=[0,-Wb(3,:),Wb(2,:);Wb(3,:),0,-Wb(1,:);-Wb(2,:),Wb(1,:),0];
Xd10=[xd10;yd10;zd10];VXd10=[vxd10;vyd10;vzd10];
Xd20=[xd20;yd20;zd20];VXd20=[vxd20;vyd20;vzd20];
Xd30=[xd30;yd30;zd30];VXd30=[vxd30;vyd30;vzd30];
Xd1e0=[xc0;yc0;zc0]+B0*Xd10;
Xd2e0=[xc0;yc0;zc0]+B0*Xd20;
Xd3e0=[xc0;yc0;zc0]+B0*Xd30;
VXd1e0=[vxc0;vyc0;vzc0]+B0*VXd10+WbM*B0*Xd10;
VXd2e0=[vxc0;vyc0;vzc0]+B0*VXd20+WbM*B0*Xd20;
VXd3e0=[vxc0;vyc0;vzc0]+B0*VXd30+WbM*B0*Xd30;
rd1e0=norm(Xd1e0);
vd1e0=norm(VXd1e0);
vr1=dot(Xd1e0,VXd1e0)/rd1e0;
H1=cross(Xd1e0,VXd1e0);
h1=norm(H1);

id1=acos(H1(3,:)/h1)*360/(2*pi);%轨道倾角

N1=cross([0;0;1],H1);
n1=norm(N1);
if N1(2,:)>=0
    Wd1=acos(N1(1,:)/n1)*360/(2*pi);
else
    Wd1=360-acos(N1(1,:)/n1)*360/(2*pi);
end                                         %升交点赤径

Ed1=((vd1e0^2-u/rd1e0)*Xd1e0-rd1e0*vr1*VXd1e0)/u;
% ed1=sqrt((2*u-rd1e0*vd1e0^2)*rd1e0*vr1+(u-rd1e0*vd1e0^2)^2)/u;%偏心率
% ed1=norm(Ed1);
ed1=sqrt(1+h1^2/(u^2)*(vd1e0^2-2*u/rd1e0));

if Ed1(3,:)>=0
    wd1=acos(dot(N1,Ed1)/(n1*ed1))*360/(2*pi);
else
    wd1=360-acos(dot(N1,Ed1)/(n1*ed1))*360/(2*pi);
end                                          %轨道幅角

if vr1>=0
    fd1=acos((h1^2/(u*r)-1)/ed1)*360/(2*pi);
else
     fd1=360-acos((h1^2/(u*r)-1)/ed1)*360/(2*pi);
end                                        %真近点角

Q1=[h1,id1,Wd1,ed1,wd1,fd1];    