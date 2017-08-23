% calibrate offsets

disp('gathering data...');
imu.startLog('Directory', 'logs');
    pause(1);
    log = imu.stopLog();
    gyroOffsets = [mean(log.gyroX); mean(log.gyroY); mean(log.gyroZ)];
    accelOffsets = [mean(log.accelX); mean(log.accelY)+9.81; mean(log.accelZ)];
    display('Gyros and Accelerometers calibrated.');
    calibratedIMUNames = imuNames;
    save('IMUoffsets.mat', 'accelOffsets', 'gyroOffsets', 'calibratedIMUNames');