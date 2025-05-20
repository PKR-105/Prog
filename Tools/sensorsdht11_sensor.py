import Adafruit_DHT  # For Raspberry Pi (use `dht` library for ESP)

class DHT11Sensor:
    def __init__(self, pin):
        self.pin = pin
        self.sensor = Adafruit_DHT.DHT11

    def read(self):
        humidity, temperature = Adafruit_DHT.read_retry(self.sensor, self.pin)
        return humidity, temperature