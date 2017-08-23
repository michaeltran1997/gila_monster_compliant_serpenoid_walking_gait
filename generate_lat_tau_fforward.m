% This function generates feedforward torque for lateral modules using
% models built from experimenting with torque feedback.
function lat_tau_fforward = generate_lat_tau_fforward(t)
    % specific to 
    % eta          = 2*pi/(10*mod_len);
    % omega        = 0.1;
    % A            = 0.5; %tested up to 1.2
    % A_el         = pi/3; %amplitude elbow
    A1 = 1.97; B1 = 0.0995; C1 =  10.10; D1 = -0.25;
    A2 = 2.12; B2 = 0.0995; C2 =  12.75; D2 =  0.15;
    A3 = 5.52; B3 = 0.0995; C3 =  10.35; D3 =  0.55;
    
    lat_tau_fforward = zeros(3, 1);
    lat_tau_fforward(1) = A1*sin(B1*t-C1)+D1;
    lat_tau_fforward(2) = A2*sin(B2*t-C2)+D2;
    lat_tau_fforward(3) = A3*sin(B3*t-C3)+D3;
end