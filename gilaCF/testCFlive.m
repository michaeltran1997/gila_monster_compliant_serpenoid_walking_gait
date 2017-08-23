
% Estimates online the body pose of the Gila Monster in the
% gravity-oriented frame
    
% %     names = {'SA046','SA021','SA047','SA037','SA050','SA035'};
% %     imu = HebiLookup.newGroupFromNames('Snake Monster',names);
% %     snakeData = setupSnakeMonsterShoulderData();
% %     
% %     imu.startLog('Directory', 'logs');
% %     pause(1);
% %     log = imu.stopLog();
% %     gyroOffsets = [mean(log.gyroX); mean(log.gyroY); mean(log.gyroZ)];
% %     accelOffsets = [mean(log.accelX); mean(log.accelY)+9.81; mean(log.accelZ)];
% %     display('Gyros and Accelerometers calibrated !');
% % 
% %     CF = SMComplementaryFilter(snakeData, 'accelOffsets', accelOffsets, 'gyroOffsets', gyroOffsets);
% %     fbk = imu.getNextFeedback();
% %     CF.update(fbk);
% %     pause(0.02);

startIMU; % contains all the above

    DCMpose = zeros(4,4);
    
    figure;
    arrowX = quiver3(0,0,0,1,0,0,'r'); hold on;
    arrowY = quiver3(0,0,0,0,1,0,'g');
    arrowZ = quiver3(0,0,0,0,0,1,'b');
    hold off;
    
    while true
        fbk = imu.getNextFeedback();
        CF.update(fbk);
        pose = CF.getBodyPose();
        DCMpose(1:3,1:3) = pose;
        
        set(arrowX, 'udata', pose(1,1), 'vdata', pose(2,1), 'wdata', pose(3,1));
        set(arrowY, 'udata', pose(1,2), 'vdata', pose(2,2), 'wdata', pose(3,2));
        set(arrowZ, 'udata', pose(1,3), 'vdata', pose(2,3), 'wdata', pose(3,3));
        xlim([-1 1]);
        ylim([-1 1]);
        zlim([-1 1]);
        
%         drawframe(DCMpose);
%         saveas(gca,'/tmp/tmp.png');
pause(.01);
    end

