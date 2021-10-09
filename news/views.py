from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import IsAuthenticatedOrReadOnly, IsAuthenticated
from rest_framework.decorators import api_view, permission_classes
from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404
from news.serializers import NewsSerializer, CommentSerializer
from django.urls import reverse
from news.models import News, Comment
from django.db.models import Value as V
from django.db.models.functions import Concat
from django.db.models import Q


@api_view(['POST'])
@permission_classes((IsAuthenticated,))
def comment_news(request, id):
    news = get_object_or_404(News, id=id)
    text = request.data['text']
    comment = Comment.objects.create(news=news, author=request.user, text=text, created_on=None)
    news.comments.add(comment)
    return HttpResponseRedirect(reverse('news', args=[id]))


class NewsView(RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = NewsSerializer
    queryset = News.objects.all()
    lookup_field = 'id'


class NewsList(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = NewsSerializer

    def get_queryset(self):
        search_name = self.kwargs.get("search_name")
        if search_name:
            return News.objects.filter(
                Q(title__icontains=search_name) | Q(tags__pseudonym__icontains=search_name)
            ).distinct()
        else:
            return News.objects.all()
