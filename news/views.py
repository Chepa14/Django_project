from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from news.permissions import AuthorEditPermissions
from news.serializers import NewsSerializer, CommentSerializer
from news.models import News, Comment
from news.filters import NewsListFilter, CommentsListFilter


class CommentsListCreateAPIView(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly, AuthorEditPermissions)
    serializer_class = CommentSerializer
    filterset_class = CommentsListFilter
    queryset = Comment.objects.all()

    def perform_create(self, serializer):
        news = News.objects.get(pk=self.kwargs['id'])
        serializer.save(author=self.request.user, news=news)


class NewsRetrieveUpdateDestroyAPIView(RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly, AuthorEditPermissions)
    serializer_class = NewsSerializer
    queryset = News.objects.all()
    lookup_field = "id"


class NewsListCreateAPIView(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = NewsSerializer
    filterset_class = NewsListFilter
    queryset = News.objects.all()

    def perform_create(self, serializer):
        serializer.save(author=self.request.user)
