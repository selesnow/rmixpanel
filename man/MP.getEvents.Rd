\name{MP.getEvents}
\alias{MP.getEvents}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get unique, total, or average data for a set of events over N days, weeks, or months.
}
\description{
Get unique, total, or average data for a set of events over N days, weeks, or months. For more detail go https://mixpanel.com/help/reference/data-export-api#events
}
\usage{
MP.getEvents(api_secret = NULL, event = NULL, type = "general", unit = "day", interva = NULL, from_date = Sys.Date() - 10, to_date = Sys.Date())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{api_secret}{Your API Mixpanel secret, you can find hin in mixpanel web interface: Account (http://img.netpeak.ua/alsey/150600941068_kiss_10kb.png) > Projects (http://img.netpeak.ua/alsey/150600948369_kiss_46kb.png)}
  \item{event}{The event or events that you wish to get data for, example c("play song", "log in", "add playlist")}
  \item{type}{The analysis type you would like to get data for - such as general, unique, or average events. Valid values: "general", "unique", or "average"}
  \item{unit}{This can be "minute", "hour", "day", "week", or "month". It determines the level of granularity of the data you get back. Note that you cannot get hourly uniques.}
  \item{interva}{The number of "units" to return data for - minutes, hours, days, weeks, or months. 1 will return data for the current unit (minute, hour, day, week or month). 2 will return the current and previous units, and so on. Specify either interval or from_date and to_date.}
  \item{from_date}{The first date to return data for, in yyyy-mm-dd format. This date is inclusive. Specify either interval or from_date and to_date.}
  \item{to_date}{The last date to return data for, in yyyy-mm-dd format. This date is inclusive. Specify either interval or from_date and to_date.}
}
\details{
For more information go https://mixpanel.com/help/reference/data-export-api#events
}
\value{Data frame with data from Mixpanel account.}
\author{Alexey Seleznev}
\examples{
MP_test <- MP.getEvents(api_secret = "abcdefg123456",
                        event = c("posting_success","emu","session_start","$custom_event:585946"),
                        type = "general",
                        unit = "day",
                        from_date = "2017-07-01",
                        to_date = "2017-07-25")
  }

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
