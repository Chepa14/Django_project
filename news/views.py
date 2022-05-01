from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView, ListAPIView
from rest_framework.permissions import IsAuthenticatedOrReadOnly, AllowAny
from news.permissions import IsAuthorOrReadAndCreate
from news.serializers import NewsSerializer, CommentSerializer
from news.models import News, Comment
from news.filters import NewsListFilter
from django.shortcuts import get_object_or_404
from recommendation.news import recommend_by_title, recommended_by_same_author, create_news_cosine_sim_matrix


class CommentsListCreateAPIView(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly, IsAuthorOrReadAndCreate)
    serializer_class = CommentSerializer
    queryset = Comment.objects.all()

    def perform_create(self, serializer):
        news = get_object_or_404(News, pk=self.kwargs['pk'])
        serializer.save(author=self.request.user, news=news)
        create_news_cosine_sim_matrix()

    def get_queryset(self):
        return Comment.objects.filter(news__id=self.kwargs["pk"])


class NewsRetrieveUpdateDestroyAPIView(RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly, IsAuthorOrReadAndCreate)
    serializer_class = NewsSerializer
    queryset = News.objects.all()


class NewsTitleRecommendationsListAPIView(ListAPIView):
    permission_classes = (AllowAny,)
    serializer_class = NewsSerializer

    def get_queryset(self):
        parsed_kwargs = self.kwargs["title_limit"].split('_')
        if len(parsed_kwargs) == 1:
            return recommend_by_title(title=parsed_kwargs[0])[0]
        else:
            return recommend_by_title(title=parsed_kwargs[0],
                                      n=int(parsed_kwargs[-1]))[0]


class NewsSameAuthorRecommendationsListAPIView(ListAPIView):
    permission_classes = (AllowAny,)
    serializer_class = NewsSerializer

    def get_queryset(self):
        parsed_kwargs = self.kwargs["authorID_limit"].split('_')
        if len(parsed_kwargs) == 1:
            return recommended_by_same_author(author_id=int(parsed_kwargs[0]))
        else:
            return recommended_by_same_author(author_id=int(parsed_kwargs[0]),
                                              limit=int(parsed_kwargs[1]))


class NewsListCreateAPIView(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = NewsSerializer
    filterset_class = NewsListFilter
    queryset = News.objects.order_by('create_datetime').reverse()

    def perform_create(self, serializer):
        serializer.save(author=self.request.user)
