$(document).ready( function () {

    var ctx = $('#contx').val();
    var data = new Date();
    var mesRelatorio = data.getMonth() + 1;

    console.log("oi " + $('#relatoriogeral-delegacia').val());
    console.log("oi2 " + $('#relatoriogeral-responsavel').val());

    if (mesRelatorio < 10) {
        mesRelatorio = "0" + mesRelatorio;
    }

    $('#mesRelatorio').val(String(mesRelatorio));
    $('#anoRelatorio').val(String(data.getFullYear()));

    $('#crime-relatoriogeral').change( function () {
       var id = $('#crime-relatoriogeral').val();

       console.log(ctx);
       if (id != null) {
           $.ajax( {
               url: ctx + "/relatoriogeral/buscarSubCrimes?id=" + id,
               type: 'GET',
               dataType: 'json'
           }).done( function (data) {
               console.log(data);
               $('#subcrime').empty();
               $('#subcrime').append("<option value=''></option>");
               data.forEach(function (subcrime) {
                   $('#subcrime').append("<option value='"+subcrime.id+"'>"+subcrime.nome+"</option>");
               });
           }).fail(function () {
               alert("ERRO!")
           }).always(function () {
           });
       }
    });

    $('#btnServico').click( function () {
        console.log($('#mesRelatorio').val());
        console.log($('#anoRelatorio').val());
        console.log($('#crime-relatoriogeral').val());
        console.log($('#qteCrimes-relatoriogeral').val());
        console.log($('#subcrime').val());
    });


});