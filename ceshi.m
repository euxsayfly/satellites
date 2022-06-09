
X0=[xc0;yc0;zc0];
VX0=[vxc0;vyc0;vzc0];%初始主星状态
r0=norm(X0);
v0=norm(VX0);
vr0=dot(X0,VX0)/r0;
H0=cross(X0,VX0);
h0=norm(H0);

id1=acos(H0(3,:)/h0)*360/(2*pi);%轨道倾角

N1=cross([0;0;1],H0);
n1=norm(N1);
if N1(2,:)>=0
    W0=acos(N1(1,:)/n1)*360/(2*pi);
else
    W0=360-acos(N1(1,:)/n1)*360/(2*pi);
end                                         %升交点赤径

E0=((v0^2-u/r0)*X0-r0*vr0*VX0)/u;
e0=sqrt((2*u-r0*v0^2)*r0*vr0+(u-r0*v0^2)^2)/u;%偏心率
e0=norm(E0);
if E0(3,:)>=0
    w0=acos(dot(N1,E0)/(n1*e0))*360/(2*pi);
else
    w0=360-acos(dot(N1,E0)/(n1*e0))*360/(2*pi);
end                                          %轨道幅角

if vr0>=0
    f0=acos((h0^2/(u*r)-1)/e0)*360/(2*pi);
else
     f0=360-acos((h0^2/(u*r)-1)/e0)*360/(2*pi);
end                                        %真近点角

Q1=[h0,id1,W0,e0,w0,f0]; 
a0=h0^2/(2*u);