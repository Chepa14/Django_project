from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from news.permissions import AuthorEditPermissions
from news.serializers import NewsSerializer, CommentSerializer
from news.models import News, Comment
from news.filters import NewsListFilter


class CommentsListCreateAPIView(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly, AuthorEditPermissions)
    serializer_class = CommentSerializer
    queryset = Comment.objects.all()

    def perform_create(self, serializer):
        news = News.objects.get(pk=self.kwargs['pk'])
        serializer.save(author=self.request.user, news=news)

    def get_queryset(self):
        return Comment.objects.filter(news__id=self.kwargs["pk"])


class NewsRetrieveUpdateDestroyAPIView(RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly, AuthorEditPermissions)
    serializer_class = NewsSerializer
    queryset = News.objects.all()


class NewsListCreateAPIView(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = NewsSerializer
    filterset_class = NewsListFilter
    queryset = News.objects.all()

    def perform_create(self, serializer):
        serializer.save(author=self.request.user)
