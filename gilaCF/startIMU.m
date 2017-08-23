% this script makes a group for the IMUs that are attached to the "body"
% frame of the robot, such as the chassis or head.
% Each time the modules are switched, delete the file "IMUoffsets.mat" so
% that this script can replace it. 
% If recalibrating, make sure that the chassis is flat on the ground first.

% add the modules that will be used for IMU
% for Gila monster I have it set up to use 3 right now. that can be changed
% if needed.
names = {'SA046','SA021','SA047'};

imu = HebiLookup.newGroupFromNames('*', names);
snakeData = setupGilaMonsterShoulderData();

if ~exist('gyroOffsets', 'var')
    try
        load('IMUoffsets.mat');
    catch err
        addpath(genpath(pwd));
        calibrateOffsets;
    end
end

CF = SMComplementaryFilter(snakeData, 'accelOffsets', accelOffsets, 'gyroOffsets', gyroOffsets);
imuFbk = imu.getNextFeedback();
CF.update(imuFbk);
pause(.01);
