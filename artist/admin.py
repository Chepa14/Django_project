from django.contrib import admin
from artist.models import Artist, Song
from django.contrib.messages import ERROR

admin.site.register(Song)


@admin.register(Artist)
class ArtistAdmin(admin.ModelAdmin):

    def get_deleted_objects(self, objs, request):
        deleted_objects, model_count, perms_needed, protected =\
            super(ArtistAdmin, self).get_deleted_objects(objs, request)
        artists_id = [el.id for el in objs]
        songs = Song.objects.filter(author__pk__in=artists_id)
        if songs.count() > 0:
            self.message_user(request, "You can't delete artist with songs!", level=ERROR)
            return deleted_objects, model_count, {'Artists with songs'}, protected
        else:
            return deleted_objects, model_count, perms_needed, protected
