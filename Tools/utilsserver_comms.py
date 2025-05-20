import requests
from config import SERVER_URL

class ServerComms:
    @staticmethod
    def send_data(data):
        try:
            response = requests.post(SERVER_URL, json=data)
            return response.status_code == 200
        except Exception as e:
            print(f"Server error: {e}")
            return False