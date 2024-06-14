from django.db import models
from django.conf import settings
from django.utils import timezone
from phonenumber_field.modelfields import PhoneNumberField
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin

User = settings.AUTH_USER_MODEL


class CustomUserManager(BaseUserManager):
    def create_user(self, username, email, password, **extra_fields):
        extra_fields.setdefault("is_staff", False)
        extra_fields.setdefault("is_superuser", False)
        extra_fields.setdefault("is_active", True)

        if not username:
            raise ValueError('User must have a username!')
        if not email:
            raise ValueError('User must have an email address!')

        username = self.model.normalize_username(username)
        email = self.normalize_email(email)

        user = self.model(username=username,
                          email=email,
                          **extra_fields)
        user.set_password(password)
        user.save()
        return user

    def create_superuser(self, username, email, password, **extra_fields):
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)
        extra_fields.setdefault("is_active", True)

        if not username:
            raise ValueError('User must have a username!')
        if not email:
            raise ValueError('User must have an email address!')

        user = self.create_user(username=username,
                                email=email,
                                password=password,
                                **extra_fields)
        user.set_password(password)
        user.save()
        return user


class CustomUser(AbstractBaseUser, PermissionsMixin):
    username = models.CharField(verbose_name='username', max_length=30, unique=True)
    email = models.EmailField(verbose_name='email address', max_length=255, unique=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    image = models.ImageField(null=True, blank=True, upload_to='images/user_images/',
                              default='images/user_images/no_photo.jpg')
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    date_joined = models.DateTimeField(default=timezone.now)

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['email']

    objects = CustomUserManager()

    class Meta:
        verbose_name = 'Users'
        verbose_name_plural = 'Users'

    def __str__(self):
        return self.username

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True


class MotoHubInformation(models.Model):
    moto_hub_name = models.CharField(max_length=20)
    phone_number = PhoneNumberField(null=False, blank=True, unique=False)
    email = models.EmailField(max_length=100, null=False, blank=True, unique=False)
    facebook = models.TextField()
    instagram = models.TextField()
    linkedin = models.TextField()
    address = models.CharField(max_length=100)
    google_map = models.TextField()
    working_days_schedule = models.CharField(max_length=50)
    saturday_schedule = models.CharField(max_length=50)
    sunday_schedule = models.CharField(max_length=50)

    class Meta:
        db_table = 'moto_hub_information'
        ordering = ['moto_hub_name']
        managed = True
        verbose_name = 'MotoHub information'
        verbose_name_plural = 'MotoHub information'

    def __str__(self):
        return f"{str(self.moto_hub_name)}"


class MotorcycleBrands(models.Model):
    moto_hub = models.ForeignKey(MotoHubInformation, on_delete=models.CASCADE,
                                 related_name='motorcycle_brands_info')
    brand_name = models.CharField(max_length=20)
    brand_image = models.ImageField(null=True, blank=True, upload_to='images/motorcycle_brand_images/',
                                    default='images/no_photo.jpg')

    class Meta:
        db_table = 'motorcycle_brands'
        ordering = ['brand_name']
        managed = True
        verbose_name = 'Motorcycle brands'
        verbose_name_plural = 'Motorcycle brands'

    def __str__(self):
        return f"{str(self.brand_name)}"


class Motorcycles(models.Model):
    motorcycle_brand = models.ForeignKey(MotorcycleBrands, on_delete=models.CASCADE,
                                         related_name='motorcycles_info')
    motorcycle_model = models.CharField(max_length=20)
    motorcycle_image = models.ImageField(null=True, blank=True, upload_to='images/motorcycle_images/')
    model_years_of_production = models.CharField(max_length=20)
    engine_capacity = models.CharField(max_length=10)
    engine_type = models.CharField(max_length=70)
    engine_hp = models.CharField(max_length=10)
    cooling_system_type = models.CharField(max_length=15)
    number_of_gears = models.IntegerField()
    fuel_tank_capacity = models.CharField(max_length=10)
    weight = models.CharField(max_length=10)
    motorcycle_description = models.TextField()

    class Meta:
        db_table = 'motorcycles'
        ordering = ['motorcycle_brand', 'motorcycle_model']
        managed = True
        verbose_name = 'Motorcycles'
        verbose_name_plural = 'Motorcycles'

    def __str__(self):
        return f"{str(self.motorcycle_model)}"


class FavoriteMotorcycles(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    motorcycle = models.ForeignKey(Motorcycles, on_delete=models.CASCADE)

    class Meta:
        db_table = 'favorite_motorcycles'
        ordering = ['user', 'motorcycle']
        managed = True
        verbose_name = 'Favorite motorcycles'
        verbose_name_plural = 'Favorite motorcycles'

    def __str__(self):
        return f"{str(self.user)} ({str(self.motorcycle)})"
