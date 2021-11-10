import pytz

from django.utils import timezone


class TimezoneMiddleware(object):
    """
    Middleware to properly handle the users timezone
    """

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        tz_name = request.COOKIES.get('timezone', None)
        tz = pytz.timezone(tz_name)
        if request.user.is_authenticated:
            timezone.activate(tz)
        else:
            timezone.deactivate()
        response = self.get_response(request)
        return response
