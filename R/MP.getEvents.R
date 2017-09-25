MP.getEvents <- function(api_secret = NULL,
                         event = NULL,
                         type = "general",
                         unit = "day",
                         interval = NULL,
                         from_date = NULL,
                         to_date = NULL){
  #Ïðîâåðêà àãðóìåíòîâ
  if(is.null(interva) & is.null(from_date) & is.null(to_date)){
    from_date <- Sys.Date() - 10
    to_date = Sys.Date()
    }
  
  #Ôîðìèðîâàíèå çàïðîñà
  query_string <- paste0('https://',api_secret,'@mixpanel.com/api/2.0/events/?',
                         'event=',toJSON(event),
                         '&type=',type,
                         '&unit=',unit,
                         ifelse(is.null(interval),'',paste0('&interval=',interval,'&')),
                         ifelse(is.null(from_date),'',paste0('&from_date=',from_date)),
                         ifelse(is.null(to_date),'',paste0('&to_date=',to_date)),
                         '&format=csv')
  
  #Îòïðàâêà çàïðîñà ê API
  api_answer <- GET(query_string)
  stop_for_status(api_answer)
  mixpaneleventdata <- content(api_answer, "parsed", "text/csv")
  
  #Âîçâðàùàåì îòâåò
  return(mixpaneleventdata)
}
