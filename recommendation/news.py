import re
from django_pandas.io import read_frame
from django.db.models import Q
from numpy import savetxt, loadtxt
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import pandas as pd

from news.models import News

NEWS_SIM_SCV = './recommendation/csv/news_title_sim.csv'


def get_news(id_list: list) -> list:
    return [News.objects.get(pk=id) for id in id_list]


def create_news_cosine_sim_matrix():
    df = read_frame(News.objects.values('id', 'title'))
    df['title'] = df['title'].apply(lambda x: re.sub(r'[^\w]', ' ', x))
    count = CountVectorizer()
    count_matrix = count.fit_transform(df['title'])
    cosine_sim = cosine_similarity(count_matrix, count_matrix)
    savetxt(NEWS_SIM_SCV, cosine_sim, delimiter=',')
    return cosine_sim


def load_news_title_cosine_sim_matrix():
    return loadtxt(NEWS_SIM_SCV, delimiter=',')


def recommend_by_title(title, n=10, df: pd.DataFrame = None) -> (list, pd.DataFrame):
    if df is None:
        df = read_frame(News.objects.values('id', 'title', 'author_id__id'))
    indices = pd.Series(df['title'])
    recommended_news, top_n_indices = [], []
    idx = indices[indices == title].index
    if len(idx):
        idx = idx[0]
        cosine_sim = load_news_title_cosine_sim_matrix()
        score_series_idx = pd.Series(cosine_sim[idx]).sort_values(ascending=False).index
        top_n_indices = list(score_series_idx[:n+1])
        if idx in top_n_indices:
            top_n_indices.remove(idx)
        else:
            top_n_indices.pop(-1)
        recommended_news = [df.iloc[i].id for i in top_n_indices]

    news_query = get_news(recommended_news)
    return news_query, df.iloc[top_n_indices]


def recommended_by_same_author(author_id: int, limit: int = 10, df: pd.DataFrame = None):
    if df is None:
        return News.objects.filter(author__id=author_id)[:limit]
    else:
        return get_news(df[df['author_id__id'] == author_id].head(limit)['id'])


def find_news_by_keywords(keywords: list, limit: int = 10, df: pd.DataFrame = None):
    if df is None:
        q = Q()
        for keyword in keywords:
            q |= Q(title__contains=keyword)
        return News.objects.filter(q).distinct()[:limit]
    else:
        cond = '|'.join(keywords)
        return get_news(df[df['title'].str.contains(cond)].head(limit)['id'])
