import pytz

from django.utils import timezone


class TimezoneMiddleware(object):
    """
    Middleware to properly handle the users timezone
    """

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        tz_name = request.headers.get('Timezone', None)
        tz = pytz.timezone(tz_name)
        timezone.activate(tz)
        response = self.get_response(request)
        return response
