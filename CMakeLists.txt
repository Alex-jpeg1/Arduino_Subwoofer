cmake_minimum_required(VERSION 3.10)
project(Arduino_Subwoofer LANGUAGES C CXX)
set(MCU atmega328p)

if(MCU STREQUAL "atmega328p")
  set(CMAKE_C_FLAGS "-mmcu=${MCU} -Os -Wall")
  set(CMAKE_CXX_FLAGS "-mmcu=${MCU} -Os -Wall")
  add_definitions(-DF_CPU=16000000UL)
endif()
add_executable(${PROJECT_NAME} src/main.cpp)

if(MCU STREQUAL "atmega328p")
  add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND avr-objcopy -O ihex -R .eeprom ${PROJECT_NAME} ${PROJECT_NAME}.hex
    COMMENT "Generating HEX file")
endif()
