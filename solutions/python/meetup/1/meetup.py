import calendar
from datetime import date

weekdays = [day for day in calendar.day_name]

def meetup_day(year, month, weekday, descriptor):
    day_index = weekdays.index(weekday)
    dates = [
            week[day_index]
            for week in calendar.monthcalendar(year, month)
            if week[day_index]
            ]
    if descriptor == 'teenth':
        day = [day for day in dates if day > 12 and day < 20][0]
    elif descriptor == 'first':
        day = dates[0]
    elif descriptor == 'last':
        day = dates[-1]
    else:
        day = dates[int(descriptor[0]) - 1]

    return date(year, month, day)