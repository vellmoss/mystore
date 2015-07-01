#Date::DATE_FORMATS[:bob] = '%d-%m-%Y'

=begin
mf ={:bob => '%d-%m-%Y'}
Date::DATE_FORMATS.merge!(mf)
Time::DATE_FORMATS.merge!(mf)
DateTime::DATE_FORMATS.merge!(mf)
=end

=begin
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!({
                                                                          :bob => "%d-%m-%Y"
                                                                      })
=end

# Date
# ----------------------------
Date::DATE_FORMATS.merge!(:default => "%d-%m-%Y")  # 2013-11-03
#Date::DATE_FORMATS[:default] = "&proc"     # November 3rd, 2013
#Date::DATE_FORMATS[:default] = "%B %e, %Y" # November 3, 2013
#Date::DATE_FORMATS[:default] = "%e %b %Y"  # 3 Nov 2013
#Date::DATE_FORMATS[:default] = "%Y%m%d"    # 20131103
#Date::DATE_FORMATS[:default] = "%e %b"     # 3 Nov
#Date::DATE_FORMATS[:default] = ""          # custom


# DateTime
# ----------------------------
DateTime::DATE_FORMATS.merge!(:default => "%d-%m-%Y")  # 2013-11-03 14:22:18
#DateTime::DATE_FORMATS[:default] = "&proc"     # November 3rd, 2013 14:22
#DateTime::DATE_FORMATS[:default] = "%B %e, %Y" # November 3, 2013 14:22
#DateTime::DATE_FORMATS[:default] = "%e %b %Y"  # Sun, 3 Nov 2013 14:22:18 -0700
#DateTime::DATE_FORMATS[:default] = "%Y%m%d"    # 20131103142218
#DateTime::DATE_FORMATS[:default] = "%e %b"     # 3 Nov 14:22
#DateTime::DATE_FORMATS[:default] = ""          # custom

# Time
# ----------------------------
Time::DATE_FORMATS.merge!(:default => "%d-%m-%Y %H:%M:%S")         # 2013-11-03 14:22:18
#Time::DATE_FORMATS[:default] = "&proc"                     # November 3rd, 2013 14:22
#Time::DATE_FORMATS[:default] = "%B %d, %Y %H:%M"           # November 3, 2013 14:22
#Time::DATE_FORMATS[:default] = "%a, %d %b %Y %H:%M:%S %z"  # Sun, 3 Nov 2013 14:22:18 -0700
#Time::DATE_FORMATS[:default] = "%d %b %H:%M"               # 3 Nov 14:22
#Time::DATE_FORMATS[:default] = "%Y%m%d%H%M%S"              # 20131103142218
#Time::DATE_FORMATS[:default] = "%H:%M"                     # 14:22
#Time::DATE_FORMATS[:default] = ""                          # custom

#
#-----------------------------
=begin
Date::DATE_FORMATS.merge!(:default)
Time::DATE_FORMATS.merge!(:default)
DateTime::DATE_FORMATS.merge!(:default)
=end
