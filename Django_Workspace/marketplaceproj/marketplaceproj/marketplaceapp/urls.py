from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import RegisterView, LoginView, ProductViewSet

# Register ProductViewSet with the router
router = DefaultRouter()
router.register(r'products', ProductViewSet, basename='product')

# Authentication URLs
auth_urlpatterns = [
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
]

# Final urlpatterns for the app
urlpatterns = [
    path('auth/', include(auth_urlpatterns)),  # Authentication routes under /auth/
    path('', include(router.urls)),           
]
