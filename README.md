# первая попытка

  замены штучек от Foundation на <== bootstrap
[*Exprmnts from Vova M*](http://railstutorial.org/)
 [  Вова М](http://p-chip.com/).
 
 заменил все /images/ <== на /assets/ в файле jquery.dataTables.min.css
 далее:
    по библиотеке "DataTable":
 
  + изменение data source на ajax
  + русификация управляющих элементов
  + поиск в табл. по клику на элемент табл. (Using API in callbacks)
  + подсчет суммы по колонке на странице и в целом (Adv.Inst.:Footer callback, API:Using API in callbacks)
  + активизация колонки "действия" (: -Row selection and deletion (single row), :Form inputs - для редактирования записи
      "на месте")
  ? добавление колонки номера строки (индекса) в таблицу (API: Index column)
  + введение поиска по интервалу дат в шапке (?"custom toolbar elements"-->dom + Plug-ins:Custom filtering - range search)
    plug-in API: "headerCallback": function(){...};
  - введение "авторизационной" зависмости на колонке "действия" - м.б. вовсе ее скрывать
  - элегантность таблицы (API: Scrolling and jQuery UI tabs)
  - сохранение элементов календаря при обновлении страницы
  - refresh данных таблицы через gem "gon"
  
  прочие нововведения:
  
  + решение проблемы синхронизации time-zone приклада и БД
     application.rb: config.time_zone = 'Europe/Moscow'+ (в Mysql System подхватывается)+ config/initializers/date_formats.rb
     это влияет на вывод при преобразовании {date,DateTime,Time} в to_s; при работе в терминале: t.strftime("%d.%m.%Y  %X")
  - проверить на выборкке из БД по временнОму диапазону
  - голосовое управление меню
  - переход на "живые кнопки"