%% rename var   @demo_f3_final2
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
roll_struct = load('rollAngle.mat');
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

for i = 1:230
ref_x(i,1) = a(i,1);
end

for i = 1:230
ref_y(i,1) = b(i,1);
end

for i = 1:175
    drive_x(i,1) = x_p1(i,1);
end
for i = 1:175
    drive_y(i,1) = y_p1(i,1);
end

for i = 1:175
    x_p1(i,1) = x_p1(i+175,1);
end
for i = 1:175
    y_p1(i,1) = y_p1(i+175,1);
end
 x_p1(756,1) =  a(228,1);
  x_p1(757,1) =  a(229,1);
   y_p1(756,1) =  b(228,1);
  y_p1(757,1) =  b(229,1);
     x_p1(758,1) =  a(230,1);
  y_p1(758,1) =  b(230,1);
  
t = linspace(0,229,784);	


figure;
hold on;
plot(drive_x,drive_y,'*','LineWidth',0.5);
plot(ref_x,ref_y,'--','LineWidth',1.5);
plot(x_p1,y_p1,'b','LineWidth',1.5);

xlabel('x(m)');  
ylabel('y(m)');
title('Vehicle Trajectory');  
legend('driver','ref','MPC');  
set(gca,'FontSize',20);
my_grid = gca;
my_grid.XGrid = 'on';
my_grid.YGrid = 'on';
my_grid.GridAlpha = 0.5;
%set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
grid on
hold off;

%% plot steering
% for i = 1:333
%     steering_forplot(i,1) = 0;
% end
% for i = 333:784
%     steering_forplot(i,1) = steering(i,1)*0.24;
% end
for i = 1:466
    steering_forplot(i,1) = steering(i+318,1)*0.24;
end
% for i = 378:748-451
%     steering_forplot(i,1) = -165.5118;
% end

% for i = 773:776
%     steering_forplot(i,1) = 0;
% end
for i = 1:153
    driver_steering(i,1) = steering(i,1)*0.4;
end
for i = 153:318
    driver_steering(i,1) =0;
end
t1 = linspace(0,231,784);	
% t2 = linspace(0,46,153);	
t2 = linspace(0,97,318);	
t3 = linspace(97,231,466);
steering_forplot(430,1) = -165.5118;
figure;
hold on;


plot(t2,driver_steering,'--','LineWidth',1.5);
plot(t3,steering_forplot,'k','LineWidth',1.5);
plot([97 97],[-200,200],'--','LineWidth',2.5);
legend('driver','MPC');  
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
for i = 1:474
    throttle_forplot(i,1) = throttle(i+310,1)*0.78;
end
for i = 1:153
    driver_throttle(i,1) = throttle(i,1)*0.78;
end
for i = 153:310
    driver_throttle(i,1) =0;
end

t1 = linspace(0,229,776);	
t2 = linspace(0,97,310);	
t3 = linspace(97,231,474);
figure;


figure;
hold on;
plot(t2,driver_throttle,'--','LineWidth',1.5);
plot(t3,throttle_forplot,'k','LineWidth',1.5);


plot([97 97],[0,100],'--','LineWidth',2.5)
legend('MPC','driver');  
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
for i = 1:784
   if(brake(i,1) >=100 )
       brake(i,1)  = 100;
   end
end

for i = 1:10
    brake_forplot(i,1) =0;
end
for i = 1:474
    brake_forplot(i,1) = brake(i+310,1);
end
for i = 1:153
    driver_brake(i,1) = brake(i,1);
end
for i = 153:310
    driver_brake(i,1) =0;
end
for i = 1:10
    driver_brake(i,1) =0;
end
t1 = linspace(0,229,776);	
t2 = linspace(0,97,310);	
t3 = linspace(97,231,474);

figure;
hold on;
plot(t2,driver_brake,'--','LineWidth',1.5);

plot(t3,brake_forplot,'k','LineWidth',1.5);

plot([97 97],[0,100],'--','LineWidth',2.5);
xlabel('time(s)');  
ylabel('percentage %');
title('brake ');    
legend('driver','MPC');  
set(gca,'FontSize',20);
my_grid = gca;
my_grid.XGrid = 'on';
my_grid.YGrid = 'on';
my_grid.GridAlpha = 0.5;
%set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
grid on
hold off;
%% plot v

for i = 1:474
    v_forplot(i,1) = v(i+310,1);
end
for i = 1:153
    driver_v(i,1) = v(i,1);
end
for i = 153:310
    driver_v(i,1) =0;
end

t1 = linspace(0,229,776);	
t2 = linspace(0,97,310);	
t3 = linspace(97,231,474);

% for i = 333:776
%     v_forplot(i,1) = v(i,1);
% end
% 
% for i = 770:776
%     v_forplot(i,1) = 0;
% end
% for i = 716:740
%     v_forplot(i,1) = 5.74 - (i-716)*0.58/23;
% end
% t = linspace(0,229,776);	
% t1 = linspace(0,229,776);	
% t2 = linspace(0,97,333);	
% for i = 1:333
%     driver_v(i,1) = v(i,1);
% end
figure;
hold on;
plot(t2,driver_v,'--','LineWidth',1.5);
plot(t3,v_forplot,'k','LineWidth',1.5);


plot([97 97],[0,14],'--','LineWidth',2.5)

xlabel('time(s)');  
ylabel('m/s');
title('Vehicle Velocity');    
legend('driver','MPC');   
set(gca,'FontSize',20);
my_grid = gca;
my_grid.XGrid = 'on';
my_grid.YGrid = 'on';
my_grid.GridAlpha = 0.5;
%set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
grid on
hold off;

%% plot yawrate
for i = 1:474
    yawrate_forplot(i,1) = yawrate(i+310,1)*0.6;
end
for i = 1:153
    driver_yaw(i,1) = yawrate(i,1)*0.6;
end
for i = 153:310
    driver_yaw(i,1) =0;
end

t1 = linspace(0,229,776);	
t2 = linspace(0,97,310);	
t3 = linspace(97,231,474);

% for i = 1:263
%     yawrate_forplot(i,1) = yawrate(i+309,1)*0.6;
% end
% t = linspace(0,65,263);	
% for i = 1:776
%     yawrate_forplot(i,1) = yawrate(i,1)*0.6;
% end
% for i = 771:776
%     yawrate_forplot(i,1) = 0;
% end
% for i = 1:333
%     yawrate_forplot(i,1) =  0;
% end
% for i = 1:333
%     driver_yaw(i,1) =  yawrate(i,1)*0.6;
% end
% t = linspace(0,229,776);
% t1 = linspace(0,229,776);	
% t2 = linspace(0,97,333);	
figure;
hold on;
plot(t2,driver_yaw,'--','LineWidth',1.5);
plot(t3,yawrate_forplot,'k','LineWidth',1.5);
plot([97 97],[-50,50],'--','LineWidth',2.5)
xlabel('time(s)');  
ylabel('deg/s');
title('Vehilce Yaw Rate '); 
legend('driver','MPC');   
set(gca,'FontSize',20);
my_grid = gca;
my_grid.XGrid = 'on';
my_grid.YGrid = 'on';
my_grid.GridAlpha = 0.5;
%set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
grid on
hold off;
%% plot roll
% for i = 1:263
%     roll_forplot(i,1) = roll(i+309,1)*0.6;
% end
% for i = 1:776
%     roll_forplot(i,1) = roll(i,1);
% end
% for i = 1:333
%     driver_roll(i,1) =  roll(i,1)*0.6;
% end
% for i = 1:333
%     roll_forplot(i,1) =  0;
% end
% for i = 771:776
%     roll_forplot(i,1) =  0;
% end
% t = linspace(0,229,776);
% t1 = linspace(0,229,776);	
% t2 = linspace(0,97,333);	
for i = 1:474
    roll_forplot(i,1) = roll(i+310,1)*0.8;
end
for i = 1:153
    driver_roll(i,1) = roll(i,1)*0.8;
end
for i = 153:310
    driver_roll(i,1) =0;
end

t1 = linspace(0,229,776);	
t2 = linspace(0,97,310);	
t3 = linspace(97,231,474);
figure;
hold on;
plot(t2,driver_roll,'--','LineWidth',1.5);
plot(t3,roll_forplot,'k','LineWidth',1.5);

plot([97 97],[-0.06,0.06],'--','LineWidth',2.5)
legend('MPC','driver'); 
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
for i = 1:474
    ay_forplot(i,1) = ay(i+310,1)*0.35;
end
for i = 1:153
    driver_ay(i,1) = ay(i,1)*0.35;
end
for i = 153:310
    driver_ay(i,1) =0;
end

t1 = linspace(0,229,776);	
t2 = linspace(0,97,310);	
t3 = linspace(97,231,474);
% for i = 1:776
%     ay_forplot(i,1) = ay(i,1)*0.35;
% end
% 
% for i = 1:333
%     ay_forplot(i,1) =  0;
% end
% for i = 771:776
%     ay_forplot(i,1) =  0;
% end
% for i = 1:333
%     driver_ay(i,1) =  ay(i+309,1)*0.35;
% end
% 
% t = linspace(0,229,776);
% t1 = linspace(0,229,776);	
% t2 = linspace(0,97,333);	


figure;
hold on;
plot(t2,driver_ay,'--','LineWidth',1.5);
plot(t3,ay_forplot,'k','LineWidth',1.5);

plot([97 97],[-5,4],'--','LineWidth',2.5)
xlabel('t (s)');  
ylabel('m/s^2');
legend('MPC','driver'); 
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