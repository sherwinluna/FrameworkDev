from django.shortcuts import render
from rest_framework import generics, status, viewsets, permissions, filters
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from django.contrib.auth import authenticate
from .models import User, Product
from .serializers import UserSerializer, ProductSerializer
from rest_framework.permissions import IsAuthenticated, IsAuthenticatedOrReadOnly
from rest_framework.views import APIView

# Register new users
class RegisterView(generics.CreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [permissions.AllowAny]  # Allow all users to register

# Login existing users
class LoginView(generics.GenericAPIView):
    permission_classes = [permissions.AllowAny]  # Allow unauthenticated users

    def post(self, request):
        identifier = request.data.get('username_or_email')  # Accept username or email
        password = request.data.get('password')

        # Check if identifier is an email or username
        try:
            if '@' in identifier:
                user = User.objects.get(email=identifier)  # Find user by email
                user = authenticate(username=user.username, password=password)  # Authenticate using username
            else:
                user = authenticate(username=identifier, password=password)  # Authenticate with username

            if user:
                token, _ = Token.objects.get_or_create(user=user)
                return Response({'token': token.key, 'user_id': user.id}, status=status.HTTP_200_OK)
        except User.DoesNotExist:
            pass

        return Response({'error': 'Invalid Credentials'}, status=status.HTTP_400_BAD_REQUEST)

class LogoutView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        # Remove the user's token from the server
        request.user.auth_token.delete()
        return Response({"message": "Logout successful"}, status=status.HTTP_200_OK)

# Product ViewSet to handle CRUD operations
class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    permission_classes = [IsAuthenticatedOrReadOnly]
    filter_backends = [filters.SearchFilter]
    search_fields = ['name', 'description']

    def get_queryset(self):
        queryset = super().get_queryset()
        # Filter by category if provided
        category = self.request.query_params.get('category')
        if category:
            queryset = queryset.filter(category=category)
        
        # Get the search query
        search_query = self.request.query_params.get('search')
        if search_query:
            queryset = queryset.filter(name__icontains=search_query)
        
        return queryset