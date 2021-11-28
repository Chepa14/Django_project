from django.shortcuts import render
from artist.models import Artist
from news.models import News


def home(request):
    artists = Artist.objects.all()
    news = News.objects.all()

    bckg_img = "https://wallpapers-hub.art/wallpaper-images/781042.jpg"
    hip_hop_icon = "https://iconsplace.com/wp-content/uploads/_icons/ffffff/256/png/music-icon-18-256.png"
    bckg_img_top = "https://www.birthplacemag.com/wp-content/uploads/2015/03/kendrick-lamar-pimp-butterfly.jpg"

    return render(
        request,
        "index.html",
        {
            "artists": artists,
            "background_img": bckg_img,
            "icon": hip_hop_icon,
            "background_img_top": bckg_img_top,
            "news": news,
        },
    )
