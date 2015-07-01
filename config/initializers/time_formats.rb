date_formats = {
    :bob => '%d-%m-%Y' # 13-01-2014
}

Time::DATE_FORMATS.merge! (date_formats)
Date::DATE_FORMATS.merge! (date_formats)