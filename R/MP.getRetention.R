MP.getRetention <-
function(api_secret = NULL,
                            event = NULL,
                            retention_type = "birth",
                            born_event = NULL,
                            born_where = NULL,
                            where = NULL,
                            interval = NULL,
                            interval_count = NULL,
                            unit = "day",
                            on = NULL,
                            from_date = Sys.Date() - 10,
                            to_date = Sys.Date()){
  #Проверка агрументов
  
  
  #Формирование запроса
  query_string <- paste0('https://',api_secret,'@mixpanel.com/api/2.0/retention/?',
                         'event=',event,
                         '&retention_type=',retention_type,
                         ifelse(is.null(born_event),'',paste0('&born_event=',born_event)),
                         ifelse(is.null(born_where),'',paste0('&born_where=',born_where)),
                         ifelse(is.null(where),'',paste0('&where=',gsub(pattern = " ",  x =  where,replacement =  "%20"))),
                         ifelse(is.null(interval),'',paste0('&interval=',interval)),
                         ifelse(is.null(interval_count),'',paste0('&interval_count=',interval_count)),
                         ifelse(is.null(unit),'',paste0('&unit=',unit)),
                         ifelse(is.null(on),'',paste0('&on=',on)),
                         ifelse(is.null(from_date),'',paste0('&from_date=',from_date)),
                         ifelse(is.null(to_date),'',paste0('&to_date=',to_date)),
                         '&format=csv')
  
  #Отправка запроса к API
  api_answer <- GET(query_string)
  stop_for_status(api_answer)
  mixpaneleventdata <- content(api_answer, "parsed", "text/csv")
  
  #Преобразуем в правильный формат
  new_data   <- gather(mixpaneleventdata,times, events, -`start date`)
  
  #Возвращаем ответ
  return(new_data)
}
