$(document).ready(function() {
    // $('#inviteTable').DataTable();
    // $('#invitedTable').DataTable();

    var itable = $('#inviteTable')
    itable.DataTable();
    var utable = $('#invitedTable')
    utable.DataTable();


    });


$(".btn.btn-datatable.btn-icon.btn-transparent-dark.mr-2.invite").click(function() {
    var row = $(this).closest('tr');
    var invitedTable = $('#invitedTable')

    var data = row.children();

    var id = "<td>" + data.eq(0).text() + "</td>";
    var name = "<td>" + data.eq(1).text() + "</td>";
    var company = "<td>" + data.eq(2).text()+ "</td>";
    var position = "<td>" + data.eq(3).text()+ "</td>";
    var btn = "<td><button class=\"btn btn-datatable btn-icon btn-transparent-dark mr-2 uninvite\" type=\"button\"><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-user-plus\"><path d=\"M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2\"></path><circle cx=\"8.5\" cy=\"7\" r=\"4\"></circle><line x1=\"23\" y1=\"11\" x2=\"17\" y2=\"11\"></line></svg></button> </td>";

    invitedTable.append("<tr role=\"row\">"+id+name+company+position+btn+"</tr>");

    row.remove();
})

$(".btn.btn-datatable.btn-icon.btn-transparent-dark.mr-2.uninvite").click(function() {
    var row = $(this).closest('tr');
    var inviteTable = $('#inviteTable')

    var data = row.children();

    var id = "<td>" + data.eq(0).text() + "</td>";
    var name = "<td>" + data.eq(1).text() + "</td>";
    var company = "<td>" + data.eq(2).text()+ "</td>";
    var position = "<td>" + data.eq(3).text()+ "</td>";
    var btn = "<td><button class=\"btn btn-datatable btn-icon btn-transparent-dark mr-2 invite\" type=\"button\"><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-user-minus\"><path d=\"M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2\"></path><circle cx=\"8.5\" cy=\"7\" r=\"4\"></circle><line x1=\"20\" y1=\"8\" x2=\"20\" y2=\"14\"></line><line x1=\"23\" y1=\"11\" x2=\"17\" y2=\"11\"></line></svg></button> </td>";

    inviteTable.append("<tr role=\"row\">"+id+name+company+position+btn+"</tr>");

    row.remove();
})