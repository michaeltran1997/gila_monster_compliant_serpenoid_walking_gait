% This is the shape-based compliant gait for the Gila Monster
% The lateral backbone of the Gila Monster is a sinusoidal wave with
% compliant offset. The vertical backbone is a compliant body_raise.

clear all;

addpath('/Users/apple/Box Sync/Robotics Lab/Gila Monster/Walking_gait_serpenoid_backbone/Compliant');
% -------------------------------------------------------------------------
% - run startup file and group modules
setup;

% -------------------------------------------------------------------------
% - gains setting
set_gains(lateral_backbone, vertical_backbone, leg1, leg2, leg3, leg4);
pause(0.5);

% -------------------------------------------------------------------------
% - initializing variables
initialize_variables;

%--------------------------------------------------------------------------
% - run gait

disp('Ready');

while true % stop after 20 seconds
   
    if axis(joy, 1) > 0.5
        dt = 1;
        % sigma0(2) is omega_t
        sigma0(2) = sigma0(2)+omega;
        % disp('forward');
        % record data
        % data = [data; t lat_fbk.torque vert_fbk.torque];
        
    elseif axis(joy,1) < -0.5
        dt = -1;
        sigma0(2) = sigma0(2)-omega;
        % disp('backward');
        % record data
        % data = [data; t lat_fbk.torque vert_fbk.torque];
    elseif button(joy,1) == 1
        break
    else
        continue;   
    end
    
    disp(body_raise);
    % get feedback
    lat_fbk  = lateral_backbone.getNextFeedback();
    
    vert_fbk = vertical_backbone.getNextFeedback();
    
    legAngles = generate_leg_angles(A, A_el, eta, omega_t, offset, scale, numModLegs);
    
    % generate Jacobians
    [J_lat, J_vert] = generate_jacobians(numModLat, numModVert, reversed_lat, reversed_vert, A, omega_t, eta, len);
    
    % generate lateral feedforward torque from pre-modeled function 
    lat_tau_fforward = generate_lat_tau_fforward(omega_t/omega);
    
    % get tau_sigma for both lateral and vertical modules
    tau_sigma_lat   = J_lat * (lat_fbk.torque'  - lat_tau_fforward);
    
    tau_sigma_vert  = J_vert * (vert_fbk.torque' - vert_tau_fforward);
    
    % combining lateral and vertical tau_sigma
    tau_sigma = tau_sigma_lat + tau_sigma_vert;
    
    sigma_ddot = M \ (-B*sigma_dot - K*(sigma-sigma0) + tau_sigma.*fudge_factor);
    
    sigma_dot  = sigma_dot + sigma_ddot*dt;
    
    sigma      = sigma + sigma_dot*dt;
    
    A = sigma(1); omega_t = sigma(2); offset = sigma(3); body_raise = sigma(4);
    
    % generate angles from these variables
    lateralBackboneAngles = generate_lateral_backbone_angles(A, eta, omega_t, offset, len, reversed_lat, numModLat);
    
    verticalBackboneAngles = generate_vertical_backbone_angles(body_raise, reversed_vert);
    
    % send angles to Gila Monster
    send_commands;
    
    % plot_compliant_variables;
    
    pause(0.05);
    
end

clear all;
% close all;