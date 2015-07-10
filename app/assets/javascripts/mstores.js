
// ................массив объектов как sourced data...................

//var @d1 = $("#st").val();
//var @d2 = $("#fi").val();

$(document).ready(function() {
    var dataSet;    // = {data:[]};
    //$("#fi").value = Date();
    //$("#st").value = $("#fi").val()-60;
    var d1 = '2015-06-02';
    var d2 = '2015-06-29';

    $.fn.dataTable.ext.search.push(
        function( settings, data, dataIndex ) {
            var min = $('#st').val();
            var max = $('#fi').val();
            var d = data[2].substr(0,2);              // use data for the age column
            var m = data[2].substr(3,2);              // use data for the age column
            var y = data[2].substr(6,4);              // use data for the age column
            var upt = y+'-'+m+'-'+d;
            //console.log('min; max ='+min+';'+max);
            if ( min <= upt  && upt <= max )
            {
               // console.log('true: upt='+upt);
                return true;
            }
            //console.log('false: upt='+upt);
            return false;
        }
    );

    var table = $('#example').dataTable({
        //"ajax": 'index.json'
        "ajax": 'mstores.json?d1='+d1+'&d2='+d2
        //"data":  dataSet.always(function(){dataSet.responseText})
        //"ajax": dataSet.always(function(){dataSet.responseText})
        //"ajax": function ("http://localhost:4000/mstores", {d1: d1, d2: d2},"JSON").done(function(){responseText})
//        "ajax": {
//                "par" : {d1:"2015-06-14",d2:"2015-06-29"},
//                "url" :  "http://localhost:4000/mstores",
//                "dataType": "JSON"
//              function (par, callback, settings) {  //("http://localhost:4000/mstores", {d1: d1, d2: d2},"JSON").done(function(){responseText});
//              callback(
//                responseText  //JSON.parse( localStorage.getItem(dataSet) )
//            );
//        }

        ,"columns": [
            { className: "dt-head-center","data": "position" },
            { className: "dt-head-center","data": "price"},
            { className: "dt-center","data": "updated_at" },
            { className: "dt-center","data": "Действия" }
        ],
        "language": {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать: _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }
        },

        "dom": 'l<"tulbar">frtip',          // для календариков запроса к БД по датам сделал

        "initComplete": function () {       // поиск в табл. по клику на ячейке
            var api = this.api();
            api.$('td').click( function () {
                api.search( this.innerHTML ).draw();
            } );
        },

        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api();//, data;

            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                i.replace(/[\$,]/g, '')*1:
                    typeof i === 'number' ?
                        i : 0;
            };

            data = api.column( 1 ).cache('search');
            total = data.length ?
                data.reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                } ) :
                0;

            // Total over this page
            pageTotal = api
                .column( 1, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );

            // Update footer
            $( api.column( 3 ).footer() ).html(
                '$'+pageTotal.toFixed(2) +' (Всего:  $'+ total.toFixed(2) +')'
            );

        }

    } );

    table.show();

    $("div.tulbar").html('<div id="dgroup"><input type="date" id="st" value='+d1+'><input type="date"  id="fi" value='+d2+'></div><div id="rgroup"><label title="День"><input type="radio" name="per" value="day">d</label><label title="Неделя"><input type="radio" name="per" value="day">w</label><label title="Месяц"><input type="radio" name="per" value="day">m</label><label title="Все"><input type="radio" name="per" value="day" checked>A</label></div>');
    //<form action="/" method="get"><input type="submit"></form>  value="2015-06-01"  value="2015-06-30"

    jQuery('#st,#fi').change(function() {
        //console.log('st='+$('#st').val()+'  fi='+$("#fi").val());
        table.fnDraw();
    });
/*
    jQuery('#fi').change(function() {

        d1 = $("#st").val();
        d2 = $("#fi").val();

        if(d2 == "" || d2 == null){
            d2 = '2015-06-30';
            $("#fi").value = d2;
        }
        if(d1 == "" || d1 == null){
            d1 = '2015-06-10';
            $("#st").value = d1;
        }
        console.log("from date change: d1="+d1+"   d2="+d2);

        dataSet = jQuery.getJSON("mstores.json", {d1: d1, d2: d2},"JSON")       //http://localhost:4000/
            .done(function( data ) {                             // куда все это добро девать? mstore.json?
                    console.log(data);                           //!!!!!! Object cache !!!!!!!
                var api = this.api();
                table.fnDraw();
                //location.reload(true);                         // перегружает всю страницу, а надо только табл.
            });

        dataSet.always(function(){console.log(dataSet.responseText)});  //!!!!!!!!!Text!!!!!!!!
    } );
*/

    //console.log(dataSet);
/*
    if(dataSet.always(function(){dataSet.responseText}) != "{data:[]}") {
 dataSet.always(function(){
 table.clear;
 table.rows.add(dataSet.responseText);
 table.draw;
 });
// $.each(data, function (idx, obj) {
//   table.row.add(data[idx]);
// });

*/
    //table.ajax.reload( null, false );


} );

/*
 <%#= link_to 'Изменяем ', edit_mstore_path(mstore) %>
 <%#= link_to 'Удаляем ', mstore, method: :delete, data: { confirm: 'А надо ли?' } %>
  */

/*     // выдает на консоль все строки данных со всем барахлом, инкапсулированным в экземплярах классов
 "drawCallback": function( settings ) {
 var api = this.api();

 // Output the data for the visible rows to the browser's console
 console.log( api.rows( {page:'current'} ).data() );
 }
 */
