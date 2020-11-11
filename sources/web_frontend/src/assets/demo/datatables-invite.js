$(document).ready(function() {
    // $('#inviteTable').DataTable();
    // $('#invitedTable').DataTable();

    var itable = $('#inviteTable').DataTable();
    //itable.DataTable();
    var utable = $('#invitedTable').DataTable();
    //utable.DataTable();
    

    $(document).on("click", '.uninvite',unInviteUser);
    $(document).on("click", '.invite',InviteUser);

});

function InviteUser() {
    var itable = $('#inviteTable').DataTable();
    var utable = $('#invitedTable').DataTable();

    var row = $(this).closest('tr');
    
    var data = row.children();

    var btn = "<button class=\"btn btn-datatable btn-icon btn-transparent-dark mr-2 uninvite\" type=\"button\"><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-user-plus\"><path d=\"M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2\"></path><circle cx=\"8.5\" cy=\"7\" r=\"4\"></circle><line x1=\"23\" y1=\"11\" x2=\"17\" y2=\"11\"></line></svg></button>";
    
    new_invite = utable.row.add( [
        data.eq(0).text(),
        data.eq(1).text(),
        data.eq(2).text(),
        data.eq(3).text(),
        data.eq(4).text(),
        btn
    ]).draw(false);


    itable.row($(this).closest('tr')).remove().draw(false);
}    

function unInviteUser() {
    var utable = $('#invitedTable').DataTable();
    var itable = $('#inviteTable').DataTable();

    var row = $(this).closest('tr');
    
    var data = row.children();

    var btn = "<button class=\"btn btn-datatable btn-icon btn-transparent-dark mr-2 invite\" type=\"button\"><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-user-minus\"><path d=\"M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2\"></path><circle cx=\"8.5\" cy=\"7\" r=\"4\"></circle><line x1=\"20\" y1=\"8\" x2=\"20\" y2=\"14\"></line><line x1=\"23\" y1=\"11\" x2=\"17\" y2=\"11\"></line></svg></button>";

    new_uninvite = itable.row.add( [
        data.eq(0).text(),
        data.eq(1).text(),
        data.eq(2).text(),
        data.eq(3).text(),
        data.eq(4).text(),
        btn
    ]).draw(false);

    utable.row($(this).closest('tr')).remove().draw(false);
}

