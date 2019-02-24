#install.packages('lubridate')
library(lubridate)

tday <- today()
tday

#Extract year month day from a date

year(tday)
month(tday)
day(tday)

#Extract weekday - Sunday is 1
wday(tday)
wday(tday, label = TRUE)

#Date time 
memt <- now()
memt

hour(memt)
minute(memt)
second(memt)

#Date parsing or conversions

class(tday)

# Pass a string to be read as date
dat1 <- ymd("2017-12-23")
dat1

class(dat1)

dat2 <- ymd("2017 May 25")
dat2


now()
now("EST")
# Origin is the date-time for 1970-01-01 UTC in POSIXct format. 
# This date-time is the origin for the numbering system used by POSIXct, POSIXlt, chron, and Date classes.
origin

#x days since origin
origin + days(1)
origin + months(11)
origin + years(2)

#next date
today() + days(1)
today() + months(1)

#next date
now() + days(1)

#previous day
today() - days(1)

#Sequence of next 9 days
today() + c(0:9) * days(1)

#Sequence of alternate day ---- simialr logic for months etc. as well
today() + c(0:9) * days(2)

#first date of month
floor_date(today(),"month")

#first day of next month
floor_date(today(),"month") + months(1)

#last day of current month
(floor_date(today(),"month") + months(1)) - days(1)

#first day of this year
floor_date(today(),"year")

# last day of current year
(floor_date(today(),"year") + months(1)) - days(1)

# difference between two dates in days
d1 <- today() + years(5)
d1 - today()

d2 <- today() + days(1)
d2 - today()

yearsdiff <- year(d2) - year(as.Date("2017-02-23"))
monthsdiff <- month(d2) - month(as.Date("2017-03-23"))
daysdiff <- day(d2) - day(as.Date("2017-02-23"))


length(seq(from=today(), to=d2, by="month")) - 1
length(seq(from=today(), to=d1, by="year")) - 1


