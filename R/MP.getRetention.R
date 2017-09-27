MP.getRetention <- function(api_secret = NULL,
                            event = NULL,
                            retention_type = "birth",
                            born_event = NULL,
                            born_where = NULL,
                            where = NULL,
                            interval = NULL,
                            interval_count = NULL,
                            unit = NULL,
                            on = NULL,
                            tidy = TRUE,
                            from_date = NULL,
                            to_date = NULL){
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

  if(!is.null(content(api_answer)$error)){
    stop(content(api_answer)$error)
  }

  #Парсим реультат
  mixpaneleventdata <- content(api_answer, "parsed", "text/csv")
  
  if(tidy==TRUE){
  #Запоминаем название колонок
  first_col_names <- names(mixpaneleventdata)[c(1,2)]
  #Переименовываем колонки
  names(mixpaneleventdata)[1] <- "prop"
  #Преобразуем в правильный формат
  #new_data   <- gather(mixpaneleventdata,times, events, -`start date`)
  new_data   <- gather(mixpaneleventdata,times, events,-prop)
  #Возвращаем правильные имена колонок
  names(new_data) <- c(first_col_names, "events")}
  else{
    new_data   <- mixpaneleventdata
  }

  #Возвращаем ответ
  return(new_data)
}