MP.getEventsProperty <-
function(api_secret = NULL,
                                 event = NULL,
                                 property = NULL,
                                 values = NULL,
                                 type = "general",
                                 unit = "day",
                                 interva = NULL,
                                 from_date = Sys.Date() - 10,
                                 to_date = Sys.Date(),
                                 tidy = TRUE,
                                 limit = 10000){
  #Ïðîâåðêà àãðóìåíòîâ
  
  #Ôîðìèðîâàíèå çàïðîñà
  query_string <- paste0('https://',api_secret,'@mixpanel.com/api/2.0/events/',ifelse(is.null(property),'','properties/') ,'?',
                         'event=',event,
                         ifelse(is.null(property),'',paste0('&name=',property)),
                         ifelse(is.null(values)|is.null(property),'',paste0('&values=',values)),
                         '&type=',type,
                         '&unit=',unit,
                         ifelse(is.null(interva),'',paste0('&interva=',interva)),
                         ifelse(is.null(from_date),'',paste0('&from_date=',from_date)),
                         ifelse(is.null(to_date),'',paste0('&to_date=',to_date)),
                         '&limit=',limit,
                         '&format=csv')
  
  #Îòïðàâêà çàïðîñà ê API
  api_answer <- GET(query_string)
  stop_for_status(api_answer)
  mixpaneleventdata <- content(api_answer, "parsed", "text/csv")
  if(tidy==TRUE){
  #Ïðåîáðàçóåì â ïðàâèëüíûé ôîðìàò
  new_data   <- gather(mixpaneleventdata,property, event, -date)
  colnames(new_data) <- c("date",property,event)}
  else{
    new_data <- mixpaneleventdata
  }
  return(new_data)
}
