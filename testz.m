clc;
clf;
%��ɫ����
figure(1)
axis([-60000,60000,-60000,60000,-60000,60000]);
% xlabel('�ο�ϵX��');
% ylabel('�ο�ϵY��');
% zlabel('�ο�ϵz��');
%���ܵı߿�
box on;
%ѭ����ͼ
for i=1:500:T
    cla;
    hold on;
    plot3(xd1,yd1,zd1)
     plot3(xd1(i),yd1(i),zd1(i),'o');
     plot3(xd2(i),yd2(i),zd2(i),'o');
     plot3(xd3(i),yd3(i),zd3(i),'o');
     plot3(xd4(i),yd4(i),zd4(i),'o');
      plot3(xd5(i),yd5(i),zd5(i),'o');
    line([xd1(i),xd2(i)],[yd1(i),yd2(i)],[zd1(i),zd2(i)]);
    line([xd4(i),xd3(i)],[yd4(i),yd3(i)],[zd4(i),zd3(i)]);
 line([xd3(i),xd2(i)],[yd3(i),yd2(i)],[zd3(i),zd2(i)]);
 line([xd4(i),xd5(i)],[yd4(i),yd5(i)],[zd4(i),zd5(i)]);
 line([xd1(i),xd5(i)],[yd1(i),yd5(i)],[zd1(i),zd5(i)]);
end
