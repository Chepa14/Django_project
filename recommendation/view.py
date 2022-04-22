from django.views import View
from django.http import JsonResponse
from recommendation.spotify import get_new_releases


class NewReleasesRetrieveAPIView(View):

    def get(self, request, *args, **kwargs):
        response = get_new_releases(limit=4)
        return JsonResponse(response)

