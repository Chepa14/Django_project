from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from .serializers import ArtistSerializer
from .models import Artist


class ArtistView(RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ArtistSerializer
    queryset = Artist.objects.all()
    lookup_field = 'id'


class ArtistList(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ArtistSerializer
    queryset = Artist.objects.all()
