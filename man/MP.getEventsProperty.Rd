\name{MP.getEventsProperty}
\alias{MP.getEventsProperty}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Get unique, total, or average data for of a single event and property over days, weeks, or months.}
\description{Get unique, total, or average data for of a single event and property over days, weeks, or months. For more information go to https://mixpanel.com/help/reference/data-export-api#event-properties}
\usage{
MP.getEventsProperty(api_secret = NULL, event = NULL, property = NULL, values = NULL, type = "general", unit = "day", interva = NULL, from_date = Sys.Date() - 10, to_date = Sys.Date(), limit = 10000)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{api_secret}{Your API Mixpanel secret, you can find hin in mixpanel web interface: Account (http://img.netpeak.ua/alsey/150600941068_kiss_10kb.png) > Projects (http://img.netpeak.ua/alsey/150600948369_kiss_46kb.png)}
  \item{event}{The event or events that you wish to get data for, example c("play song", "log in", "add playlist")}
  \item{property}{The name of the property you would like to get data for. For example  "mp_country_code"}
  \item{values}{The specific property values that you would like to get data for Example: If you have a property "gender" you may have values "male", "female" and "unknown". If you just want data for female and unknown users, you can include a values property that looks like "["female", "unknown"]"}
  \item{type}{The analysis type you would like to get data for - such as general, unique, or average events. Valid values: "general", "unique", or "average"}
  \item{unit}{This can be "minute", "hour", "day", "week", or "month". It determines the level of granularity of the data you get back. Note that you cannot get hourly uniques.}
  \item{interva}{The number of "units" to return data for - minutes, hours, days, weeks, or months. 1 will return data for the current unit (minute, hour, day, week or month). 2 will return the current and previous units, and so on. Specify either interval or from_date and to_date.}
  \item{from_date}{The first date to return data for, in yyyy-mm-dd format. This date is inclusive. Specify either interval or from_date and to_date.}
  \item{to_date}{The last date to return data for, in yyyy-mm-dd format. This date is inclusive. Specify either interval or from_date and to_date.}
  \item{limit}{The maximum number of values to return. }
}
\details{
For details go https://mixpanel.com/help/reference/data-export-api#event-properties
}
\value{Data frame with data from Mixpanel API.}
\author{Alexey Seleznev}

\examples{
MP_super_test2 <- MP.getEventsProperty(api_secret = "abcdefg123456",
                                       event = c("$custom_event:585946"),
                                       property = "mp_country_code",
                                       type = "general",
                                       unit = "day",
                                       from_date = "2017-07-01",
                                       to_date = "2017-07-25")
  }

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
