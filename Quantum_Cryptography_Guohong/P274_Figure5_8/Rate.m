% Zelin Meng 2018 @ SWU
% mengzelin@email.swu.edu.cn
% Basic GLLP simulation

function [bitPerPulse] = Rate(x, Miu, Min_Value)
    % global variables
    global q;
    global e_0;
    global e_det;
    global p_d;
    global Eta_D;
    global Eta_Bob;
    global Alpha;
    % length of x.
    x_len = length(x);
    % Return data.
    bitPerPulse = zeros(1, x_len);
    for i = 1 : x_len
        % Distance is in meter instead of kilometer.
        dist = 1000 * x(i);
        % Loss of Bob
        Eta_AB = 10 ^ (- Alpha * dist / 10);
        Eta = Eta_AB * Eta_Bob * Eta_D;
        % Y_0 is the responsivity of detector of Bob,
        % when the photon number is 0,
        % it is from 5-65, and Y_1 is from 5-67.
        Y_0 = 2 * p_d;
        % Q_miu is the total gain.
        % It is from (5-70).
        Q_miu = Y_0 + 1 - exp(- Eta * Miu);
        % E_miu is the total QBER
        E_miu = (e_0 * Y_0 + e_det * (1 - exp(- Eta * Miu))) / Q_miu;
        % probability when photon number is larger than 1
        P_multi = 1 - exp(-Miu) - Miu * exp(-Miu);
        Delta_1 = 1 - P_multi / Q_miu;
        % e_1 is the probability of Bob getting different detection
        % result with Bob.
        e_1 = E_miu / Delta_1;
        % Now use the estimate value of e_1
        %e_1 = E_miu / Delta_1;
        H2_E_miu = H2(E_miu);
        H2_e_1 = H2(e_1);
        R = q * Q_miu * (- H2_E_miu + Delta_1 * (1 - H2_e_1));
        % stop when less than min_value
        if R <= Min_Value
            return;
        else
            bitPerPulse(i) = R;
        end
    end
end

