<head>
<link rel="shortcut icon" type="image/x-icon" href="as.ico">
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-114798296-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-114798296-1');
</script>
</head>

<p align="center">
<a href="https://selesnow.github.io/"><img src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png" height="80"></a>
</p>

# Выберите язык описания пакета | Chose language of package description
<table align="center">
  <tr>
    <td><a href="https://github.com/selesnow/rmixpanel/blob/master/ReadMe_EN.MD"><img src="http://img.freeflagicons.com/thumb/round_icon/united_kingdom/united_kingdom_640.png" height="80"></img></a></td>
    <td><a href="https://github.com/selesnow/rmixpanel/blob/master/ReadMe.md"><img src="http://izgranita.in.ua/img/ru_flag.ico" height="80"></img></a></td>
  </tr>
  <tr>
  <td align="center"><a href="https://github.com/selesnow/rmixpanel/blob/master/ReadMe_EN.MD">English</a></td> 
  <td align="center"><a href="https://github.com/selesnow/rmixpanel/blob/master/ReadMe.md">Русский</a></td> 
  </tr>
</table>

# Содержание ReadMe пакета rmixpanel
* [Краткое описание пакета rmixpanel](https://github.com/selesnow/rmixpanel/blob/master/ReadMe.md#Краткое-описание-пакета-rmixpanel)
* [Установка пакта rmixpanel](https://github.com/selesnow/rmixpanel#Установка-пакета-rmixpanel)
* [Как получить API Secret для работы с API Mixpanel](https://github.com/selesnow/rmixpanel#Как-получить-api_secret-для-работы-с-api-mixpanel)
* [Функции пакета rmixpanel](https://github.com/selesnow/rmixpanel#Функции-пакета-rmixpanel)
  * [MP.getEvents](https://github.com/selesnow/rmixpanel/blob/master/ReadMe.md#mpgetevents---Получить-количество-разичных-событий-по-дням) - Получить количество разичных событий по дням.
  * [MP.getEventsProperty](https://github.com/selesnow/rmixpanel/blob/master/ReadMe.md#mpgeteventsproperty---Получит-количество-события-в-разреще-одного-свойства-по-дням) - Получит количество события в разреще одного свойства по дням.
  * [MP.getRetention](https://github.com/selesnow/rmixpanel/blob/master/ReadMe.md#mpgetretention----Получит-когортный-анализ) - Получить когортный анализ.
  * [MP.getRawData](https://github.com/selesnow/rmixpanel/blob/master/ReadMe.md#mpgetrawdata----Получит-сырые-данные-из-api-mixpanel) - Получить выгрузку сырых данных из Mixpanel.
* [Информация об авторе пакета](https://github.com/selesnow/rmixpanel/blob/master/ReadMe.md#Автор-пакета-Алексей-Селезнёв-head-of-analytics-dept-at-netpeak)

# Краткое описание пакета rmixpanel
Пакет rmixpanel является R клиентом для работы с API веб аналитической платформы [Mixpanel](https://mixpanel.com/), предназначем для максимально удобной загрузки данных из API mixpanel в R.

Для удобства быстрого поиска функций пакета, название всех доступных функций имеет префик "MP.".

Подробную справку с описанием всех аргументов и примером работы по каждой из функций можно получить выполнив команду `help `. 
Например что бы получить справку по функции `MP.getRawData` запустите в R следующую команду.

`help("MP.getRawData")`

Для того, что бы получить список всех функций и ссылки на справку по каждой из фунцйи воспользуйтесь следующей командой.
`help(package = "rmixpanel")`

# Установка пакета rmixpanel
Установить пакет можно непосредственно из репозитония на GitHub, для этого достаточно запустить в R консоли приведённый ниже код.
```
if(!"rmixpanel" %in% installed.packages()[,1]){install.packages("devtools")}
devtools::install_github("selesnow/rmixpanel")
```

# Как получить api_secret для работы с API mixpanel
Обязательным аргументом каждой функции пакета mixpanel является `api_secret`, найти его можно в веб интерфейсе платформы MixPanel следующим образом.

1. Заходим в свою учётную запись mixpanel используя свой логин и пароль.
![](http://img.netpeak.ua/alsey/150634204879_kiss_71kb.png)
2. В основном выпадающем меню выбираем пункт "Accounts".
![](http://img.netpeak.ua/alsey/150634211597_kiss_33kb.png)
3. В открывшемся диалоговом окне открываем вкладку "Projects", и копируем API Secret нужного проекта.
![](http://img.netpeak.ua/alsey/150634217727_kiss_57kb.png)
# Функции пакета rmixpanel
<table>
  <tr>
    <td>Название</td><td>Описание</td>
  </tr>
  <tr>
    <td>MP.getEvents</td><td>Получить количество разичных событий по дням.</td>
  </tr>
    <tr>
    <td>MP.getEventsProperty</td><td>Получит количество события в разреще одного свойства по дням.</td>
  </tr>
    <tr>
     <td>MP.getRetention</td><td>Получить выгрузку сырых данных из Mixpanel.</td>
  </tr>
    <tr>
     <td>MP.getRawData</td><td>Получить когортный анализ.</td>
  </tr>
</table>

## MP.getEvents - Получить количество разичных событий по дням.
### Аргументы

* api_secret	- API Secret проекта из которого необходимо получить данные.
* event	- Текстовый векотор в котором перечислены названия событий количество которых необходимо вернуть, пример: c("posting_success","emu","session_start","$custom_event:585946".
* type	- Способ агрегации полученных данных, допустимые значения
  * "general" - Общее количество событий
  * "unique" - Количество посетителей создавших событие
  * "average" - Среднее количество достижение события на пользователя
* unit	- Тип временной группировки данных, допустимые значения:
  * "minute" - Группировка по минутам
  * "hour" - Группировка по часам
  * "day" - Группировка по дням
  * "week" - Группировка по неделям
  * "month" - Группировка по месяцам
* interval	- Целое число, количество временных единиц возврата данных, зависит от значения аргумента unit, если unit = "day", а в interval указано 5, то будут возвращены данные за текущий и 4 предыдущих дня, если unit = "month" а interval = 2, то будут возвращены данные за текущий и предыдущий месяц, используйте либо аргумент interval, либо date_frome - date_to, одновременно использовать эти аргументы нельзя.
* from_date	- Начальная дата выгрузки данных в формате YYYY-MM-DD, используйте данный аргумент если не используете interval.
* to_date		- Конечная дата выгрузки данных в формате YYYY-MM-DD, используйте данный аргумент если не используете interval.

### Пример использования 
*Получить общее количество событий "posting_success","emu","session_start","$custom_event:585946" с 1 июля 2017 года по 25 июля 2017 года, с группировкой по дням.*
```
MP_events_day <- MP.getEvents(api_secret = "hgf7fi437nhdsad7863y98ryn988h8",
                              event = c("posting_success","emu","session_start","$custom_event:585946"),
                              type = "general",
                              unit = "day",
                              from_date = "2017-07-01",
                              to_date = "2017-07-25")
```
*Получить среднее количество событий "session_start" и "$custom_event:585946" за последние 2 месяца, с группировкой по месяцам.*
```
MP_events_month <- MP.getEvents(api_secret = "hgf7fi437nhdsad7863y98ryn988h8",
                                event = c("session_start","$custom_event:585946"),
                                interval = 2,
                                type = "average",
                                unit = "month")
```

## MP.getEventsProperty - Получит количество события в разреще одного свойства по дням.
### Аргументы
* api_secret	- API Secret проекта из которого необходимо получить данные.
* event	- Текстовый векотор в котором перечислены названия событий количество которых необходимо вернуть, пример: c("posting_success","emu","session_start","$custom_event:585946".
* property - Текстовое значение, имя свойства в разрезе которого вы хотите получить количество событий, например "mp_country_code".
* values - Фильтр по значению выбранного свойства, например если в качестве свойства вы указали пол ("gender"), то он может быть мужской("male"), женский("female") или неопределённый("unknown"),  если вам необходимо получить данные только по эженскому и неопредёлнному полу можно указать значение '["female", "unknown"]'.
* type	- Способ агрегации полученных данных, допустимые значения
  * "general" - Общее количество событий
  * "unique" - Количество посетителей создавших событие
  * "average" - Среднее количество достижение события на пользователя
* unit	- Тип временной группировки данных, допустимые значения:
  * "minute" - Группировка по минутам
  * "hour" - Группировка по часам
  * "day" - Группировка по дням
  * "week" - Группировка по неделям
  * "month" - Группировка по месяцам
* interval	- Целое число, количество временных единиц возврата данных, зависит от значения аргумента unit, если unit = "day", а в interval указано 5, то будут возвращены данные за текущий и 4 предыдущих дня, если unit = "month" а interval = 2, то будут возвращены данные за текущий и предыдущий месяц, используйте либо аргумент interval, либо date_frome - date_to, одновременно использовать эти аргументы нельзя.
* tidy - Логическое значение, если установить TRUE (по умолчанию) то вы получите данные преобразованные в аккуратный формат ([tidy data](http://biostat-r.blogspot.com/2016/01/tidy-data.html), если установить значение FALSE вы получите данные преобразованные в формат матрицы.
* from_date	- Начальная дата выгрузки данных в формате YYYY-MM-DD, используйте данный аргумент если не используете interval.
* to_date		- Конечная дата выгрузки данных в формате YYYY-MM-DD, используйте данный аргумент если не используете interval.
* limit - Максимальное количество возвращаемых строк, не обязательный аргумент. По умолчанию 10000

### Пример использования 
*Получить общее количество событий "$custom_event:585946" с 1 июля 2017 года по 25 июля 2017 года, с группировкой по дням и свойству mp_country_code.*
```
MP_event_prop <- MP.getEventsProperty(api_secret = "hgf7fi437nhdsad7863y98ryn988h8",
                                      event = c("$custom_event:585946"),
                                      property = "mp_country_code",
                                      type = "general",
                                      unit = "day",
                                      from_date = "2017-07-01",
                                      to_date = "2017-07-25")
```
*Получить общее количество событий "$custom_event:585946" за текущий и предыдущий месяц, с группировкой по месяцам и свойству mp_country_code.*
```
MP_event_prop_month <- MP.getEventsProperty(api_secret = "hgf7fi437nhdsad7863y98ryn988h8",
                                            event = c("$custom_event:585946"),
                                            property = "mp_country_code",
                                            type = "general",
                                            interval = 2,
                                            unit = "month")
```

## MP.getRetention  - Получит когортный анализ.
### Аргументы
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
