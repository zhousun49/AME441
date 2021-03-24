clear all;
close all;
V_array = [15.0, 20.2, 12.0, 20.4, 10.3, 20.4, 16.8, 23.3, 9.5, 15.0, 8.0, 26.5, 5.3, 18.3, 10.0, 15.1, 10.4, 20.0, 9.0, 21.0, 12.8, 14.3, 11, 16, 11, 15.5, 10.4, 17, 11.7, 21, 12, 20.2, 12.5, 21, 10, 23, 7, 24.5, 10, 20.4, 10, 17, 13, 17.5, 15];
T_array = [2, 2.3, 4, 5.9, 7.8, 9, 10.1, 11.6, 14, 15.3, 16.1, 21, 23.4, 26, 27, 28, 29, 30, 32.4, 36, 37, 38, 39.5, 41.4, 42, 43, 44, 45.7, 47, 48, 50, 50.8, 52, 54, 58, 61, 63.7, 66, 68.1, 70, 72.4, 75, 78, 79.5, 80];
plot_array = zeros(1, 65535);
time = 0;
temp = 0;
intTime = 0;
intTemp = 0;
plot_array(1) = V_array(1);
for i = 2:length(T_array)
    
    % Find the time step
    time = T_array(i) - T_array(i-1);
    
    % Find the velocity change
    velo = V_array(i) - V_array(i-1);
    
    % Calculate Slope
    slope = velo/time;
    
    % Convert Time to ms
    time = time * 1000; %[ms]
    
    % Increment time
    time = time + temp;
    
    % Cast for use in array indicies
    intTime = cast(time, 'uint16');
    intTemp = cast(temp, 'uint16');
    count = 1;
    for j = 1:78000
   
        
        if(j < 78000)
            plot_array(j+intTemp) = V_array(i-1) + slope * j/1000;
        end
        if(j == 78000)
            plot_array(65535) = 15;
        end
        count = count + 1;
        
%         
    end
%     plot(plot_array);
    temp = time;
end

plot(plot_array);
xlabel('Time [s]');
ylabel('Velocity [m/s]');
ylim([0 30])


count = 1;
for i = 1:length(plot_array)
    if(i == 1)
        last_a(count) = plot_array(i);
        count = count + 1;
    end
    if(mod(i,100) == 0 ) 
        last_a(count) = plot_array(i);
        count = count + 1;
    end
end
figure()
plot(last_a);
plot_array = plot_array.';
last_a = last_a.';
    