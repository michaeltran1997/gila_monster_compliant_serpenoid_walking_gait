% This function generates Jacobians to transform joint space to shape space
function [J_lat, J_vert] = generate_jacobians(numModLat, numModVert, reversed_lat, reversed_vert, ...
                                              A, omega_t, eta, len)
    
    % Jacobian for Amplitude
    
    J_lat_amp = zeros(1, numModLat);

    for i = 1:numModLat
        J_lat_amp(i) =  sin(eta*len(i)+omega_t) * reversed_lat(i);
    end
    
    J_lat_omega_t = zeros(1, numModLat);
    
    for i = 1:numModLat
        J_lat_omega_t(i) = A*cos(eta*len(i)+omega_t) * reversed_lat(i);
    end
    
    J_lat_off =  reversed_lat .* -ones(1, numModLat);

    J_lat = [J_lat_amp; J_lat_omega_t; J_lat_off; zeros(1, numModLat)];

    J_vert = [zeros(1, numModVert); zeros(1, numModVert); zeros(1, numModVert); reversed_vert .* ones(1, numModVert)];
end