from django.shortcuts import render
from django.http import HttpResponse
from .models import Artist, News


# def home(request):
#     return render(request, 'hello.html', {'name': 'Ivan'})
#
#
# def add(request):
#     val1 = int(request.POST['num1'])
#     val2 = int(request.POST['num2'])
#
#     res = val1 + val2
#
#     return render(request, 'result.html', {'result': res})


def home(request):
    artists = [Artist(1,
                      'A$AP ROCKY',
                      'https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300'
                      '/MTU0MDQyNzUyMzgyODA1NzU1/aap-rocky-from-the-film-monster-poses-for-a-portrait-in-the-youtube-x'
                      '-getty-images-portrait-studio-at-2018-sundance-film-festival-on-january-22-2018-in-park-city'
                      '-utah-photo-by-robby-klein_getty-images.jpg',
                      # 'October 3, 1988 (age 32), Harlem, New York City, New York'
                      'It is a long established fact that a reader will be distracted by the readable'
                      'content of a page when looking at its layout.'
                      ),
               Artist(2,
                      'Kanye West',
                      'https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300'
                      '/MTU0OTkwNDUxOTQ5MDUzNDQ3/kanye-west-attends-the-christian-dior-show-as-part-of-the-paris'
                      '-fashion-week-womenswear-fall-winter-2015-2016-on-march-6-2015-in-paris-france-photo-by'
                      '-dominique-charriau-wireimage-square.jpg',
                      # 'June 8, 1977 (age 44), Kanye is one of the most successful artists in Grammy Awards history. As '
                      # 'of 2017 he has won a total of 21 Grammys. Atlanta, Georgia'
                      'It is a long established fact that a reader will be distracted by the readable'
                      'content of a page when looking at its layout.'
                      ),
               Artist(3,
                      'Tupac Shakur',
                      'https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300'
                      '/MTQ3Mzg1Mzg5MzI4NDQzMDYz/tupac_shakur_photo_by_steve_eichner_archive_photos_getty_83928439.jpg',
                      # 'June 16, 1971, September 13, 1996, Tamalpais High School, Paul Laurence Dunbar High School, '
                      # 'Baltimore School for the Arts. New York, New York'
                      'It is a long established fact that a reader will be distracted by the readable'
                      'content of a page when looking at its layout.'
                      ),
               Artist(4,
                      'The Weeknd',
                      'https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300'
                      '/MTU3NTY4MjgwMzE0MjU5MzM5/theweeknd_square.jpg',
                      # 'February 16, 1990 (age 31), Toronto, Canada'
                      'It is a long established fact that a reader will be distracted by the readable'
                      'content of a page when looking at its layout.'
                      )
               ]

    bckg_img = 'https://wallpapers-hub.art/wallpaper-images/781042.jpg'
    hip_hop_icon = 'https://iconsplace.com/wp-content/uploads/_icons/ffffff/256/png/music-icon-18-256.png'
    bckg_img_top = 'https://www.birthplacemag.com/wp-content/uploads/2015/03/kendrick-lamar-pimp-butterfly.jpg'

    news = [News(1,
                 "KANYE WEST'S DONDA LISTENING PARTY COULD'VE ONLY HAPPENED IN ATLANTA",
                 'https://mtv.mtvnimages.com/uri/mgid:ao:image:mtv.com:698956?height=729&width=1296&format=jpg'
                 '&quality=1',
                 ...,
                 '04 August'
                 ),
            News(2,
                 "Travis Scott Signs Production Deal With A24",
                 'https://ssl.ulximg.com/public/userfiles/2021/08/02/GettyImages-1160530138.jpg',
                 ...,
                 '04 August'),
            News(3,
                 "Drake Declares Album Is Finished: 'Certified Lover Boy' On The Way",
                 'https://ssle.ulximg.com/image/355x237/cover/1627705678_c9bc0e5383446613be36959dbdaedca3.jpg'
                 '/010bed3fb75299213d068e47f372ce19/1627705678_bffc8dc1672610ddb052e63a13cc0980.jpg',
                 ...,
                 '03 August')
            ]
    return render(request, 'index.html', {'artists': artists,
                                          'background_img': bckg_img,
                                          'icon': hip_hop_icon,
                                          'background_img_top': bckg_img_top,
                                          'news': news})
