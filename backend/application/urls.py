from django.urls import path, include
from .views import (MotoHubInformationView, FullMotorcyclesInformationView, Registration, UserProfileView,
                    ImageUploadView, UpdateProfileView, AddFavoriteMotorcycleView, DeleteFavoriteMotorcycleView)


urlpatterns = [
    path('moto_hub_information/', MotoHubInformationView.as_view()),
    path('motorcycles_information/', FullMotorcyclesInformationView.as_view()),
    path('registration/', Registration.as_view()),
    path('authorization/', include('djoser.urls')),
    path('authorization/', include('djoser.urls.authtoken')),
    path('profile/', UserProfileView.as_view()),
    path('image_upload/', ImageUploadView.as_view()),
    path('update_profile/', UpdateProfileView.as_view()),
    path('add_favorite_motorcycle/', AddFavoriteMotorcycleView.as_view()),
    path('delete_favorite_motorcycle/', DeleteFavoriteMotorcycleView.as_view()),
]
