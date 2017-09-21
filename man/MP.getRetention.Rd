\name{MP.getRetention}
\alias{MP.getRetention}
\title{Get cohort analysis.}
\description{Get data by Cohorts, for more information go https://mixpanel.com/help/reference/data-export-api#retention}
\usage{
MP.getRetention(api_secret = NULL, event = NULL, retention_type = "birth", born_event = NULL, born_where = NULL, where = NULL, interval = NULL, interval_count = NULL, unit = "day", on = NULL, from_date = Sys.Date() - 10, to_date = Sys.Date())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{api_secret}{Your API Mixpanel secret, you can find hin in mixpanel web interface: Account (http://img.netpeak.ua/alsey/150600941068_kiss_10kb.png) > Projects (http://img.netpeak.ua/alsey/150600948369_kiss_46kb.png)}
  \item{event}{The event or events that you wish to get data for, example c("play song", "log in", "add playlist")}
  \item{retention_type}{Must be either "birth" or "compounded". Defaults to "birth". For example "compounded"}
  \item{born_event}{The first event a user must do to be counted in a birth retention cohort. Required when retention_type is "birth"; ignored otherwise.}
  \item{born_where}{An expression to filter born_events by. For more info go https://mixpanel.com/help/reference/data-export-api#segmentation-expressions}
  \item{where}{An expression to filter the returning events by. For example 'properties["utm_source"]=="AdWords" and "Brand" in properties["utm_campaign"]', For more information go https://mixpanel.com/help/reference/data-export-api#segmentation-expressions}
  \item{interva}{The number of "units" to return data for - minutes, hours, days, weeks, or months. 1 will return data for the current unit (minute, hour, day, week or month). 2 will return the current and previous units, and so on. Specify either interval or from_date and to_date.}
  \item{interval_count}{The number of intervals you want; defaults to 1. Note that we include a "0th" interval for events which take place less than one interval after the initial event.}
  \item{unit}{his is an alternate way of specifying interval and can be "day", "week", or "month".}
  \item{on}{The property expression to segment the second event on. See the expressions section above. https://mixpanel.com/help/reference/data-export-api#segmentation-expressions}
  \item{from_date}{The first date to return data for, in yyyy-mm-dd format. This date is inclusive. Specify either interval or from_date and to_date.}
  \item{to_date}{The last date to return data for, in yyyy-mm-dd format. This date is inclusive. Specify either interval or from_date and to_date.}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{Data frame with data from Mixpanel API}
\author{Alexey Seleznev}
\examples{
retension2 <- MP.getRetention(api_secret = "abcdefg123456",
                              event = "$custom_event:590130",
                              retention_type = "compounded",
                              where = 'properties["utm_source"]=="AdWords" and "Brand" in properties["utm_campaign"]',
                              interval = 1,
                              interval_count = 7,
                              unit = NULL,
                              on = NULL,
                              from_date = Sys.Date() - 15,
                              to_date = Sys.Date())
  }

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
