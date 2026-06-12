a = arduino('COM3','Nano3');
maxDataPoints = 100;
soilMoistureData = zeros(1, maxDataPoints);
timeData = linspace(-maxDataPoints, 0, maxDataPoints);
updateInterval = 0.5;
figure;
soilPlot = plot(timeData, soilMoistureData, '-o', 'LineWidth', 1.5);
grid on;
title('Live Soil Moisture Monitoring');
xlabel('Time (s)');
ylabel('Soil Moisture Voltage (V)');
ylim([0 5]);
xlim([-maxDataPoints, 0]);
disp('Starting live soil moisture graph...');
while true
    soilMoisture = readVoltage(a, 'A0');
    soilMoistureData = [soilMoistureData(2:end), soilMoisture];
    set(soilPlot, 'YData', soilMoistureData);
    drawnow;
    fprintf('Soil Moisture: %.2f V\n', 'A0');
    pause(updateInterval);
end
