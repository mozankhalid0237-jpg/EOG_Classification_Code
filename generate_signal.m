generate_signal.m
%% =========================================================================
%% STEP 1: GENERATE EOG SIGNAL
%% =========================================================================

fs = 650;
total_samples = 32500;
t = (0:total_samples-1)/fs;

hor_signal = zeros(1, total_samples);
ver_signal = zeros(1, total_samples);

% Down movement
ver_signal(1:6500) = -0.2 * exp(-((1:6500)-3250).^2 / 2e6);
% Up movement
ver_signal(6001:13000) = 0.25 * exp(-((6001:13000)-9500).^2 / 2e6);
% Blink movement
blink_idx = 13001:19500;
ver_signal(blink_idx) = 0.5 * sin(2*pi*10*(blink_idx-13001)/fs) .* exp(-(blink_idx-16250)/2000);
% Left movement
hor_signal(19501:26000) = -0.3 * exp(-((19501:26000)-22750).^2 / 3e6);
% Right movement
hor_signal(26001:32500) = 0.25 * exp(-((26001:32500)-29250).^2 / 3e6);

% Add noise
hor_signal = hor_signal + 0.02 * randn(1, total_samples);
ver_signal = ver_signal + 0.02 * randn(1, total_samples);