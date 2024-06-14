from .models import CustomUser
from rest_framework.views import APIView
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from .models import MotoHubInformation, MotorcycleBrands, FavoriteMotorcycles
from .serializer import MotoHubInformationSerializer, MotorcyclesFullInformationSerializer


class MotoHubInformationData:
    @staticmethod
    def get():
        moto_hub_info = MotoHubInformationSerializer(MotoHubInformation.objects, many=True)
        return moto_hub_info.data


class MotoHubInformationView(APIView):
    permission_classes = (AllowAny,)

    @staticmethod
    def get(request):
        moto_hub_info = MotoHubInformationData.get()
        return Response({'moto_hub_information': moto_hub_info})


class FullMotorcyclesInformationData:
    @staticmethod
    def get():
        full_motorcycles_info = MotorcyclesFullInformationSerializer(MotorcycleBrands.objects, many=True)
        return full_motorcycles_info.data


class FullMotorcyclesInformationView(APIView):
    permission_classes = (AllowAny,)

    @staticmethod
    def get(request):
        full_motorcycles_info = FullMotorcyclesInformationData.get()
        return Response({'full_motorcycles_information': full_motorcycles_info})


class Registration(APIView):
    permission_classes = (AllowAny,)

    @staticmethod
    def post(request):
        try:
            user_data = request.data
            username = user_data.get("username")
            first_name = user_data.get("first_name")
            last_name = user_data.get("last_name")
            email = user_data.get("email")
            password = user_data.get("password")

            if CustomUser.objects.filter(username=username).exists():
                raise NameError
            elif CustomUser.objects.filter(email=email).exists():
                raise ValueError
            else:
                user = CustomUser.objects.create_user(username=username,
                                                      password=password,
                                                      first_name=first_name,
                                                      last_name=last_name,
                                                      email=email,
                                                      image='images/user_images/no_photo.jpg',
                                                      is_active=True,
                                                      is_staff=False,
                                                      is_superuser=False)
                user.set_password(password)
                user.save()

                print(f'User profile `{username}` has been created!')
                return Response(f"Message: user register is success!")

        except NameError:
            return Response(f"Error: username is already taken!")
        except ValueError:
            return Response(f"Error: email is already taken!")


class UserProfileView(APIView):
    permission_classes = (AllowAny,)

    @staticmethod
    def get(request):
        try:
            user_id = request.user.id
            username = request.user.username
            first_name = request.user.first_name
            last_name = request.user.last_name
            email = request.user.email
            image = request.user.image

            favorite_motorcycles_id_list = []
            favorite_motorcycles_info = FavoriteMotorcycles.objects.filter(user_id=user_id)

            for elem in favorite_motorcycles_info:
                favorite_motorcycles_id_list.append(elem.motorcycle_id)

            user_info = [{f"username: {username}",
                          f"first_name: {first_name}",
                          f"last_name: {last_name}",
                          f"email: {email}",
                          f"image: {image}"}]

            return Response({'user_info': user_info, 'motorcycles_id_list': favorite_motorcycles_id_list})

        except AttributeError:
            return Response(f"User profile error!")


class ImageUploadView(APIView):
    permission_classes = (AllowAny,)

    @staticmethod
    def post(request):
        user_id = request.user.id
        new_profile_info = CustomUser.objects.get(id=user_id)

        new_image = request.FILES.get('image')

        new_profile_info.image = new_image
        new_profile_info.save()

        return Response(f"Image uploaded successfully!")


class UpdateProfileView(APIView):

    @staticmethod
    def post(request):
        try:
            update_data = request.data

            new_username = update_data.get("username")
            new_first_name = update_data.get("first_name")
            new_last_name = update_data.get("last_name")
            new_email = update_data.get("email")
            current_username = update_data.get("current_username")  # If True, NameError don't raise
            current_email = update_data.get("current_email")  # If True, ValueError don't raise

            if current_username is not True and CustomUser.objects.filter(username=new_username).exists():
                raise NameError
            elif current_email is not True and CustomUser.objects.filter(email=new_email).exists():
                raise ValueError

            request.user.username = new_username
            request.user.first_name = new_first_name
            request.user.last_name = new_last_name
            request.user.email = new_email
            request.user.save()

        except NameError:
            return Response(f"Error: username is already taken!")
        except ValueError:
            return Response(f"Error: email is already taken!")
        else:
            return Response(f"User profile updated successfully!")


class AddFavoriteMotorcycleView(APIView):

    @staticmethod
    def post(request):
        try:
            favorite_motorcycle_data = request.data

            user_id = request.user.id
            motorcycle_id = favorite_motorcycle_data.get("motorcycle_id")

            current_motorcycle_info = FavoriteMotorcycles.objects.filter(user_id=user_id, motorcycle_id=motorcycle_id)

            if len(current_motorcycle_info) == 0:
                favorite_motorcycle = FavoriteMotorcycles(user_id=user_id,
                                                          motorcycle_id=motorcycle_id)
                favorite_motorcycle.save()
                return Response(f"Favorite motorcycle successfully added!")
            else:
                raise AssertionError

        except AssertionError:
            return Response(f"This motorcycle is already in the list of favorites!")
        except AttributeError:
            return Response(f"Adding favorite motorcycle error!")


class DeleteFavoriteMotorcycleView(APIView):

    @staticmethod
    def post(request):
        try:
            favorite_motorcycle_data = request.data

            user_id = request.user.id
            motorcycle_id = favorite_motorcycle_data.get("motorcycle_id")
            FavoriteMotorcycles.objects.filter(user_id=user_id, motorcycle_id=motorcycle_id).delete()

        except AttributeError:
            return Response(f"Deleting favorite motorcycle error!")
        return Response(f"Favorite motorcycle successfully deleted!")
