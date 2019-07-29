$(document).ready( function () {

    $('.link-remover').click( function () {
        var urlRemover = $(this).attr("url-remover");
        $('#btn-remover').attr('href', urlRemover);
    });

});