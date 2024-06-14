from django.contrib import admin
from django.contrib.auth import admin as auth_admin
from django.contrib.auth.models import Group
from .models import CustomUser, MotoHubInformation, MotorcycleBrands, Motorcycles, FavoriteMotorcycles


admin.site.unregister(Group)
admin.site.register(CustomUser)


class UserAdmin(auth_admin.UserAdmin):
    model = CustomUser
    change_password_form = auth_admin.AdminPasswordChangeForm

    list_display = ['username', 'email', 'is_active', 'is_staff', 'is_superuser']
    search_fields = ['username', 'email']
    readonly_fields = ('last_login', 'date_joined',)
    list_filter = ['is_active', 'is_staff', 'is_superuser']

    ordering = ['-is_superuser']

    fieldsets = (('Personal info', {'fields': ('username', 'image', 'first_name', 'last_name',
                                               'email', 'password',)}),
                 ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser')}),
                 ('Important dates', {'fields': ('date_joined', 'last_login')}))


admin.site.unregister(CustomUser)
admin.site.register(CustomUser, UserAdmin)

admin.site.register(MotoHubInformation)
admin.site.register(MotorcycleBrands)
admin.site.register(Motorcycles)
admin.site.register(FavoriteMotorcycles)
