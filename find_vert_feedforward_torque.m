function vert_tau_fforward = find_vert_feedforward_torque(lateralBackboneAngles, legAngles, ...
                                                            spl_mass, mod_mass, spl_len, mod_len)
    
    % This calculation makes use of the symmetry of Gila Monster shape
    % When Gila monster in configuration 0, vert_tau_fforward = 1.65
    g = 9.81; %m/s^2                                                 
    total_weight = (13 * mod_mass + 2 * spl_mass) * g; %N
    spl_2legs_weight = (4 * mod_mass + spl_mass) * g; %N
    
    angle_1 = lateralBackboneAngles(1);
    
    dx1 = mod_len*cos(legAngles(1,1)) + (mod_len+spl_len)/2 - mod_len*sin(angle_1);
    dy1 = mod_len*sin(legAngles(1,1)) + (mod_len+spl_len)/2 + mod_len*cos(angle_1);
    theta1 = pi/2 - angle_1 - atan(dx1/dy1);
    
    d1 = ((spl_len+mod_len)/2 * cos(angle_1) + mod_len);
    d2 = (dx1^2 + dy1^2) ^ 0.5 * sin(theta1);
    
    tau_fforward = spl_2legs_weight * d1 - total_weight/2 * d2 ;
    vert_tau_fforward = [tau_fforward; -tau_fforward];
end