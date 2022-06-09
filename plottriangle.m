
clc;
clf;
%白色背景
figure(1)
axis([-60000,60000,-60000,60000,-60000,60000]);
% xlabel('参考系X轴');
% ylabel('参考系Y轴');
% zlabel('参考系z轴');
%四周的边框
box on;
%循环绘图
for i=1:500:T
    cla;
    hold on;
    plot3(xd1,yd1,zd1)
     plot3(xd1(i),yd1(i),zd1(i),'o');
     plot3(xd2(i),yd2(i),zd2(i),'o');
     plot3(xd3(i),yd3(i),zd3(i),'o');
    line([xd1(i),xd2(i)],[yd1(i),yd2(i)],[zd1(i),zd2(i)]);
    line([xd1(i),xd3(i)],[yd1(i),yd3(i)],[zd1(i),zd3(i)]);
    line([xd3(i),xd2(i)],[yd3(i),yd2(i)],[zd3(i),zd2(i)]);
    frame=getframe(gcf);
    imind=frame2im(frame);
    [imind,cm] = rgb2ind(imind,256);
    if i==1
         imwrite(imind,cm,'test1.gif','gif', 'Loopcount',inf,'DelayTime',1e-4);
    else
         imwrite(imind,cm,'test1.gif','gif','WriteMode','append','DelayTime',1e-4);
    end
end
