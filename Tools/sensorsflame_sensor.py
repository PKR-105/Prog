class FlameSensor:
    def __init__(self, pin):
        self.pin = pin

    def read(self):
        # Simulate flame detection (False = flame detected)
        return False  # Replace with `digitalRead(pin)` on ESP