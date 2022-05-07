# LoadWorkDataAirFlightsDBNew

Наработки по:
 - авиационному процессингу,
 - телематике,
 - телеметрии.

Справочные, рабочие и оперативные данные в SQL-ных базах данных на **MS SQL Server**-е.

Справочные данные:
  - объекты (аэропорты, аэродромы, авиабазы, взлетные полосы и хелипады),
  - авиакомпании,
  - летательные аппараты.

Рабочие и оперативные данные:
 - маршруты (в перспективе разработки их профиль и топология),
 - авиаперелеты.

Предусматривается:
 - разработка и администрирование баз данных внутри Management Studio,
 - работа клиентов через графические формы внутри инфраструктуры по учеткам Windows Server-ов без контроллера домена и с заранее сделанной конфигой сервера СУБД (имена входа, их права),
 - визуализация части данных на ВЭБ-сайте.

![93936369_591194488270382_464298759405174784_n](https://user-images.githubusercontent.com/104857185/167257457-d5fc8393-4bdc-4391-a76d-9b2b73490016.jpg "Решение по архитектуре")

----
Для обхода попадания на обработку вложенных исключений на клиентах:
 - обновить **двайвер ODBC для MSSQL** версии 17 (дистрибутив и руководство см. в папке "Q:\M$_Windows\SQL_Server\Driver ODBC for SQL Server").
 - настроить в источниках данных **системный DSN** (см. "Подключение к БД через системный DSN" в папке "..\Руководства в картинках"),
 
Уход от взаимоблокировок при чтения/записи СУБД сделан с помощью обертывания цикла попыток с нарастающей задержкой в обработку исключения, так как сервер СУБД на дает обратные вызовы (хуки или паузы до прерывания) клиентам на повторную попытку. При 2-х кратном увеличении интенсивности запросов и при 2-х кратном увеличении количества клиентов на задержках теряется 15 ... 20 % времени. Начальное значение задержки по времени и шаг ее увеличения выбран экспериментально по результатам тестов и зависит от вычислительных характеристик сервера.

Модель восстановления баз данных - **ПОЛНАЯ**, так как в хранимых процедурах используются помеченные транзакции.

----
Доработать базу по летательным аппаратам таким образом, чтобы писать в нее:
 - арендодателей (необязательно),
 - арендаторов (владельцев),
 - операторов
в полях **XML(CONTENT XSD-схема)**, парсить их как **DOM** по веткам и подветкам и при необходимости дописывать подветки по указанному аттрибуту с указанной датой например с помощью хранимой процедуры.
Недостаток хранимой процедуры - не возвращает в скрипты на Python-е результат своей работы (получилось, не получилось с указанием причины).
Недостаток XSD-схемы - тот же.

![SSMS - XML-код - Создать схему](https://user-images.githubusercontent.com/104857185/167261451-a42a0c66-2888-4042-88a2-679f1ef6549a.png)
 
![Таблица с полем типа xml с привязкой к схеме xsd](https://user-images.githubusercontent.com/104857185/167261417-e0820f3d-965f-4124-9af6-e59994e09f46.png)

Дополнительно:
 - Применить комплектый с **MS SQL** функционал **XPath & XQuery**, чтобы нормально парсить XML-ные поля,
 - Сделать графическую формочку для правки свойств альянсов (или делать это внутри Management Studio),
 - Сделать графическую формочку для правки свойств летательных аппаратов и уточнить набор виджетов на ней,
 - Добавить виджеты на вкладке свойств объекта, а также доработать вкладку ВПП со всеми свойствами (широта, долгота, абс. отметка, длина, ширина, покрытие полос, оснащение системой сближения и посадки и т. д.)
 - Сделать удостоверение пользователей по **сертификату (ЭЦП)** на USB-ом токене. Нужны типы данных от фирмы-изготовителя для разработки диалога открытия содержимого токена и выбора на нем сертификата (ЭЦП). 

![1 001 001](https://user-images.githubusercontent.com/104857185/167037090-9cd548c0-9643-4903-adce-13e2a039226d.jpg)

Остальные замечания см. в исходниках по тэгам **todo** и **fixme**

----
В работе использовались наработки из источников:
 - http://apinfo.ru 
 - http://openflights.org
 - http://www1.ourairport.com/ (в России не открывается)
 - http://planelist.net
 - http://www.flightradar24.com
 - https://www.jetphotos.com/

