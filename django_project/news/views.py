from rest_framework.response import Response
from rest_framework.generics import ListCreateAPIView, GenericAPIView
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from .models import News
from .serializers import NewsSerializer


class NewsView(GenericAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)

    def get(self, request, id=None):
        news = News.objects.get(id=id)
        serializer = NewsSerializer(news)
        return Response(serializer.data)


class NewsList(ListCreateAPIView):
    queryset = News.objects.all()
    serializer_class = NewsSerializer
    permission_classes = (IsAuthenticatedOrReadOnly,)
