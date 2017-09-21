MP.getEvents <-
function(api_secret = NULL,
                         event = NULL,
                         type = "general",
                         unit = "day",
                         interva = NULL,
                         from_date = Sys.Date() - 10,
                         to_date = Sys.Date()){
  #Проверка агрументов
  
  
  #Формирование запроса
  query_string <- paste0('https://',api_secret,'@mixpanel.com/api/2.0/events/?',
                         'event=',toJSON(event),
                         '&type=',type,
                         '&unit=',unit,
                         ifelse(is.null(interva),'',paste0('&interva=',interva)),
                         ifelse(is.null(from_date),'',paste0('&from_date=',from_date)),
                         ifelse(is.null(to_date),'',paste0('&to_date=',to_date)),
                         '&format=csv')
  
  #Отправка запроса к API
  api_answer <- GET(query_string)
  stop_for_status(api_answer)
  mixpaneleventdata <- content(api_answer, "parsed", "text/csv")
  
  #Возвращаем ответ
  return(mixpaneleventdata)
}
