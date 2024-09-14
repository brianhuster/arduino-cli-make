FQBN = arduino:avr:uno
MONITOR_PORT = /dev/ttyUSB0


all:
    arduino-cli compile --output-dir=build --fqbn $(FQBN) $(notdir $(CURDIR)).ino

upload:
    arduino-cli upload --input-dir=build -b $(FQBN) -p $(MONITOR_PORT) $(CURDIR)

ispload:
    arduino-cli upload --input-dir=build -b $(FQBN) -P usbasp $(CURDIR)

burn_bootloader:
    arduino-cli burn-bootloader -b $(FQBN) -P usbasp -v $(CURDIR)

clean:
    rm -rf $(CURDIR)/build

monitor:
    screen $(MONITOR_PORT) 115200
