from .shared_utils import helper_function
import random  # Simulate sensor readings (replace with actual GPIO code for Raspberry Pi/ESP)

class GasSensor:
    def __init__(self, pin):
        self.pin = pin

    def read(self):
        # Simulate MQ2 output (0-1023)
        return random.randint(0, 1000)  # Replace with `analogRead(pin)` on ESP