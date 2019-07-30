$(document).ready( function () {

    var $containerInputsRelatorios = $('#container-inputs-relatorios');
    var $containerRelatorios = $('#relatorios-cadastrados');
    var $btnsRemover;
    var $btnsEditar;

    var edicao = false;


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

        $containerRelatorios.empty();
        if (!edicao) {
            listaRelatorios.push(relatorio);
        } else {
            relatorio.id = listaRelatorios[posicaoEditavel].id;
            // tarefa.codigoTarefa = listaTarefas[posicaoEditavel].codigoTarefa;
            // tarefa.dataAbertura = listaTarefas[posicaoEditavel].dataAbertura;
            // listaTarefas[posicaoEditavel] = tarefa;
        }
        var cont = 0;
        $containerInputsRelatorios.empty();
        listaRelatorios.forEach(function (relatorio) {
            criarInputsHidden($form, relatorio, cont);
            cont = cont + 1;
        });

        console.log(relatorio);
        gerarInputsRelatorio(relatorio);
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
        // $containerInputsRelatorios.prepend("<input " +
        //     "hidden name='relatoriogeral.relatorios[" + i + "].tecnico.id' " +
        //     "value='" + tarefa.tecnico.id + "'" +
        //     "/>");
        // $containerInputsRelatorios.prepend("<input " +
        //     "hidden name='relatoriogeral.relatorios[" + i + "].codigoTarefa' " +
        //     "value='" + tarefa.codigoTarefa + "'" +
        //     "/>");
        // $containerInputsRelatorios.prepend("<input " +
        //     "hidden name='relatoriogeral.relatorios[" + i + "].dataAbertura' " +
        //     "value='" + tarefa.dataAbertura + "'" +
        //     "/>");
        // $containerInputsRelatorios.prepend("<input " +
        //     "hidden name='relatoriogeral.relatorios[" + i + "].pendente' " +
        //     "value='" + tarefa.pendente + "'" +
        //     "/>");
        gerarInputsRelatorio(relatorio, i);
    }

    function gerarInputsRelatorio(relatorio) {
        // console.log(relatorio);
        $containerRelatorios.append(
            // "<input type='hidden' name='relatoriogeral.relatorio.id' value='" + relatorio.id+ "' />" +
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
                var posicao = $(this).attr('posicao');
                var idRelatorio = "'#relatorio-geral-"+posicao+"'";
                posicaoEditavel = posicao;
                remover(posicao);
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