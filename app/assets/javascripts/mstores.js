
// ................массив объектов как sourced data...................


$(document).ready(function() {
    $('#example').dataTable( {
        "ajax": 'mstores.json',
        "columns": [
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

        "dom": 'l<"tulbar">frtip',

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

            // Total over all pages
            /*total = api
                .column( 1 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                } );*/

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

    $("div.tulbar").html('<div id="dgroup"><input type="date" id="st" ><input type="date" id="fi" ></div><div id="rgroup"><label title="День"><input type="radio" name="per" value="day">d</label><label title="Неделя"><input type="radio" name="per" value="day">w</label><label title="Месяц"><input type="radio" name="per" value="day">m</label><label title="Все"><input type="radio" name="per" value="day" checked>A</label></div>');

} );

/*
var table = $('#example').DataTable( {
    ajax: 'http://localhost:4000/mstores.json'
} );
//table.ajax.url( 'http://localhost:4000/mstores.json' ).load();
alert( 'Data source: '+table.ajax.url() ); // Will show 'Data source: data.json'
*/

/*
 columns: [
 { "data": 'position' },
 { "data": 'price' },
 { "data": 'updated_at' },
 { "data": 'Действия' }      //чтобы реальные ссылки сделать: "fnRender": function (oObj)
 // {return '<a href=\"Details/' +
 //oObj.aData[0] + '\">View</a>';
 ]
 <%#= link_to 'Изменяем ', edit_mstore_path(mstore) %>
 <%#= link_to 'Удаляем ', mstore, method: :delete, data: { confirm: 'А надо ли?' } %>
  */
/*
 "dataSrc": function ( json ) {
 for ( var i=0, ien=json.data.length ; i<ien ; i++ ) {
 //json.data[i][0] = json[i][0]+" "; json[i][1] = json[i][1]+ " "; json[i][2] = json[i][2]+" ";
 json.data[i][4] = '<a href=\"mstores/'+data[i][0]+'\">Изменить</a>'+'  Стереть';
 }
 return json.data;
 }

 */
/*,     // выдает на консоль все строки данных со всем барахлом, инкапсулированным в экземплярах классов
 "drawCallback": function( settings ) {
 var api = this.api();

 // Output the data for the visible rows to the browser's console
 console.log( api.rows( {page:'current'} ).data() );
 }
 */
/*
,_: console.log( 'Column price sum: '+
    this
        .column( 1 )
        .data()
        .reduce( function (a,b) {
            return a + b;
        } )
)
*/
