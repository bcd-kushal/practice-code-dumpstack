import pytz
from datetime import datetime, timedelta

str = '23-05-14 04:28:24+08:00'
time_str = str[:-6]
print('>>>>>>>>>>>>',time_str)
time_str = datetime.strptime(time_str, '%Y-%m-%d %H:%M:%S')
gmt_time = time_str - timedelta(hours=8)
# Set timezone for input datetime object as GMT
gmt_timezone = pytz.timezone("GMT")
gmt_time = gmt_timezone.localize(gmt_time)
# Convert GMT time to Pacific Time
user_timezone = pytz.timezone("Australia/Sydney")
user_time = gmt_time.astimezone(user_timezone)
user_time = user_time.strftime("[ %H:%M ]  %B %d")
              
              