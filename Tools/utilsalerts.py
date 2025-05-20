class AlertSystem:
    def __init__(self, buzzer_pin, relay_pin):
        self.buzzer_pin = buzzer_pin
        self.relay_pin = relay_pin

    def trigger(self, duration=1):
        print(f"ALERT: Buzzer ON, Relay ON for {duration} sec")  # Replace with GPIO calls
        # GPIO.output(self.buzzer_pin, GPIO.HIGH)
        # GPIO.output(self.relay_pin, GPIO.HIGH)
        # time.sleep(duration)
        # GPIO.output(self.buzzer_pin, GPIO.LOW)
        # GPIO.output(self.relay_pin, GPIO.LOW)