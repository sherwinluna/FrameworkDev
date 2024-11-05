import os
import django
from django.conf import settings
from mysql.connector import Error
import mysql.connector

# Set up Django environment
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "marketplaceproj.settings")  # Adjust this if your project name is different
django.setup()

def test_connection():
    try:
        # Access the database settings from Django settings
        db_config = settings.DATABASES['default']
        
        connection = mysql.connector.connect(
            host=db_config['HOST'],
            database=db_config['NAME'],
            user=db_config['USER'],
            password=db_config['PASSWORD']
        )
        
        if connection.is_connected():
            print("Successfully connected to the database")
            db_info = connection.get_server_info()
            print("Server version:", db_info)

    except Error as e:
        print("Error while connecting to MySQL:", e)

    finally:
        if 'connection' in locals() and connection.is_connected():
            connection.close()
            print("Database connection closed")

if __name__ == "__main__":
    test_connection()
