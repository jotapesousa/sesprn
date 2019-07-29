/**
 * Created by samue on 15/09/2017.
 */

$(document).ready(function () {

    var $span =  $(this).find('.label');
    var $labelStatus = $(this).find('.label-status');
    var $labelPrioridade = $(this).find('.label-prioridade');

    // Cria label no Status do SERVIÇO
    $labelStatus.each(function () {
        var descricao =  $(this).text();
        console.log(descricao);
        if(descricao == 'Concluído') {
            $(this).addClass('label label-success');
        } else if(descricao == 'Em Execução') {
            $(this).addClass('label label-info');
        } else if(descricao == 'Aguardando Execução') {
            $(this).addClass('label label-warning');
        }
    });

    // Cria label na prioridade do SERVIÇO
    $labelPrioridade.each(function () {
        var descricao =  $(this).text();
        if(descricao == 'Baixa') {
            $(this).addClass('label label-success');
        } else if(descricao == 'Média') {
            $(this).addClass('label label-warning');
        } else if(descricao == 'Alta') {
            $(this).addClass('label label-danger');
        }
    });

    $('.link-remover').click( function () {
        var urlRemover = $(this).attr("url-remover");
        $('#btn-remover').attr('href', urlRemover);
        console.log(urlRemover);
    });

    $(".datePicker").datepicker({
        format: "dd/mm/yyyy"
    });

    $(".date-column").each(function () {
        var data =  $(this).text();
        data = moment(data, 'YYYY-MM-DD').format('DD/MM/YYYY');
        $(this).text(data);
    });

    $('.alert').fadeOut(7000);
});





