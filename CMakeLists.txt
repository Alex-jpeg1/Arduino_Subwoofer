cmake_minimum_required(VERSION 3.10)

set(CMAKE_C_COMPILER avr-gcc)
set(CMAKE_CXX_COMPILER avr-g++)
set(CMAKE_OBJCOPY avr-objcopy)

project(Arduino_Subwoofer LANGUAGES C CXX)

set(MCU atmega328p)

if(MCU STREQUAL "atmega328p")
    set(CMAKE_C_FLAGS "-mmcu=${MCU} -Os -Wall")
    set(CMAKE_CXX_FLAGS "-mmcu=${MCU} -Os -Wall")
    add_definitions(-DF_CPU=16000000UL)
endif()

set(CMAKE_EXECUTABLE_SUFFIX ".elf")

add_executable(${PROJECT_NAME} src/main.cpp)

if(MCU STREQUAL "atmega328p")
    add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -O ihex -R .eeprom ${PROJECT_NAME}.elf ${PROJECT_NAME}.hex
        COMMENT "Generating HEX file for upload"
    )
endif()