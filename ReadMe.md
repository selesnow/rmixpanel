# Содержание ReadMe пакета rmixpanel
* [Краткое описание пакета rmixpanel](https://github.com/selesnow/rmixpanel/blob/master/ReadMe.md#Краткое-описание-пакета-rmixpanel)
* Установка пакта rmixpanel
* Как получить API Secret для работы с API Mixpanel
* Функции пакета rmixpanel
  * [MP.getEvents]() - Получить количество разичных событий по дням.
  * [MP.getEventsProperty]() - Получит количество события в разреще одного свойства по дням.
  * [MP.getRetention]() - Получить когортный анализ.
  * [MP.getRawData]() - Получить выгрузку сырых данных из Mixpanel.

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
    <td>MP.getEventsProperty</td><td>олучит количество события в разреще одного свойства по дням.</td>
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
* interva	- Целое число, количество временных единиц возврата данных, зависит от значения аргумента unit, если unit = "day", а в interval указано 5, то будут возвращены данные за текущий и 4 предыдущих дня, если unit = "month" а interval = 2, то будут возвращены данные за текущий и предыдущий месяц, используйте либо аргумент interval, либо date_frome - date_to, одновременно использовать эти аргументы нельзя.
* from_date	
The first date to return data for, in yyyy-mm-dd format. This date is inclusive. Specify either interval or from_date and to_date.
* to_date	
The last date to return data for, in yyyy-mm-dd format. This date is inclusive. Specify either interval or from_date and to_date.
