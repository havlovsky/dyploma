from rest_framework.serializers import ModelSerializer
from .models import MotoHubInformation, Motorcycles, MotorcycleBrands


class MotoHubInformationSerializer(ModelSerializer):
    class Meta:
        model = MotoHubInformation
        fields = ['moto_hub_name',
                  'phone_number',
                  'email',
                  'facebook',
                  'instagram',
                  'linkedin',
                  'address',
                  'google_map',
                  'working_days_schedule',
                  'saturday_schedule',
                  'sunday_schedule']


class MotorcyclesInformationSerializer(ModelSerializer):
    class Meta:
        model = Motorcycles
        fields = ['id',
                  'motorcycle_model',
                  'motorcycle_image',
                  'model_years_of_production',
                  'engine_capacity',
                  'engine_type',
                  'engine_hp',
                  'cooling_system_type',
                  'number_of_gears',
                  'fuel_tank_capacity',
                  'weight',
                  'motorcycle_description']


class MotorcyclesFullInformationSerializer(ModelSerializer):
    motorcycles_info = MotorcyclesInformationSerializer(many=True, read_only=True)

    class Meta:
        model = MotorcycleBrands
        fields = ['id',
                  'brand_name',
                  'brand_image',
                  'motorcycles_info']
