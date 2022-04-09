from django_pandas.io import read_frame
from numpy import savetxt, loadtxt
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import pandas as pd

from artist.models import Artist

ARTIST_SIM_SCV = './recommendation/csv/artist_genre_sim.csv'


def get_artists(id_list: list) -> list:
    return [Artist.objects.get(pk=id) for id in id_list]


def create_artist_cosine_sim_matrix():
    df = read_frame(Artist.objects.values('id', 'genre'))
    count = CountVectorizer(ngram_range=(1, 2))
    count_matrix = count.fit_transform(df['genre'])
    cosine_sim = cosine_similarity(count_matrix, count_matrix)
    savetxt(ARTIST_SIM_SCV, cosine_sim, delimiter=',')
    return cosine_sim


def load_artist_genre_cosine_sim_matrix():
    return loadtxt(ARTIST_SIM_SCV, delimiter=',')


def recommend_by_genre(pseudonym, n=10, df=None) -> (list, pd.DataFrame):
    if df is None:
        df = read_frame(Artist.objects.values('id', 'pseudonym', 'genre'))
    indices = pd.Series(df['pseudonym'])
    recommended_artists, top_n_indices = [], []
    idx = indices[indices == pseudonym].index
    if len(idx):
        idx = idx[0]
        cosine_sim = load_artist_genre_cosine_sim_matrix()
        score_series_idx = pd.Series(cosine_sim[idx]).sort_values(ascending=False).index
        top_n_indices = list(score_series_idx[:n+1])
        if idx in top_n_indices:
            top_n_indices.remove(idx)
        else:
            top_n_indices.pop(-1)
        recommended_artists = [df.iloc[i].id for i in top_n_indices]

    artist_query = get_artists(recommended_artists)
    return artist_query, df.iloc[top_n_indices]


def recommended_artists_by_likes(df: pd.DataFrame = None, limit=10):
    if df is None:
        return Artist.objects.order_by('likes')[:limit]
    else:
        df.sort_values('likes_number', ascending=False, inplace=True)
        idxs = df.head(limit)['id']
        return get_artists(idxs)
