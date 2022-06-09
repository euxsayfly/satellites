clc;
clf;
%白色背景
figure(1)
axis([-100000,100000,-100000,100000,-100000,100000]);
xlabel('参考系X轴');
ylabel('参考系Y轴');
zlabel('参考系z轴');
%四周的边框
box on;
%循环绘图
for i=1:45
    cla;
    hold on;
  
    plot3(Y1(i,1),Y1(i,2),Y1(i,3),'o');
    plot3(Y2(i,1),Y2(i,2),Y2(i,3),'o');
    plot3(Y3(i,1),Y3(i,2),Y3(i,3),'o');
    line([Y1(i,1),Y2(i,1)],[Y1(i,2),Y2(i,2)],[Y1(i,3),Y2(i,3)]);
    line([Y1(i,1),Y3(i,1)],[Y1(i,2),Y3(i,2)],[Y1(i,3),Y3(i,3)]);
    line([Y3(i,1),Y2(i,1)],[Y3(i,2),Y2(i,2)],[Y3(i,3),Y2(i,3)]);
    frame=getframe(gcf);
    imind=frame2im(frame);
    [imind,cm] = rgb2ind(imind,256);
    if i==1
         imwrite(imind,cm,'test1.gif','gif', 'Loopcount',inf,'DelayTime',1e-4);
    else
         imwrite(imind,cm,'test1.gif','gif','WriteMode','append','DelayTime',1e-4);
    end
end