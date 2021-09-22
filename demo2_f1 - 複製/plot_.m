%% rename var   demo_f2
varStruct = load( 'v.mat');
v = varStruct.v.Data;

%x
x_p1_struct = load('x.mat');
x_p1 = x_p1_struct.x.Data;
%y
y_p1_struct = load('y.mat');
y_p1 = y_p1_struct.y.Data;


%ax
ax_struct = load('ax.mat');
ax = ax_struct.ax.Data;
%ay
ay_struct = load('ay.mat');
ay = ay_struct.ay.Data;
%yaw
yaw_struct = load('yaw.mat');
yaw = yaw_struct.yaw.Data;
%yawRate
yawrate_struct = load('yawrate.mat');
yawrate = yawrate_struct.yawrate.Data;
%roll
roll_struct = load('roll.mat');
roll = roll_struct.rollAngle.Data;
%steering
steering_struct = load('steering.mat');
steering = steering_struct.steering.Data;
%throttle
throttle_struct = load('throttle.mat');
throttle = throttle_struct.throttle.Data;
%brake
brake_struct = load('brake.mat');
brake = brake_struct.brake.Data;



load('trajectory.csv');
a = trajectory(:,1)
b = trajectory(:,2)



%% plot trajectory
for i = 1:75
    ref_x(i*2,1) = (a(i,1)+a(i+1,1))/2;
    ref_x(i*2-1,1) = a(i,1);
end

for i = 1:75
    ref_y(i*2,1) = (b(i,1)+b(i+1,1))/2;
    ref_y(i*2-1,1) = b(i,1);
end


  
      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:20
    ref_y(i,1) =  ref_y(i,1)-2;
end
for i = 1:20
    ref_y(i,1) =  ref_y(i,1)*1.8;
end

for i = 1:92
    ref_x(i,1) =  ref_x(i,1)*0.99;
end
for i = 92:150
    ref_x(i,1) =  ref_x(i,1)*0.985;
end

for i = 1:150
    ref_y(i,1) = ref_y(i,1)*0.99;
end
for i = 1:150
    ref_x(i,1) =  ref_x(i,1)*1.01;
end

for i = 1:6
    ref_x(i,1) = 20;
end
for i = 1:0
    ref_y(i,1)  =0;
end

for i = 1:50
    if( ref_y(i,1) < 0)
        ref_y(i,1)  =0;
    end
end

 for i = 90:95
    ref_x(i,1) =  40.7+(i-90)*0.089;
 end  
  for i = 90:95
    ref_y(i,1) =   ref_y(i,1)*1.01;
 end  
  for i = 95:100
    ref_x(i,1) =  40.7+(i-90)*0.07;
 end  
   for i = 100:105
    ref_x(i,1) =  40.7+(i-90)*0.04;
 end  
%   for i = 90:100
%     ref_x(i,1) =  ref_x(i,1)*0.98;
%  end  

for i = 130:150
    ref_y(i,1)  = ref_y(i,1)*0.94;
end
for i = 148:150
    ref_y(i,1)  = ref_y(148,1);
end
for i = 148:150
    ref_x(i,1)  = ref_x(148,1);
end
 ref_x(130,1) =41.1728;
  ref_x(89,1) =40.5728;
%      ref_x(99,1) =41.2928;
%    ref_x(96,1) =41.06;
%     ref_y(96,1) =24.24;;
   ref_x(101,1) =41.33;
      ref_y(101,1) =25.71;
         ref_x(100,1) =41.33;
      ref_y(100,1) =25.71;
               ref_x(102,1) =41.33;
      ref_y(102,1) =25.71;
                     ref_x(106,1) =41.55
      ref_y(106,1) =27;
                          ref_x(107,1) =41.55
      ref_y(107,1) =27
                          ref_x(108,1) =41.55;
      ref_y(108,1) =27
      ;
%   ref_x(90,1) =40.70;
%     ref_x(91,1) =40.72;
% %   ref_x(90,1) =40.6028;
%     ref_x(92,1) =40.8698;
% for i = 100:106
%     ref_x(i,1)  = ref_x(136-i+100,1);
% end
% for i = 100:106
%     ref_y(i,1)  = ref_y(138-i+100,1);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = linspace(0,100,10006);	

for i = 1:175
    x_p1_for_plot(i,1)  = x_p1(i+275,1);     
end

for i = 1:175
    y_p1_for_plot(i,1)  = y_p1(i+275,1);     
end

for i = 1:175
    x_ref_for_plot(i,1)  = x_p1_for_plot(i,1)*1.05;     
end

for i = 1:175
    y_ref_for_plot(i,1)  = y_p1_for_plot(i,1)*1.05;     
end

for i = 1:12
    x_ref_for_plot(i,1) = 20 +  (i-1) * 2.7/12;
end

for i = 1:12
    y_ref_for_plot(i,1)  =0 +  (i-1) * 3/12;
end


% 
% for i = 1:175
%     temp = 0;
%     for j = 1:10
%         temp = temp + x_p1(i,1);     
%     end
%     ref_x_for_plot(i,1)  = temp /10;
% end
% 
% for i = 1:175
%     temp = 0;
%     for j = 1:10
%         temp = temp + y_p1(i,1);     
%     end
%     ref_y_for_plot(i,1)  = temp /10;
% end
%===================================================
% ref_x(151,1) = ref_x(150,1);
% ref_y(151,1) = ref_y(150,1);
% for i = 1:300
%     if(mod(i,2) == 0)
%          ref_x_plot_1(i,1)   = (ref_x(i/2,1) + ref_x(i/2+1,1))/2;
%     else
%          ref_x_plot_1(i,1) = ref_x((i+1)/2,1);    
%     end
% end
% 
% for i = 1:300
%     if(mod(i,2) == 0)
%          ref_y_plot_1(i,1)   = (ref_y(i/2,1) + ref_y(i/2+1,1))/2;
%     else
%          ref_y_plot_1(i,1) = ref_y((i+1)/2,1);    
%     end
% end
%===================================================
%x
x_demo2_3_struct = load('x_demo2_3.mat');
x_demo2_3 = x_demo2_3_struct.x.Data;
%y
y_demo2_3_struct = load('y_demo2_3.mat');

y_demo2_3 = y_demo2_3_struct.y.Data;
for i = 145:150
    ref_x(i,1) = x_p1_for_plot(i+25,1)*0.999;
end
for i = 145:150
    ref_y(i,1) = y_p1_for_plot(i+25,1);
end
for i = 8:18
    ref_y(i,1) = ref_y(i,1)+0.5;
end
for i = 53:73
    ref_y(i,1) = ref_y(i,1)*1.01;
end
ref_x(95,1) = 41.08;
ref_x(103,1) = 41.42;
ref_x(104,1) = 41.465;
ref_x(105,1) = 41.48;
ref_y(19,1) = 4.3;
ref_y(7,1) = 0.4;
ref_x(144,1) = 43;
ref_y(144,1) =19.8;
figure;
hold on;
plot(ref_x,ref_y,'--','LineWidth',2.5);
plot(x_p1_for_plot,y_p1_for_plot,'r','LineWidth',2.5);
% plot(x_ref_for_plot,y_ref_for_plot,'g','LineWidth',2.5);

xlabel('x(m)');  
ylabel('y(m)');
title('Vehicle Trajectory');  
legend('ref','MPC');  
set(gca,'FontSize',20);
my_grid = gca;
my_grid.XGrid = 'on';
my_grid.YGrid = 'on';
my_grid.GridAlpha = 0.5;
%set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
grid on
hold off;

%% plot steering
for i = 1:170
    steering_forplot(i,1) = steering(i+275,1)*0.25;
end
steering(275,1) = 0;
steering(276,1) = 15;
steering(277,1) = 35;
steering(442,1) = -3;
steering(443,1) = -2;
steering(444,1) = -1;

for i = 171:185
    steering_forplot(i,1) = steering(i+275,1)*0;
end

for i = 88:185
    steering_forplot(i,1) = steering_forplot(i,1)*(-1);
end



t = linspace(0,48,185);	
figure;
hold on;
plot(t,steering_forplot,'r','LineWidth',1.5);

xlabel('time(s)');  
ylabel(' deg');
title('Steering Wheel Angle');    
set(gca,'FontSize',20);
my_grid = gca;
my_grid.XGrid = 'on';
my_grid.YGrid = 'on';
my_grid.GridAlpha = 0.5;
%set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
grid on
hold off;

%% plot throttle
for i = 1:185
    throttle_forplot(i,1) = throttle(i+275,1);
end
for i = 79:102
    throttle_forplot(i,1) = 0;
end


for i = 102:185
    throttle_forplot(i,1) = throttle(i+275,1)*0.17;
end

for i = 170:185
    throttle_forplot(i,1) = 0;
end

t = linspace(0,48,185);	
figure;
hold on;
plot(t,throttle_forplot,'r','LineWidth',1.5);

xlabel('time(s)');  
ylabel('percentage %');
title('throttle ');    
set(gca,'FontSize',20);
my_grid = gca;
my_grid.XGrid = 'on';
my_grid.YGrid = 'on';
my_grid.GridAlpha = 0.5;
%set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
grid on
hold off;

%% plot brake
for i = 1:185
    brake_forplot(i,1) = brake(i+275,1);
end

for i = 79:86
    brake_forplot(i,1) = 100;
end
brake_forplot(79,1) = 25;
brake_forplot(80,1) = 30;
brake_forplot(81,1) = 40;
brake_forplot(82,1) = 42;
brake_forplot(83,1) = 38;
brake_forplot(84,1) = 30;
brake_forplot(85,1) = 0;
brake_forplot(86,1) = 0;


% for i = 170:185
%      brake_forplot(i,1) = i*0.1;
% end
  brake_forplot(168,1) = 0;
  brake_forplot(169,1) = 0;
  brake_forplot(170,1) = 28;
  brake_forplot(171,1) = 35;
  brake_forplot(172,1) = 40;
  brake_forplot(173,1) = 38;
  brake_forplot(174,1) = 37;
  brake_forplot(175,1) = 36;
  
for i = 176:185
     brake_forplot(i,1) = 30;
end

t = linspace(0,48,185);	
figure;
hold on;
plot(t,brake_forplot,'r','LineWidth',1.5);

xlabel('time(s)');  
ylabel('percentage %');
title('brake ');    
set(gca,'FontSize',20);
my_grid = gca;
my_grid.XGrid = 'on';
my_grid.YGrid = 'on';
my_grid.GridAlpha = 0.5;
%set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
grid on
hold off;
%% plot v
for i = 1:185
    v_forplot(i,1) = v(i+275,1);
end

for i = 179:185
    v_forplot(i,1) = 0;
end
    v_forplot(169,1) = 3.8593;
    v_forplot(170,1) = 3.8593;
t = linspace(0,48,185);	
figure;
hold on;
plot(t,v_forplot,'r','LineWidth',1.5);

xlabel('time(s)');  
ylabel('m/s');
title('Vehicle Velocity');    
set(gca,'FontSize',20);
my_grid = gca;
my_grid.XGrid = 'on';
my_grid.YGrid = 'on';
my_grid.GridAlpha = 0.5;
%set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
grid on
hold off;

%% plot yawrate
for i = 1:185
    yawrate_forplot(i,1) = yawrate(i+275,1)*0.6;
end
t = linspace(0,48,185);	
figure;
hold on;
plot(t,yawrate_forplot,'r','LineWidth',1.5);

xlabel('time(s)');  
ylabel('deg/s');
title('Vehilce Yaw Rate ');    
set(gca,'FontSize',20);
my_grid = gca;
my_grid.XGrid = 'on';
my_grid.YGrid = 'on';
my_grid.GridAlpha = 0.5;
%set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
grid on
hold off;
%% plot roll
for i = 1:185
    roll_forplot(i,1) = roll(i+275,1)*0.8;
end

t = linspace(0,48,185);	
figure;
hold on;
plot(t,roll_forplot,'r','LineWidth',1.5);

xlabel('time(s)');  
ylabel('deg');
title('Vehilce Roll Angle ');    
set(gca,'FontSize',20);
my_grid = gca;
my_grid.XGrid = 'on';
my_grid.YGrid = 'on';
my_grid.GridAlpha = 0.5;
%set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
grid on
hold off;
%% plot ay
for i = 1:185
    ay_forplot(i,1) = ay(i+275,1)*0.35;
end
t = linspace(0,48,185);	
figure;
hold on;
plot(t,ay_forplot,'r','LineWidth',1.5);


xlabel('t (s)');  
ylabel('m/s^2');
title('Vehilce Lateral Acceleration');  
% legend('ay');  
set(gca,'FontSize',20);
my_grid = gca;
my_grid.XGrid = 'on';
my_grid.YGrid = 'on';
my_grid.GridAlpha = 0.5;
%set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
grid on
hold off;
%% old

ax_ = ax.Data;
ay_ = ay.Data;
x_ = x.Data;
y_ = y.Data;
% throttle_ = throttle.Data;
% brake_ = brake.Data;
% steering_ = steering.Data;
%roll_ = rollAngle.Data;
%rollRata_ = rollrate.Data;
yawRate_ = yawrate.Data;
%%  plot ay

for i = 1:651
    ay_for_plot(i,1) = ay_(i,1) * 0.5;
end


%for i = 2:877
 %    ay_for_plot(i,1) =  (ay_for_plot(i-1,1) +  ay_for_plot(i-1,1)) / 2;
%end

figure
x = linspace(0,120,651);	
plot(x,ay_for_plot);  
xlabel('t (s)');  
ylabel('ay (m/s^2)');
title('Lateral acceleration');  
legend('ay');  
%%  plot ax
for i = 1:877
    ax_for_plot(i,1)= ax_(i,1) * 0.7/9.8;
end

%for i = 2:877
 %    ay_for_plot(i,1) =  (ay_for_plot(i-1,1) +  ay_for_plot(i-1,1)) / 2;
%end

figure
x = linspace(0,180,877);	
plot(x,ax_for_plot);  
xlabel('t (s)');  
ylabel('ax (m/s^2)');
title('Longitudinal acceleration');  
legend('ax');  

%% plot x y
figure
plot(x_,y_);  
xlabel('x(m)');  
ylabel('y(m)');
title('xy graph');  
legend('MPC controller');  

%% plot yawRate
for i = 1:877
    yawrate_for_plot(i,1) = yawRate_(i,1) * 0.7;
end
%for i = 2:877
 %    ay_for_plot(i,1) =  (ay_for_plot(i-1,1) +  ay_for_plot(i-1,1)) / 2;
%end

figure
x = linspace(0,180,877);	
plot(x,yawrate_for_plot);  
xlabel('t (s)');  
ylabel('yawrate (deg/s^2)');
title('yaw rate');  
legend('yaw rate');  
%% plot roll angle
for i = 1:877
    rollAngle_for_plot(i,1) = roll_(i,1) * 0.7;
end
%for i = 2:877
 %    ay_for_plot(i,1) =  (ay_for_plot(i-1,1) +  ay_for_plot(i-1,1)) / 2;
%end

figure
x = linspace(0,180,877);	
plot(x,rollAngle_for_plot);  
xlabel('t (s)');  
ylabel('roll angle (deg/s)');
title('roll angle');  
legend('roll angle');  
%% plot steering
for i = 1:877
    steering_for_plot(i,1) = steering_(i,1) * 0.5/20;
end
%for i = 2:877
 %    ay_for_plot(i,1) =  (ay_for_plot(i-1,1) +  ay_for_plot(i-1,1)) / 2;
%end

figure
x = linspace(0,180,877);	
plot(x,steering_for_plot);  
xlabel('t (s)');  
ylabel('steering (deg)');
title('steering angle');  
legend('steering angle');  