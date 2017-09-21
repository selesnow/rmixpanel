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
                                 limit = 10000){
  #Проверка агрументов
  
  #Формирование запроса
  query_string <- paste0('https://',api_secret,'@mixpanel.com/api/2.0/events/',ifelse(is.null(property),'','properties/') ,'?',
                         'event=',event,
                         ifelse(is.null(property),'',paste0('&name=',property)),
                         ifelse(is.null(values)|is.null(property),'',paste0('&name=',values)),
                         '&type=',type,
                         '&unit=',unit,
                         ifelse(is.null(interva),'',paste0('&interva=',interva)),
                         ifelse(is.null(from_date),'',paste0('&from_date=',from_date)),
                         ifelse(is.null(to_date),'',paste0('&to_date=',to_date)),
                         '&limit=',limit,
                         '&format=csv')
  
  #Отправка запроса к API
  api_answer <- GET(query_string)
  stop_for_status(api_answer)
  mixpaneleventdata <- content(api_answer, "parsed", "text/csv")
  
  #Преобразуем в правильный формат
  new_data   <- gather(mixpaneleventdata,property, event, -date)
  colnames(new_data) <- c("date",property,event)
  return(new_data)
}
