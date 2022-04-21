import json
import requests
from rest_framework.decorators import api_view
from rest_framework.response import Response


@api_view(['POST'])
def get_spotify_user(request):
    print(request.data)
    session = requests.Session()
    print(request.COOKIES)

    cookies = {'sp_dc': request.data.get('sp_dc'),
               'sp_key': request.data.get('sp_key')}

    response = session.get("https://open.spotify.com/get_access_token?reason=transport&productType=web_player",
                           cookies=cookies)
    response.raise_for_status()
    data = response.content.decode("utf-8")
    config = json.loads(data)

    return Response(config)
