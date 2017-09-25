\name{MP.getRawData}
\alias{MP.getRawData}
\title{
Get a "raw dump" of tracked events over a time period.
}
\description{
Get a "raw dump" of tracked events over a time period. Duration work of MP.getRawData is very long, use him only if you need raw data, in other cases use others package`s function. For more information go https://mixpanel.com/help/reference/exporting-raw-data
}
\usage{
MP.getEvents(api_secret = NULL, event = NULL, type = "general", unit = "day", interva = NULL, from_date = Sys.Date() - 10, to_date = Sys.Date())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{api_secret}{Your API Mixpanel secret, you can find hin in mixpanel web interface: Account (http://img.netpeak.ua/alsey/150600941068_kiss_10kb.png) > Projects (http://img.netpeak.ua/alsey/150600948369_kiss_46kb.png)}
  \item{event}{The event or events that you wish to get data for, example c("play song", "log in", "add playlist")}
  \item{where}{An expression to filter the returning events by. For example 'properties["utm_source"]=="AdWords" and "Brand" in properties["utm_campaign"]', For more information go https://mixpanel.com/help/reference/data-export-api#segmentation-expressions}
  \item{from_date}{The first date to return data for, in yyyy-mm-dd format. This date is inclusive. Specify either interval or from_date and to_date.}
  \item{to_date}{The last date to return data for, in yyyy-mm-dd format. This date is inclusive. Specify either interval or from_date and to_date.}
}
\details{
For more information go https://mixpanel.com/help/reference/data-export-api#events
}
\value{Data frame with raw data from Mixpanel account.}
\author{Alexey Seleznev}
\examples{
MixPanel.RawData <- MP.getRawData(api_secret = "abcdefg123456",
                                  event = "emu",
                                  where = 'properties["utm_source"]=="AdWords" and "Brand" in properties["utm_campaign"]',
                                  from_date = "2017-07-10",
                                  to_date = "2017-07-10")
  }

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
