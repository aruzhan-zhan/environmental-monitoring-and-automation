a = arduino('COM3', 'Nano3','Libraries',{'I2C'});
sgp30obj = sgp30(a);

figure('Name', 'Air Quality and Soil Monitoring', 'NumberTitle', 'off');
hold on;
grid on;
xlabel('Time (seconds)');
ylabel('Levels');
title('Real-Time Air Quality and Soil Monitoring');
eco2Line = animatedline('Color', 'r', 'DisplayName', 'eCO2 (ppm)');
tvocLine = animatedline('Color', 'b', 'DisplayName', 'TVOC (ppb)');
soilMoistureLine = animatedline('Color', 'g', 'DisplayName', 'Soil Moisture (%)');
legend;

startTime = datetime('now');
soilMoistureData = [];
eCO2Data = [];
tvocData = [];
timeData = [];


function moisturePercent = normalizeSoilMoisture(rawValue)
    moisturePercent = 100 - ((rawValue - 0) / (3.3 - 0) * 100);
end

while true
    eco2 = readEquivalentCarbondioxide(sgp30obj);
    tvoc = readTotalVolatileOrganicCompounds(sgp30obj);

    rawMoisture = readVoltage(a, 'A0'); 
    soilMoisture = normalizeSoilMoisture(rawMoisture);

    currentTime = seconds(datetime('now') - startTime);
    soilMoistureData = [soilMoistureData, soilMoisture];
    eCO2Data = [eCO2Data, eco2];
    tvocData = [tvocData, tvoc];
    timeData = [timeData, currentTime];

    addpoints(eco2Line, currentTime, eco2);
    addpoints(tvocLine, currentTime, tvoc);
    addpoints(soilMoistureLine, currentTime, soilMoisture);
    drawnow;

    disp(['eCO2: ', num2str(eco2), ' ppm, TVOC: ', num2str(tvoc), ...
          ' ppb, Soil Moisture: ', num2str(soilMoisture), '%']);

    if length(soilMoistureData) > 1 && length(eCO2Data) > 1 && length(tvocData) > 1
        soilMoistureData = double(soilMoistureData);
        eCO2Data = double(eCO2Data);
        tvocData = double(tvocData);

        if length(soilMoistureData) > 1
            corrMatrix = corrcoef([soilMoistureData', eCO2Data', tvocData']);
            disp('Correlation Matrix:');
            disp(corrMatrix);
        end
    end

    if length(eCO2Data) > 10
        data = [eCO2Data', tvocData'];
        [idx, centroids] = kmeans(data, 3);
        figure(2);
        scatter(eCO2Data, tvocData, 10, idx, 'filled');
        title('Clustering of Air Quality Data');
        xlabel('eCO2 (ppm)');
        ylabel('TVOC (ppb)');
        legend({'Good', 'Moderate', 'Hazardous'});
    end

    if length(soilMoistureData) > 10
        mdl = fitlm([soilMoistureData', tvocData'], eCO2Data');
        disp('Regression Model:');
        disp(mdl);

        predictedCO2 = predict(mdl, [30, 400]);
        disp(['Predicted eCO2: ', num2str(predictedCO2)]);
    end

    if eco2 > 1000
        disp('Alert: High eCO2 levels!');
    end
    if soilMoisture < 20
        disp('Alert: Soil moisture is critically low!');
    elseif soilMoisture > 80
        disp('Alert: Soil moisture is too high!');
    end

    pause(1);
end