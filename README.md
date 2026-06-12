# 🌱 Real-Time Environmental Monitoring Using Sensors and Machine Learning

A real-time environmental monitoring system that collects air quality and soil moisture data using sensors, visualizes live readings in MATLAB, and applies machine learning techniques to analyze environmental patterns.

This project combines sensor integration, real-time data visualization, and basic machine learning to monitor environmental conditions and identify meaningful trends in the collected data.

---

## 🚀 Features

* Reads real-time environmental sensor data from an Arduino/Grove board
* Monitors air quality using an SGP30 sensor for eCO₂ and TVOC readings
* Tracks soil moisture levels using an analog soil moisture sensor
* Visualizes live sensor data in MATLAB
* Applies machine learning techniques such as k-means clustering and linear regression
* Identifies patterns in environmental conditions based on collected sensor data
* Supports exploratory analysis for environmental monitoring and plant-care automation use cases

---

## 🛠️ Tech Stack

**Languages & Tools:** MATLAB, Arduino, C/C++
**Hardware:** Arduino/Grove board, SGP30 air quality sensor, soil moisture sensor
**Machine Learning:** k-means clustering, linear regression
**Focus Areas:** Sensor integration, real-time visualization, environmental monitoring, predictive analysis

---

## 📌 Project Overview

The system collects environmental data from multiple sensors and sends the readings to MATLAB for live visualization and analysis.

The project focuses on three main goals:

1. **Data Collection**
   Gather real-time sensor readings from air quality and soil moisture sensors.

2. **Data Visualization**
   Display live environmental readings to make sensor behavior easier to understand.

3. **Machine Learning Analysis**
   Use clustering and regression techniques to identify patterns and make simple predictions based on collected data.

---

## 🔬 Sensors Used

### SGP30 Air Quality Sensor

The SGP30 sensor is used to monitor indoor air quality by collecting:

* eCO₂ readings
* TVOC readings

These values help represent changes in air quality over time.

### Soil Moisture Sensor

The soil moisture sensor is used to estimate moisture levels in soil, which can support plant health monitoring and automated watering applications.

---

## 🤖 Machine Learning Approach

This project uses basic machine learning methods to analyze sensor data:

### K-Means Clustering

K-means clustering is used to group environmental readings into different condition categories. For example, sensor readings may cluster into patterns representing lower, moderate, or higher environmental intensity.

### Linear Regression

Linear regression is used to explore relationships between sensor readings and predict trends based on collected data.

---

## 📊 Example Use Cases

* Monitoring indoor air quality trends
* Tracking soil moisture changes over time
* Identifying environmental patterns from sensor data
* Supporting smart plant-care systems
* Building a foundation for future IoT and environmental automation projects

---

## ▶️ Demo

Watch the demo here:

[Real-Time Environmental Monitoring Using Sensors and Machine Learning](https://www.youtube.com/watch?v=el4Gd9wrhBw)

---

## 📁 Repository Structure

```text
.
├── README.md
├── air-quality-monitoring/
│    ├── code/
│         ├── airquality.m
│         └── sgp30.m
│    ├── docs/
│         └── bonus_project_report.pdf
│    └── media/
│         ├── clustering-results.jpg
│         ├── flowchart.png
│         ├── hardware-setup.jpg
│         └── real-time-plot.jpg
├── automated-plant-watering/
│    ├── code/
│         ├── airquality.m
│         └── sgp30.m
│    ├── docs/
│         └── bonus_project_report.pdf
│    └── media/
│         ├── clustering-results.jpg
│         ├── flowchart.png
│         ├── hardware-setup.jpg
│         └── real-time-plot.jpg
```
---

## ⚙️ How It Works

1. Sensors collect environmental readings.
2. Arduino reads the sensor values.
3. Data is sent to MATLAB.
4. MATLAB visualizes the readings in real time.
5. Machine learning models analyze the collected data.
6. Results are used to understand environmental patterns and trends.

---

## 🧪 Setup

### Requirements

* Arduino/Grove-compatible board
* SGP30 air quality sensor
* Soil moisture sensor
* MATLAB
* Arduino IDE
* USB connection between Arduino and computer

### Steps

1. Connect the sensors to the Arduino/Grove board.
2. Upload the Arduino sensor-reading code using the Arduino IDE.
3. Open the MATLAB scripts.
4. Connect MATLAB to the correct serial port.
5. Run the visualization script to view real-time readings.
6. Run the analysis scripts to apply clustering and regression.

---

## 📈 Results

The project successfully demonstrated real-time environmental data collection and visualization. Sensor readings were analyzed using machine learning techniques to explore environmental patterns and relationships between collected values.

This project helped connect hardware-based sensing with software-based analysis, showing how sensor data can be collected, visualized, and interpreted using MATLAB and basic machine learning methods.

---

## 🧠 What I Learned

* How to collect real-time data from environmental sensors
* How to interface Arduino-based hardware with MATLAB
* How to visualize live sensor readings
* How to apply k-means clustering to sensor data
* How to use linear regression for basic prediction and trend analysis
* How to structure sensor-based systems for environmental monitoring applications

---

## 🔗 Related Project

This project is related to an automated plant watering system that uses soil moisture sensing and a MOSFET relay-controlled water pump to support plant-care automation.

Demo: [Automated Plant Watering System](https://www.youtube.com/watch?v=zWMFbRdRFU0)

---

## 👩‍💻 Author

**Aruzhan Massalina**
Computer Engineering Student, York University
Interested in software engineering, AI applications, embedded software, and systems programming.
