MP.getRawData <- function(api_secret = NULL,
                          event = NULL,
                          where = NULL,
                          from_date = "2017-07-10",
                          to_date = "2017-07-10"){
  #Время наала работы функции
  start_time <- Sys.time()

  if(!is.null(event)){
    event <- toJSON(event)
  }
  
  #Формирование запроса
  query_string <- paste0('https://',api_secret,'@data.mixpanel.com/api/2.0/export/?',
                         ifelse(is.null(event),'',paste0('event=',event)),
                         ifelse(is.null(where),'',paste0('&where=',gsub(pattern = " ",  x =  where,replacement =  "%20"))),
                         ifelse(is.null(from_date),'',paste0('&from_date=',from_date)),
                         ifelse(is.null(to_date),'',paste0('&to_date=',to_date)))
  
  
  #Отправка запроса к API
  api_answer <- GET(query_string)
  stop_for_status(api_answer)
  
  #парсинг результата
  #Преобразуем корявый json в нормальный, необходимо все события завернуть в массив
  mixpanelrawdata <- fromJSON(paste0("[",gsub(",
$","]",gsub("}}", "}},", content(api_answer,as = "text" )))))
  
  #Время окончания работы функции
  stop_time <- Sys.time()
  
  #Длительность работ
  duration_sec <- round(difftime(stop_time, start_time , units ="secs"),0)
  
  #Выводим сообщение о работе функции
  packageStartupMessage(paste0("Function work durations: ",duration_sec," sec."))
  packageStartupMessage(paste0("Number of loaded rows: ",nrow(mixpanelrawdata)))
  #Возвращаем готовый дата фрейм
  return(mixpanelrawdata)}