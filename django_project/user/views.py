from django.shortcuts import render

# Create your views here.
hip_hop_icon = "https://iconsplace.com/wp-content/uploads/_icons/ffffff/256/png/music-icon-18-256.png"

def about(request):
    return render(
        request,
        "about.html",
        {"icon": hip_hop_icon}
    )

def albums(request):
    return render(
        request,
        "album.html",
        {"icon": hip_hop_icon}
    )

def blog(request):
    return render(
        request,
        "blog.html",
        {"icon": hip_hop_icon}
    )

def contact(request):
    return render(
        request,
        "contact.html",
        {"icon": hip_hop_icon}
    )
