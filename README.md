# ESP32 Auto Subwoofer & Control Hub

## Project Overview
The primary objective of this project is to program an ESP32-WROOM microcontroller to process and filter analog audio frequencies from a car's main radio unit, acting as a dedicated subwoofer controller.

To ensure high performance and scalability, the software architecture leverages **FreeRTOS** for real-time task multiplexing. Written in C++ with OOP principles for clean encapsulation and utilizing direct hardware register manipulation for maximum speed, this approach eliminates processing overhead. The non-blocking RTOS environment is specifically designed to facilitate the easy integration of future automotive features.

## Hardware Architecture
* **MCU:** ESP32-WROOM (Tensilica Xtensa Dual-Core 32-bit LX6)
* **Audio Input:** AC Coupling + DC Bias circuit (1.65V) for safe analog-to-digital conversion.
* **Audio Output:** DAC / Audio Amplifier circuit for subwoofer driving.
* **Trunk Control (Future):** DC Motor driven by an H-Bridge module with limit switches.
* **Lighting (Future):** Remote LED control integration.

## Software Stack
* **OS:** FreeRTOS (ESP-IDF implementation)
* **Language:** C/C++ (Object-Oriented + Bare-metal Register Access via `W1TS`/`W1TC`)
* **Compiler:** `xtensa-esp32-elf-gcc`
* **Development Environment:** NixOS (Reproducible toolchain via `nix-shell` / `flake.nix`)

## Build Instructions (NixOS)
This project is built using the ESP-IDF framework within a reproducible Nix environment.

1. Clone this repository:
   ```bash
   git clone <repository_url>
   cd <repository_folder>
