MP.getEventsProperty <-
function(api_secret = NULL,
                                 event = NULL,
                                 property = NULL,
                                 values = NULL,
                                 type = "general",
                                 unit = "day",
                                 interval = NULL,
                                 from_date = NULL,
                                 to_date = NULL,
                                 limit = 10000){
  #Ïðîâåðêà àãðóìåíòîâ
    if(is.null(interva) & is.null(from_date) & is.null(to_date)){
    from_date <- Sys.Date() - 10
    to_date = Sys.Date()
    }
  
  #Ôîðìèðîâàíèå çàïðîñà
  query_string <- paste0('https://',api_secret,'@mixpanel.com/api/2.0/events/',ifelse(is.null(property),'','properties/') ,'?',
                         'event=',event,
                         ifelse(is.null(property),'',paste0('&name=',property)),
                         ifelse(is.null(values)|is.null(property),'',paste0('&name=',values)),
                         '&type=',type,
                         '&unit=',unit,
                         ifelse(is.null(interval),'',paste0('&interval=',interval)),
                         ifelse(is.null(from_date),'',paste0('&from_date=',from_date)),
                         ifelse(is.null(to_date),'',paste0('&to_date=',to_date)),
                         '&limit=',limit,
                         '&format=csv')
  
  #Îòïðàâêà çàïðîñà ê API
  api_answer <- GET(query_string)
  stop_for_status(api_answer)
  mixpaneleventdata <- content(api_answer, "parsed", "text/csv")
  
  #Ïðåîáðàçóåì â ïðàâèëüíûé ôîðìàò
  new_data   <- gather(mixpaneleventdata,property, event, -date)
  colnames(new_data) <- c("date",property,event)
  return(new_data)
}
