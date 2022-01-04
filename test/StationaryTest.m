% imu = adi.ADIS16480();
% % imu.uri = 'ip:192.168.255.1';
% imu.uri = 'ip:192.168.254.117';
% imu.EnabledChannels = 1:6;
% imu.SamplesPerRead = 500;



g = 9.80665;  % Standard acceleration due to gravity m/s^2

for i = 1 : 3
    [accelReadings,~,~] = imu.read();
    meanMagnitude = mean(sqrt(sum(accelReadings.^2,2)));
    disp(meanMagnitude);
    if  meanMagnitude >= 0.99*g && meanMagnitude <= 1.01*g % acceleration is due to gravity only
        disp("Stationary");
    else
        disp("Moving");
        break;
    end
end


% disp(max(maxPerAxis))
% disp(meanMagnitude)

imu.release();
