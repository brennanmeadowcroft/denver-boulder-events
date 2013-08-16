# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
DbeventsRails::Application.initialize!

Time::DATE_FORMATS[:long_ical] = "%Y%m%dT%H%M%SZ" # YYYYMMDDTHHMMSSZ
Time::DATE_FORMATS[:short_ical] = "%Y%m%d" # YYYYMMDD