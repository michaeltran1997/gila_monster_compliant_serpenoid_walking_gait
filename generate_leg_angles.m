% This function generates angles for leg modules. The gait is sinusoidal
% wave. The amplitude of the hip modules is the same as that of the
% backbone wave. There is an offset in the sinusoidal wave of opposite
% pairs of legs (front left and rear right; front right and rear left) to
% allow the Gila Monster to walk forward.
function legAngles = generate_leg_angles(A, A_el, eta, omega_t, offset, scale, numModLegs)
    
    leg1Angles = zeros(1, numModLegs);
    
    leg2Angles = zeros(1, numModLegs);
    
    leg3Angles = zeros(1, numModLegs);
    
    leg4Angles = zeros(1, numModLegs);
    
    % sinusoidal hip
    % offset term allows the Gila Monster to turn
    leg1Angles(1) =  A * sin(eta*1 - omega_t + pi/2) * (1 + offset)/scale;
    
    leg2Angles(1) =  A * sin(eta*1 - omega_t + pi/2) * (1 - offset)/scale;
    
    leg3Angles(1) = -A * sin(eta*1 - omega_t + pi/2) * (1 + offset)/scale;
    
    leg4Angles(1) = -A * sin(eta*1 - omega_t + pi/2) * (1 - offset)/scale;
    
    % sinusoidal elbow
    % elbow's amplitude is independent of backbone's wave
    leg1Angles(2) =  A_el * sin(eta*1 - omega_t + pi/2) - pi/2;
    
    leg2Angles(2) = -A_el * sin(eta*1 - omega_t + pi/2) - pi/2;
    
    leg3Angles(2) = -A_el * sin(eta*1 - omega_t + pi/2) - pi/2;
    
    leg4Angles(2) =  A_el * sin(eta*1 - omega_t + pi/2) - pi/2;
    
    legAngles = [leg1Angles; leg2Angles; leg3Angles; leg4Angles];
end
    
    