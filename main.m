a = arduino('COM3','Nano3');
reallyDryValue = 1.9;
moistureThreshold = 3.1;
saturatedValue = 4.5;
disp('Starting plant watering state machine...');
while true
    soilMoisture = readVoltage(a, 'A0');
    
    if soilMoisture > reallyDryValue
        writeDigitalPin(a, 'D2', 1);
        disp('Soil is dry. Pump is ON.');
    elseif soilMoisture > moistureThreshold
        writeDigitalPin(a, 'D2', 1);
        disp('Soil is wet, but not too wet. Pump is ON.');
    elseif soilMoisture >= saturatedValue
        writeDigitalPin(a, 'D2', 0);
        disp('Soil is wet enough. Pump is OFF.');
    else
        writeDigitalPin(a, 'D2', 0);
        disp('Unexpected sensor reading. Pump is OFF.');
    end
    pause(1);
end