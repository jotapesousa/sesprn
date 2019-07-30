$(document).ready( function () {

    var ctx = $('#contx').val();
    var data = new Date();
    var mesRelatorio = data.getMonth() + 1;
    var delegacia = $('#relatoriogeral-delegacia-nome').val();

    console.log("oi " + $('#relatoriogeral-delegacia').val());
    console.log("oi2 " + $('#relatoriogeral-responsavel').val());

    if (mesRelatorio < 10) {
        mesRelatorio = "0" + mesRelatorio;
    }

    $('#titulo-relatoriogeral').val("REL-" + mesRelatorio + "-" + data.getFullYear() + "-" + delegacia);
    $('#mesRelatorio').val(String(mesRelatorio));
    $('#anoRelatorio').val(String(data.getFullYear()));

    $('#crime-relatorio').change( function () {
       var id = $('#crime-relatorio').val();

       console.log(ctx);
       if (id != null) {
           $.ajax( {
               url: ctx + "/relatoriogeral/buscarSubCrimes?id=" + id,
               type: 'GET',
               dataType: 'json'
           }).done( function (data) {
               console.log(data);
               $('#subcrime-relatorio').empty();
               $('#subcrime-relatorio').append("<option value=''></option>");
               data.forEach(function (subcrime) {
                   $('#subcrime-relatorio').append("<option value='"+subcrime.id+"'>"+subcrime.nome+"</option>");
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
        console.log($('#crime-relatorio').val());
        console.log($('#qteCrimes-relatorio').val());
        console.log($('#subcrime').val());
    });


});