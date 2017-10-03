# Contents of rmixpanel read me.
* [Description of rmixpanel](https://github.com/selesnow/rmixpanel/blob/master/ReadMe.md#Краткое-описание-пакета-rmixpanel)
* [Instalation rmixpanel](https://github.com/selesnow/rmixpanel#Установка-пакета-rmixpanel)
* [How get API Secret for work with API Mixpanel](https://github.com/selesnow/rmixpanel#Как-получить-api_secret-для-работы-с-api-mixpanel)
* [Function of rmixpanel](https://github.com/selesnow/rmixpanel#Функции-пакета-rmixpanel)
  * [MP.getEvents](https://github.com/selesnow/rmixpanel/blob/master/ReadMe.md#mpgetevents---Получить-количество-разичных-событий-по-дням) - Get unique, total, or average data for a set of events over N days, weeks, or months.
  * [MP.getEventsProperty](https://github.com/selesnow/rmixpanel/blob/master/ReadMe.md#mpgeteventsproperty---Получит-количество-события-в-разреще-одного-свойства-по-дням) - Get unique, total, or average data for of a single event and property over days, weeks, or months.
  * [MP.getRetention](https://github.com/selesnow/rmixpanel/blob/master/ReadMe.md#mpgetretention----Получит-когортный-анализ) - Get cohort analysis.
  * [MP.getRawData](https://github.com/selesnow/rmixpanel/blob/master/ReadMe.md#mpgetrawdata----Получит-сырые-данные-из-api-mixpanel) - Get a "raw dump" of tracked events over a time period.
* [About Author](https://github.com/selesnow/rmixpanel/blob/master/ReadMe.md#Автор-пакета-Алексей-Селезнёв-head-of-analytics-dept-at-netpeak)

# Description of rmixpanel
rmixpanel is the R client for Mixpanel API, use this tool if you need load data from Mixpanel API into R.

For convenience of searching functions of rmixpanel, each function have prefix "MP.".

You can get detailed help about each of package function by `help ` command, for example if you need help about `MP.getRawData` function you can run `help("MP.getRawData")`.

In order to get list of all available rmixpanel fuction use `help(package = "rmixpanel")`.

# Instal rmixpanel
You can instal rmixpanel from GitHub repository, for this run next code in R console.

```
if(!"rmixpanel" %in% installed.packages()[,1]){install.packages("devtools")}
devtools::install_github("selesnow/rmixpanel")
```

# How get api_secret для работы с API mixpanel
You can be found your api secret by clicking on your name in the upper righthand corner under Project Settings.

API Secret is a require argument of each rmixpanel functions.

1. Sing in mixpanel using your login and password.
![](http://img.netpeak.ua/alsey/150634204879_kiss_71kb.png)
2. Chose "Accounts" in main menu.
![](http://img.netpeak.ua/alsey/150634211597_kiss_33kb.png)
3. Go to tab "Projects", and copy API Secret of your project.
![](http://img.netpeak.ua/alsey/150634217727_kiss_57kb.png)

# rmixpanel functions
<table>
  <tr>
    <td>Name</td><td>Description</td>
  </tr>
  <tr>
    <td>MP.getEvents</td><td>Get unique, total, or average data for a set of events over N days, weeks, or months.</td>
  </tr>
    <tr>
    <td>MP.getEventsProperty</td><td>Get unique, total, or average data for of a single event and property over days, weeks, or months.</td>
  </tr>
    <tr>
     <td>MP.getRetention</td><td>Get cohort analysis.</td>
  </tr>
    <tr>
     <td>MP.getRawData</td><td>Get a "raw dump" of tracked events over a time period.</td>
  </tr>
</table>

## MP.getEvents - Get unique, total, or average data for a set of events over N days, weeks, or months.
### Arguments

* api_secret	- Your API Mixpanel secret, you can find hin in mixpanel web interface: Account (http://img.netpeak.ua/alsey/150600941068_kiss_10kb.png) > Projects (http://img.netpeak.ua/alsey/150600948369_kiss_46kb.png).
* event	- Character vector, the event or events that you wish to get data for, example c("play song", "log in", "add playlist").
* type	- The analysis type you would like to get data for - such as general, unique, or average events. Valid values:
  * "general" - Total events number
  * "unique" - Number of unique users commit event
  * "average" - Average events number on user
* unit	- It determines the level of granularity of the data you get back. Note that you cannot get hourly uniques, Valid values:
  * "minute" - Group by minutes
  * "hour" - Group by hours
  * "day" - Group by date
  * "week" - Group by week
  * "month" - Group by month
* interval	- The number of "units" to return data for - minutes, hours, days, weeks, or months. 1 will return data for the current unit (minute, hour, day, week or month). 2 will return the current and previous units, and so on. Specify either interval or from_date and to_date.
* from_date	- The first date to return data for, in yyyy-mm-dd format. This date is inclusive. Specify either interval or from_date and to_date.
* to_date		- The last date to return data for, in yyyy-mm-dd format. This date is inclusive. Specify either interval or from_date and to_date.

### Example
*Get total number of event "posting_success","emu","session_start","$custom_event:585946" from 1 june of 2017 till 25 july of 2017, with group by day.*
```
MP_events_day <- MP.getEvents(api_secret = "hgf7fi437nhdsad7863y98ryn988h8",
                              event = c("posting_success","emu","session_start","$custom_event:585946"),
                              type = "general",
                              unit = "day",
                              from_date = "2017-07-01",
                              to_date = "2017-07-25")
```
*Get average events number of event "session_start" and "$custom_event:585946" in the last two weeks, with group by month.*
```
MP_events_month <- MP.getEvents(api_secret = "hgf7fi437nhdsad7863y98ryn988h8",
                                event = c("session_start","$custom_event:585946"),
                                interval = 2,
                                type = "average",
                                unit = "month")
```

## MP.getEventsProperty - Get unique, total, or average data for of a single event and property over days, weeks, or months.
### Arguments
* api_secret	- Your API Mixpanel secret, you can find hin in mixpanel web interface: Account (http://img.netpeak.ua/alsey/150600941068_kiss_10kb.png) > Projects (http://img.netpeak.ua/alsey/150600948369_kiss_46kb.png).
* event	- Character vector, the event or events that you wish to get data, for example c("posting_success","emu","session_start","$custom_event:585946".
* property - The name of the property you would like to get data for. For example  "mp_country_code".
* values - The specific property values that you would like to get data for Example: If you have a property "gender" you may have values "male", "female" and "unknown". If you just want data for female and unknown users, you can include a values property that looks like "["female", "unknown"]".
* type	- The analysis type you would like to get data for - such as general, unique, or average events. Valid values:
  * "general" - Total events number
  * "unique" - Number of unique users commit event
  * "average" - Average events number on user
* unit	- It determines the level of granularity of the data you get back. Note that you cannot get hourly uniques, Valid values:
  * "minute" - Group by minutes
  * "hour" - Group by hours
  * "day" - Group by date
  * "week" - Group by week
  * "month" - Group by month
* interval	- The number of "units" to return data for - minutes, hours, days, weeks, or months. 1 will return data for the current unit (minute, hour, day, week or month). 2 will return the current and previous units, and so on. Specify either interval or from_date and to_date.
* tidy - Logical, if TRUE apply [tidy data](http://biostat-r.blogspot.com/2016/01/tidy-data.html) format, if FALSE apply report data format.
* from_date	- The first date to return data for, in yyyy-mm-dd format. This date is inclusive. Specify either interval or from_date and to_date.
* to_date		- The last date to return data for, in yyyy-mm-dd format. This date is inclusive. Specify either interval or from_date and to_date.
* limit - The maximum number of values to return.

### Example 
*Get total umber of event "$custom_event:585946" from 1 june of 2017 till 25 july of 2017, with group by day and property mp_country_code.*
```
MP_event_prop <- MP.getEventsProperty(api_secret = "hgf7fi437nhdsad7863y98ryn988h8",
                                      event = c("$custom_event:585946"),
                                      property = "mp_country_code",
                                      type = "general",
                                      unit = "day",
                                      from_date = "2017-07-01",
                                      to_date = "2017-07-25")
```
*Get total umber of event "$custom_event:585946" in current and previous month, with group by month and property mp_country_code.*
```
MP_event_prop_month <- MP.getEventsProperty(api_secret = "hgf7fi437nhdsad7863y98ryn988h8",
                                            event = c("$custom_event:585946"),
                                            property = "mp_country_code",
                                            type = "general",
                                            interval = 2,
                                            unit = "month")
```

## MP.getRetention  - Get cohort analysis.
### Arguments
* api_secret	- API Secret проекта из которого необходимо получить данные.
* event	- Текстовый векотор в котором перечислены названия событий количество которых необходимо вернуть, пример: c("posting_success","emu","session_start","$custom_event:585946".
* retention_type - Тип создания когорты, допустимые значения "birth","compounded". По умолчанию "birth".
* born_event - Текстовое значение, название событие которое считается рождением и зачислением пользователя в когорту. Аргумент учитывается только если в аргументе retention_type установлено значение "birth", в другом случае даный аргумент будет игнорироваться.
* born_where - Логическое выражение для аргумента born_events, для того что бы разобраться с синтаксисом логических выражений перейдите по [ссылке](https://mixpanel.com/help/reference/data-export-api#segmentation-expressions).
* where - Фильтр для результирующей таблицы, например 'properties["utm_source"]=="AdWords" and "Brand" in properties["utm_campaign"]', означает вернуть когорты для метки utm_source равной AdWords ипо рекламным кампаниям в названии которых есть слово Brand. для того что бы разобраться с синтаксисом логических выражений перейдите по [ссылке](https://mixpanel.com/help/reference/data-export-api#segmentation-expressions).
* unit	- Тип временной группировки данных, допустимые значения:
  * "minute" - Группировка по минутам
  * "hour" - Группировка по часам
  * "day" - Группировка по дням
  * "week" - Группировка по неделям
  * "month" - Группировка по месяцам
* interval	- Целое число, количество временных единиц возврата данных, зависит от значения аргумента unit, если unit = "day", а в interval указано 5, то будут возвращены данные за текущий и 4 предыдущих дня, если unit = "month" а interval = 2, то будут возвращены данные за текущий и предыдущий месяц, используйте либо аргумент interval, либо date_frome - date_to, одновременно использовать эти аргументы нельзя.
* interval_count - Количество интервалов которое необходимо вернуть.
* on - При необходимости можно сформировать когорты не только по дате, но и по любому из свойств события, например по источнику, 'properties["utm_source"]'.
* tidy - Логическое значение, если установить TRUE (по умолчанию) то вы получите данные преобразованные в аккуратный формат ([tidy data](http://biostat-r.blogspot.com/2016/01/tidy-data.html), если установить значение FALSE вы получите данные преобразованные в формат матрицы.
* from_date	- Начальная дата выгрузки данных в формате YYYY-MM-DD, используйте данный аргумент если не используете interval.
* to_date		- Конечная дата выгрузки данных в формате YYYY-MM-DD, используйте данный аргумент если не используете interval.

### Пример использования 
*Получить общее количество событий "$custom_event:585946" с 1 июля 2017 года по 25 июля 2017 года, с группировкой по дням и свойству mp_country_code.*
```
retension <- MP.getRetention(api_secret = "hgf7fi437nhdsad7863y98ryn988h8",
                             event = "emu",
                             retention_type = "birth",
                             unit = "week",
                             born_event = "session_start",
                             where = 'properties["utm_source"]=="AdWords" and "Brand" in properties["utm_campaign"]',
                             interval_count = 4,
                             from_date = "2017-08-01",
                             to_date = "2017-09-25")
```
*Получить когортный анализ по неделям, за 4 недели начиная с 1 августа 2017 года, разбив когорты по источнику, свойство utm_source.*
```
retension_property <- MP.getRetention(api_secret = "hgf7fi437nhdsad7863y98ryn988h8",
                                      event = "emu",
                                      retention_type = "birth",
                                      unit = "week",
                                      born_event = "session_start",
                                      on = 'properties["utm_source"]',
                                      interval_count = 4,
                                      from_date = "2017-08-01",
                                      to_date = "2017-09-25")
```

## MP.getRawData  - Получит сырые данные из API Mixpanel.
*Данная функция работает достаточно долго, при большом объёме событий в аккаунте их обработка может занимать часы, в связи с чем рекомендуется использовать выгрузку сырых данных тольво в тех случаях когда получить необходимый набор данных с помощью других функций невозможно.*

### Аргументы
* api_secret	- API Secret проекта из которого необходимо получить данные.
* event	- Текстовый векотор в котором перечислены названия событий количество которых необходимо вернуть, пример: c("posting_success","emu","session_start","$custom_event:585946".
* where - Фильтр для результирующей таблицы, например 'properties["utm_source"]=="AdWords" and "Brand" in properties["utm_campaign"]', означает вернуть когорты для метки utm_source равной AdWords ипо рекламным кампаниям в названии которых есть слово Brand. для того что бы разобраться с синтаксисом логических выражений перейдите по [ссылке](https://mixpanel.com/help/reference/data-export-api#segmentation-expressions).
* from_date	- Начальная дата выгрузки данных в формате YYYY-MM-DD, используйте данный аргумент если не используете interval.
* to_date		- Конечная дата выгрузки данных в формате YYYY-MM-DD, используйте данный аргумент если не используете interval.

### Пример использования 
*Получить выгрузку событий emu и ивсех его свойтв за 10 июля 2017 года, только по источнику AdWords, и рекламным кампаниям в названии которых содержится Brand.*
```
MixPanel.RawData <- MP.getRawData(api_secret = "hgf7fi437nhdsad7863y98ryn988h8",
                                  event = "emu",
                                  where = 'properties["utm_source"]=="AdWords" and "Brand" in properties["utm_campaign"]',
                                  from_date = "2017-07-10",
                                  to_date = "2017-07-10")
```

*Получить выгрузку всех событий со всеми свойствами с 1 сентября 2017 года по 10 сентября 2017 года.*
**Обработка такого запроса может продолжаться несколько часов, и более.
```
MixPanel.RawData <- MP.getRawData(api_secret = "hgf7fi437nhdsad7863y98ryn988h8",
                                  from_date = "2017-09-01",
                                  to_date = "2017-09-10")
```
## Автор пакета: Алексей Селезнёв, Head of Analytics Dept. at Netpeak*
 <p align="center">
<img src="https://lh3.googleusercontent.com/R-0jgJSxIIhpag2L6YCIhJVIcIWx6-Jt5UCTRJjWzJewo47u2QBnik5CRF2dNB79jmsN_BFRjVOAYfvCqFcn3UNS_thGbbxF-99c9lwBWWlFI7JCWE43K5Yk9HnIW8i8YpTDx3l28IuYswaI-qc9QosHT1lPCsVilTfXTyV2empF4S74daOJ6x5QHYRWumT_2MhUS0hPqUsKVtOoveqDnGf3cF_VsN-RfOAwG9uCeGOgNRgv_fhSr41rw4LBND4gf05nO8zMp4TZMrrcUjKvvx6qNgYDor5LFOHiRmfKISYRVkWYe4wLyGO1FgkgTDjg0300lcur2t3txVwZUgROLZdaxOLx4owa8Rc8B8VKwd3vHxjov_aVfNPT4xf9jSFBBEOI-mfYpa55ejKDw-rqTQ6miFRFWpp_hjrk9KbGyB-Z6iZvYL-2dZ6mzgpUfs2I0tEAGsV07yTzboJ0RNCByC2-U-ZVjWdp2_9Au3FFoUcdQUAmPYOVqOv4r3oLbkkJKLj2A5jp7vf4IAoExLIfJuqEf7XN7fFcv4geib029qJjBt28wnqSO6TKEwB2fesR3uPHvGB6_6NHD70UDH-aCRCK4UBeoajtU0Y8Ks8Vwxo0oZBwmoEu8gudTFBF6mDT7GjLoGLDeNxE-TG7OtWUdxsJk7yzXGW3hE-VxsMD9g=s351-no?w=300" data-canonical-src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png?w=300" style="max-width:100%;">
</p>

### Контакты:
<nav class="jetpack-social-navigation jetpack-social-navigation-svg">
<div class="menu-%d1%81%d0%be%d1%86%d0%b8%d0%b0%d0%bb%d1%8c%d0%bd%d1%8b%d0%b5-%d1%81%d0%b5%d1%82%d0%b8-container">
<ul id="menu-%d1%81%d0%be%d1%86%d0%b8%d0%b0%d0%bb%d1%8c%d0%bd%d1%8b%d0%b5-%d1%81%d0%b5%d1%82%d0%b8" class="menu">
<li id="menu-item-13" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-13"><a href="http://www.facebook.com/selesnow" target="_blank"><span class="screen-reader-text">Facebook</span></a></li>
<li id="menu-item-14" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14"><a href="https://www.linkedin.com/in/selesnow/" target="_blank"><span class="screen-reader-text">LinkedIn</span></a></li>
<li id="menu-item-15" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-15"><a href="http://www.vk.com/selesnow" target="_blank"><span class="screen-reader-text">Vkontakte</span></a></li>
<li id="menu-item-16" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-16"><a href="https://github.com/selesnow"><span class="screen-reader-text">GitHub</span></a></li>
<li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-16"><a href="https://alexeyseleznev.wordpress.com/">Blog</a></li>
</ul>
</div>
</nav>
  
<p align="center">
<img src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png?w=300" data-canonical-src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png?w=300" style="max-width:100%;">
</p>

