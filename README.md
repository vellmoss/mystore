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
  
  прочие нововведения:
  
  - решение проблемы синхронизации time-zone приклада и БД
     TimeZone.getDefault().getID() = Europe/Moscow — учитывая, что я в Москве, это правильно
     TimeZone.getDefault().useDaylightTime() = true — что неправильно, но как я могу на это повлиять?
  - голосовое управление меню
  - переход на "живые кнопки"