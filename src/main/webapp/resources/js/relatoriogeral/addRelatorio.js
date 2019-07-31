$(document).ready( function () {

    var $containerInputsRelatorios = $('#container-inputs-relatorios');
    var $containerRelatorios = $('#relatorios-cadastrados');
    var $btnsRemover;
    var $btnsEditar;
    var $form = $('#form-relatorioGeral');

    var ctx = $('#contx').val();
    var idRelatorioGeral = $('#relatoriogeral-id').val();
    var edicao = false;
    var posicaoEditavel;

    var listaRelatorios = [];
    var relatorio = {
        id: "",
        titulo: "",
        qtdeItens: "",
        mes: "",
        ano: "",
        subcrime: {
            id: "",
            nome: "",
            crime: ""
        }
    };

    $('#btnSalvarRelatorio').click( function () {

        carregarInputs();

        var cont = 0;
        listaRelatorios.push(relatorio);
        listaRelatorios.forEach( function (relatorio) {
            criarInputsHidden($form, relatorio, cont);
            cont++;
        });

        gerarInputsRelatorio(relatorio);
        console.log(listaRelatorios);

        // $containerRelatorios.empty();
        // if (!edicao) {
        //     listaRelatorios.push(relatorio);
        // } else {
        //     // relatorio.id = listaRelatorios[posicaoEditavel].id;
        //     // tarefa.codigoTarefa = listaTarefas[posicaoEditavel].codigoTarefa;
        //     // tarefa.dataAbertura = listaTarefas[posicaoEditavel].dataAbertura;
        //     // listaTarefas[posicaoEditavel] = tarefa;
        // }
        // var cont = 0;
        // $containerInputsRelatorios.empty();
        // listaRelatorios.forEach(function (relatorio) {
        //     criarInputsHidden($form, relatorio, cont);
        //     cont = cont + 1;
        // });
        // gerarInputsRelatorio(relatorio);
    });

    function carregarInputs() {
        relatorio.id = $("input[name='relatorio.id']").val();
        relatorio.titulo = $("input[name='relatoriogeral.titulo']").val();
        relatorio.qtdeItens = $("input[name='relatorio.qtdeCrimes']").val();
        relatorio.mes = $("input[name='relatoriogeral.mes']").val();
        relatorio.ano = $("input[name='relatoriogeral.ano']").val();
        relatorio.subcrime.id = $('#subcrime-relatorio').val();
        relatorio.subcrime.nome = $('#subcrime-relatorio :selected').text();
        relatorio.subcrime.crime = $('#crime-relatorio :selected').text();
    }

    // function requisicaoRelatorios() {
    //     url = ctx + "/relatoriogeral/listaRelatorios?id=" + idRelatorioGeral;
    //
    //     console.log(url);
    //     $.ajax({
    //         dataType: 'json',
    //         type: 'GET',
    //         url: url
    //     }).done(function (data) {
    //         console.log(data);
    //         // listaRelatorios.concat(criarTarefasEInserirNaLista(data));
    //         var cont = 0;
    //         // listaRelatorios.forEach(function (relatorio) {
    //         //     criarInputsHidden($form, relatorio, cont);
    //         //     cont = cont + 1;
    //         // });
    //         console.log("relatorios: " + listaRelatorios.length);
    //     }).fail(function () {
    //         alert("erro");
    //     }).always(function () {
    //         // $btnsEditar = $(".editar-relatorio");
    //         // atribuirListennerBtnEdicao($btnsEditar);
    //         // tabela.spin(false);
    //     });
    // }

    function criarRelatoriosEInserirNaLista(relatorios) {
        relatorios.forEach(function (relatorio) {

            listaRelatorios.push(relatorio);
        });
        return listaRelatorios;
    };

    function criarInputsHidden($form, relatorio, i) {
        // $containerInputsRelatorios.empty();
        $containerInputsRelatorios.prepend("<input " +
            "hidden id='relatorio-geral-" + i + "' name='relatoriogeral.relatorios["+i+"].id' " +
            "value='" + relatorio.id + "'" +
            "/>");
        $containerInputsRelatorios.prepend("<input " +
            "hidden name='relatoriogeral.relatorios[" + i + "].titulo' " +
            "value='" + relatorio.titulo + "'" +
            "/>");
        $containerInputsRelatorios.prepend("<input " +
            "hidden name='relatoriogeral.relatorios[" + i + "].qtdeCrimes' " +
            "value='" + relatorio.qtdeItens + "'" +
            "/>");
        $containerInputsRelatorios.prepend("<input " +
            "hidden name='relatoriogeral.relatorios[" + i + "].mes' " +
            "value='" + relatorio.mes + "'" +
            "/>");
        $containerInputsRelatorios.prepend("<input " +
            "hidden name='relatoriogeral.relatorios[" + i + "].ano' " +
            "value='" + relatorio.ano + "'" +
            "/>");
        // criarRelatoriosEInserirNaLista()
        // requisicaoRelatorios();
    }

    function gerarInputsRelatorio(relatorio, i) {
        $containerRelatorios.append(
            "<input type='hidden' name='relatoriogeral.relatorio.id' value='" + relatorio.id+ "' />" +
            "<div id='' class='panel panel-primary'>" +
            "<div class='panel-heading'>" +
            "<h3 class='panel-title'>"+ relatorio.subcrime.nome + "</h3></div>"+
            "<div class='panel-body'>"+
            "<a id='editar-relatorio' class='editar-relatorio' href='#myModal' data-toggle='modal' posicao='"+i+"' " +
            "style='float: right;'><i class='fa fa-pencil-square-o'></i></a>" +
            "<a id='remover-relatorio' class='remover-relatorio' href='#modalRemRelatorio' posicao='"+i+"' " +
            "style='margin-right: 4px; float: right;'><i class='fa fa-trash-o'></i></a>" +
            "<span class='list-group-item-text' style='size: 14px; margin-right: 16px;'>" +
            "Item: " + relatorio.subcrime.crime +"</span><br>"+
            "<span class='list-group-item-text' style='size: 14px; margin-right: 16px;'>" +
            "Quantidade: " + relatorio.qtdeItens +"</span><br>"+
            "</div>" +
            "</div>" +
            "</div>"
        );
        $btnsRemover = $('.remover-relatorio');
        atribuirListennerBtnRemocao($btnsRemover);
        limparInputs();
    }

    function atribuirListennerBtnRemocao($btnRemocao, relatorio, i) {
        $btnRemocao.off('click');
        $btnRemocao.each(function () {
            $(this).click(function () {
                console.log("remover");
                var posicao = $(this).attr('posicao');
                var idRelatorio = "'#relatorio-geral-"+posicao+"'";
                posicaoEditavel = posicao;
                console.log(posicao + ' e ' + idRelatorio);
                // remover(posicao);
            });
        });
    }

    function remover(posicao) {
        var idRemover = listaRelatorios[posicao].id;
        var urlRemover = btnRemRelatorio + idRemover;
        console.log(urlRemover);
        $('#btnRemRelatorio').attr("href", urlRemover);
    }

    function limparInputs() {
        $('#qtdeCrimes-relatorio').val("");;
        $('#crime-relatorio').val("");
        $('#subcrime-relatorio').val("");
    }

});