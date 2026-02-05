# Design and Fabrication of 1-Φ to 3-Φ Matrix Converter

## 📌 Project Overview
**1-Φ to 3-Φ Matrix Converter** is a comprehensive electrical engineering project focused on the design, simulation, and hardware fabrication of a power converter topology. The system converts single-phase AC supply directly into three-phase AC output without the use of an intermediate DC link, specifically designed to drive 3-phase Induction Motor loads efficiently.

## 🚀 Engineering Strategy

* **Problem Solved:** Addressed the incompatibility between single-phase supply lines (common in traction systems like 25kV, 50Hz) and high-power industrial 3-phase Induction Motors, which are preferred for their self-starting torque and efficiency.
* **Value Proposition:** Implemented a **Matrix Converter** topology which functions as a direct AC-to-AC converter. By eliminating the DC-link capacitor found in traditional topologies, the design increases power density, reduces size, and removes the reliance on bulky energy storage elements.
* **Target Application:** Electric traction systems, heavy industrial drives, and variable frequency drives requiring compact power conversion.

## 📊 Technical Analysis & Implementation

* **Topological Design:** Utilized the "Separation and Link" technique to analyze the 6-bidirectional switch architecture, defining 16 distinct switching states to manage positive and negative source cycles.
* **Simulation & Validation:**
    * Simulated the converter using **PSIM** and **MATLAB** to verify switching algorithms.
    * Validated successful operation and speed control of an Induction Motor load across a frequency range of **35 Hz to 60 Hz**.
* **Control Logic (SPWM):**
    * Developed Sinusoidal Pulse Width Modulation (SPWM) signals using an **STM32F407 Microcontroller**.
    * Interfaced the microcontroller with MATLAB using the **Waijung blockset** for real-time Hardware-in-the-Loop (HIL) testing.
    * Implemented a Phase Locked Loop (PLL) synchronization circuit to lock the SPWM signals with the grid frequency.
* **Hardware Realization:**
    * Designed and fabricated a custom driver circuit using **TLP250 optocouplers** for isolation.
    * Integrated **LM7815** voltage regulators to boost 3.3V microcontroller logic to the 15V required for IGBT gate driving.

## 🛠️ Skills & Tools Applied

* **Core Skills:** Power Converter Analysis, PCB Design & Fabrication, Embedded Control Systems, Motor Drives.
* **Software:** MATLAB/Simulink (Waijung Blockset), PSIM, Keil uVision.
* **Hardware:** STM32F407 Discovery Board, TLP250 Driver ICs, IGBTs, Transformers, Oscilloscopes.

## 📂 Project Structure

**Note:** The full hardware schematics and project report are not publicly available in this repository due to copyright restrictions. However, I am available to present the complete documentation upon request.
