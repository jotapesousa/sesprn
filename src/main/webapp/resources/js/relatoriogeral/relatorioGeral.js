$(document).ready( function () {

    var ctx = $('#contx').val();
    var data = new Date();
    var mesRelatorioGeral = data.getMonth() + 1;
    var delegacia = $('#relatoriogeral-delegacia-nome').val();
    var idRelatorioGeral = $('#relatoriogeral-id').val();

    if (mesRelatorioGeral < 10) {
        mesRelatorioGeral = "0" + mesRelatorioGeral;
    }

    $('#titulo-relatoriogeral').val("REL-" + mesRelatorioGeral + "-" + data.getFullYear() + "-" + delegacia);
    $('#mesRelatorioGeral').val(String(mesRelatorioGeral));
    $('#anoRelatorioGeral').val(String(data.getFullYear()));

    console.log($('#anoRelatorioGeral').val());
    console.log($('#mesRelatorioGeral').val());

    // if (idRelatorioGeral == '') {
    //     console.log(idRelatorioGeral);
    //     $('#form-relatorioGeral').submit();
    // }

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

    // $('#btnServico').click( function () {
    //     console.log($('#mesRelatorioGeral').val());
    //     console.log($('#anoRelatorioGeral').val());
    //     console.log($('#crime-relatorio').val());
    //     console.log($('#qteCrimes-relatorio').val());
    //     console.log($('#subcrime').val());
    // });


});