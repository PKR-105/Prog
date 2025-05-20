from config import *
from sensors.gas_sensor import GasSensor
from sensors.flame_sensor import FlameSensor
from sensors.dht11_sensor import DHT11Sensor
from utils.alerts import AlertSystem
from utils.server_comms import ServerComms
import time

# Initialize sensors
gas_sensor = GasSensor(MQ2_PIN)
flame_sensor = FlameSensor(FLAME_PIN)
dht_sensor = DHT11Sensor(DHT_PIN)
alerts = AlertSystem(BUZZER_PIN, RELAY_PIN)

def main():
    while True:
        # Read sensor data
        gas_value = gas_sensor.read()
        flame_detected = flame_sensor.read()
        humidity, temperature = dht_sensor.read()

        # Check thresholds
        if (gas_value > GAS_THRESHOLD or 
            flame_detected == FLAME_THRESHOLD or 
            temperature > TEMP_THRESHOLD or 
            humidity > HUMIDITY_THRESHOLD):
            alerts.trigger()

        # Send data to server
        data = {
            "gas": gas_value,
            "flame": flame_detected,
            "temp": temperature,
            "humidity": humidity
        }
        ServerComms.send_data(data)

        time.sleep(5)  # Delay between readings

if __name__ == "__main__":
    main()