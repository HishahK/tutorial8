
from django.http import JsonResponse
from .models import mobil  # Sesuaikan dengan model Anda

def mobil_list(request):
    mobil = list(Mobil.objects.values())
    return JsonResponse(mobil, safe=False)
