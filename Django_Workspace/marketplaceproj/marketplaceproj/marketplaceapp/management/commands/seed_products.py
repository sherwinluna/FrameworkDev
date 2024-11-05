from django.core.management.base import BaseCommand
from marketplaceapp.models import Product

class Command(BaseCommand):
    def handle(self, *args, **kwargs):
        products = [
            {
                'name': 'Premium Laptop',
                'description': 'High-performance laptop for professionals',
                'price': 1299.99,
                'image_url': 'https://placeholder.com/electronics/laptop1.jpg',
                'category': 'Electronics'
            },
            {
                'name': 'Wireless Headphones',
                'description': 'Noise-cancelling Bluetooth headphones',
                'price': 199.99,
                'image_url': 'https://placeholder.com/electronics/headphones1.jpg',
                'category': 'Electronics'
            },
            {
                'name': 'Smart Watch',
                'description': 'Fitness tracking smartwatch',
                'price': 299.99,
                'image_url': 'https://placeholder.com/electronics/watch1.jpg',
                'category': 'Electronics'
            },
            # Add more products as needed
        ]
        
        for product_data in products:
            Product.objects.create(**product_data)
            self.stdout.write(self.style.SUCCESS(f"Successfully added {product_data['name']}"))