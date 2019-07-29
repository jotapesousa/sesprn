$(document).ready( function () {

    $('.link-permitir').click( function () {
        var id = $('.link-permitir').attr('id-permitir');
        $('#inputPermitir').val(id);
       // var urlPermitir = $('.link-permitir').attr('url-permitir');
       // $('#btn-permitir').attr('href', urlPermitir);
       // console.log($('#btn-permitir').attr('href'));
    });

    $('#delegacia-usuario').change( function () {
        var id = $('#inputPermitir').val();
        var delegacia = $('#delegacia-usuario :selected').val();
        var urlPermissao = $('.link-permitir').attr('url-permitir') + "?id=" + id + "&idDelegacia=" + delegacia;
        console.log(urlPermissao);
        $('#btn-permitir').attr('href', urlPermissao);
    });

    $('.link-desativar').click( function () {
        var urlDesativar = $(this).attr('url-desativar');
        $('#btn-desativar').attr('href', urlDesativar);
        console.log($('#btn-desativar').attr('href'));
    });

});