<%--
  Created by IntelliJ IDEA.
  User: samue
  Date: 08/09/2017
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" uri="tagSesprn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<tags:layout>
    <jsp:attribute name="cabecalho">
        <link href="${ctx}/resources/plugins/dataPicker/dataPicker.css" rel="stylesheet"/>
        <link href="${ctx}/resources/css/componentes/checkbox.css" rel="stylesheet"/>
        <style>
            label {
                font-weight: 600;
                font-size: 12px;
            }
            .datepicker {
                z-index: 1151 !important;
            }
            .panel-title {
                border-bottom: 1px solid;
            }
        </style>
    </jsp:attribute>

    <jsp:attribute name="rodape">
        <script src="${ctx}/resources/plugins/typeahead/typeahead.bundle.js"></script>
        <script src="${ctx}/resources/js/regional/form.js"></script>
        <script src="${ctx}/resources/js/delegacias/delegacia.js"></script>
        <script>
            $('#form-regional-tarefa').validator();
        </script>

        <!-- Gerador de Código -->
        <script>
            $('#btn-gerarns').click(function() {
                var ns = 'PC' + moment().year() + moment().unix() + 'RN';

                $('#nserie-delegacia').val(ns);
            })

            if ($(".datePicker").val()) {
                var data = moment($(".datePicker").val(), "YYYY-MM-DD").format("DD/MM/YYYY");
                $(".datePicker").val(data);
                console.log($(".datePicker").val());
            }
        </script>
    </jsp:attribute>

    <jsp:body>
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Cadastro de Manutenções</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="panel painel-cadastro-sisint">
            <form id="form-regional-tarefa" action="${linkTo[RegionalController].salvar}" method="post"
                  enctype="multipart/form-data">
                    <%--<input type="hidden" name="regional.codigoServico" value="${regional.codigoServico}"/>--%>
                <%--<div id="container-inputs-delegacia"></div>--%>
                <%--<input id="regional-dataAbertura" type="hidden" name="regional.dataAbertura"--%>
                       <%--value="${regional.dataAbertura}"/>--%>
                <%--<div id="container-inputs-tarefa"></div>--%>

                <div class="panel-body">
                    <div class="cadastro-servico">
                        <div class="row">
                            <input id="regional-id" type="hidden" name="regional.id" value="${regional.id}"/>

                            <div class="form-group col-md-4">
                                <label for="nome-regional">Nome </label>
                                <input type="text" minlength="3" class="form-control" id="nome-regional" required="true"
                                       value="${regional.nome}" placeholder="Nome" name="regional.nome"/>
                            </div>
                            <%--<div class="form-group col-md-4">--%>
                                <%--<label for="setor-regional">Setor solicitante</label>--%>
                                <%--<select class="form-control" required id="setor-regional" name="regional.setor.id">--%>
                                    <%--<option value=""></option>--%>
                                    <%--<c:forEach items="${setores}" var="setor">--%>
                                        <%--<c:if test="${setor.valor == regional.setor.id}">--%>
                                            <%--<option value="${setor.valor}" selected="true">${setor.chave}</option>--%>
                                        <%--</c:if>--%>
                                        <%--<c:if test="${!(setor.valor == regional.setor.id)}">--%>
                                            <%--<option value="${setor.valor}">${setor.chave}</option>--%>
                                        <%--</c:if>--%>
                                    <%--</c:forEach>--%>

                                <%--</select>--%>
                            <%--</div>--%>
                            <%--<div class="form-group col-md-4">--%>
                                <%--<label for="data-fechamento-regional">Data de Finalização</label>--%>
                                <%--<input type="text" class="form-control datePicker" id="data-fechamento-regional"--%>
                                       <%--required="true"--%>
                                       <%--value="${regional.dataFechamento}"--%>
                                       <%--placeholder="Data de finalização" readonly="readonly" name="regional.dataFechamento"/>--%>
                            <%--</div>--%>
                            <%--<div class="form-group col-md-4">--%>
                                <%--<label for="status-regional">Status: </label>--%>
                                <%--<select type="text" id="status-regional" class="form-control" id="status-equip"--%>
                                        <%--placeholder="Status" required="true" name="regional.status">--%>
                                    <%--<option value=""></option>--%>
                                    <%--<c:forEach items="${status}" var="s">--%>
                                        <%--<c:if test="${s.valor == regional.status.valor}">--%>
                                            <%--<option value="${s.valor}" selected="true">${s.chave}</option>--%>
                                        <%--</c:if>--%>
                                        <%--<c:if test="${!(s.valor == regional.status.valor)}">--%>
                                            <%--<option value="${s.valor}">${s.chave}</option>--%>
                                        <%--</c:if>--%>
                                    <%--</c:forEach>--%>
                                <%--</select>--%>
                            <%--</div>--%>
                            <%--<div class="form-group col-md-4">--%>
                                <%--<label for="tecnico-servico">Técnico Responsável:</label>--%>
                                <%--<select class="form-control" id="tecnico-servico" name="servico.tecnico.id" onchange="mudancaTecnico()">--%>
                                    <%--<option></option>--%>
                                    <%--<c:forEach items="${usuarios}" var="usuario">--%>
                                        <%--<c:if test="${usuario.valor == servico.tecnico.id}">--%>
                                            <%--<option value="${usuario.valor}" selected="true">${usuario.chave}</option>--%>
                                        <%--</c:if>--%>
                                        <%--<c:if test="${!(usuario.valor == servico.tecnico.id)}">--%>
                                            <%--<option value="${usuario.valor}">${usuario.chave}</option>--%>
                                        <%--</c:if>--%>
                                    <%--</c:forEach>--%>
                                <%--</select>--%>
                            <%--</div>--%>
                            <%--<div class="form-group col-md-4">--%>
                                <%--<label for="listaEquipamento">Delegacia</label>--%>
                                <%--<div class="input-group">--%>
                                    <%--<button id="listaEquipamento" type="button" class="btn btn-success"--%>
                                    <%--data-toggle="modal" data-target="#myModal">Inserir Delegacia</button>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class=""></div>--%>
                            <%--<div class="form-group col-md-8">--%>
                                <%--<label for="descricao">Descrição:</label>--%>
                                <%--<textarea class="form-control" name="regional.descricao" rows="7" required="true"--%>
                                          <%--id="descricao">${regional.descricao}</textarea>--%>
                            <%--</div>--%>
                        </div>
                    </div>

                    <!-- Container EQUIPAMENTO SELECIONADO -->
                    <%--<div id="equipamentoCadastrado" hidden class="" style="margin-top: 16px;">--%>
                        <%--<input type='hidden' id="#mant-equip-id" name='regional.delegacia.id' value='${regional.delegacia.id}' />--%>
                        <%--<div id='listEquipamento' class='panel panel-primary'>--%>
                            <%--<div class='panel-heading'>--%>
                                <%--<h3 class='panel-title'>Delegacia</h3>--%>
                            <%--</div>--%>
                            <%--<div class='panel-body'>--%>
                                <%--<a id='editar-tarefa' class='editar-tarefa' href='#myModal' data-toggle='modal'--%>
                                    <%--style='float: right;'><i class='fa fa-pencil-square-o'></i></a>--%>
                                <%--<a id='remover-tarefa' class='remover-tarefa' href='#'--%>
                                    <%--style='margin-right: 4px; float: right;'><i class='fa fa-trash-o'></i></a>--%>
                                <%--<span class='list-group-item-text' style='size: 14px; margin-right: 16px;'>--%>
                                    <%--Nome: ${regional.delegacia.nome}</span><br>--%>
                                <%--<span class='list-group-item-text' style='size: 14px; margin-right: 16px;'>--%>
                                    <%--Tombo: ${regional.delegacia.tombo}</span><br>--%>
                                <%--<span class='list-group-item-text' style='size: 14px; margin-right: 16px;'>--%>
                                    <%--N/S: ${regional.delegacia.numeroSerie}</span><br>--%>
                                <%--<span class='list-group-item-text.' style='size: 14px; margin-right: 16px;'>--%>
                                    <%--Status: ${regional.delegacia.status.chave}</span><br>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                </div>

                <div class="panel" align="right">
                    <button class="btn btn-primary" type="submit">Salvar</button>
                </div>
            </form>
        </div>

        <%--<!-- Modal SELECIONAR EQUIPAMENTO -->--%>
        <%--<div id="myModal" class="modal fade" role="dialog">--%>
            <%--<div class="modal-dialog">--%>

                <%--<!-- Modal content-->--%>
                <%--<div class="modal-content">--%>
                    <%--<div class="modal-header">--%>
                        <%--<button type="button" id="fecharModal" class="close" data-dismiss="modal">&times;</button>--%>
                        <%--<h4 class="modal-title">Selecionar delegacia</h4>--%>
                    <%--</div>--%>
                    <%--<div class="modal-body">--%>
                        <%--<div class="form-group">--%>
                        <%--<label class="radio-inline"><input id="check-ns" type="radio" name="optradio">Buscar por NS</label>--%>
                        <%--<label class="radio-inline"><input id="check-tombo" type="radio" name="optradio">Buscar por Tombo</label>--%>
                        <%--</div>--%>
                        <%--<div class="form-group">--%>
                            <%--<input id="busca-equipamentoPorNS" class="form-control" type="text" maxlength="18" value=""--%>
                                   <%--placeholder="Buscar por NS" style="display: none; float: right;"/>--%>
                        <%--</div>--%>
                        <%--<div class="form-group">--%>
                            <%--<input id="busca-equipamentoTombo" class="form-control" type="text" maxlength="10"value=""--%>
                                   <%--placeholder="Buscar por tombo" style="display: none; float: right;"/>--%>
                        <%--</div>--%>
                        <%--<table class="table">--%>
                            <%--<thead>--%>
                            <%--<tr>--%>
                                <%--<th>Nome</th>--%>
                                <%--<th>Tombo</th>--%>
                                <%--<th>Número de série</th>--%>
                                <%--<th>Status</th>--%>
                                <%--<th>Selecionar</th>--%>
                            <%--</tr>--%>
                            <%--</thead>--%>
                            <%--<tbody id="equip-body">--%>

                            <%--</tbody>--%>
                        <%--</table>--%>
                        <%--<div id="nenhumEquipamento" class="text-center h4">Nenhum Delegacia Encontrado</div>--%>
                    <%--</div>--%>
                    <%--<div class="modal-footer">--%>
                        <%--<button id="cadastrarEquipamento" type="button" class="btn btn-primary"--%>
                                <%--data-toggle="modal" data-target="#modalCriarEquipamento" data-dismiss="modal">Novo Delegacia</button>--%>
                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>--%>
                    <%--</div>--%>
                <%--</div>--%>

            <%--</div>--%>
        <%--</div>--%>

        <%--<!-- Modal NOVO EQUIPAMENTO -->--%>
        <%--<div id="modalCriarEquipamento" class="modal fade" role="dialog">--%>
            <%--<div class="modal-dialog">--%>

                <%--<!-- Modal content-->--%>
                <%--<div class="modal-content">--%>
                    <%--<input id="urlSalvarEquipamento" type="hidden" value="${linkTo[DelegaciaController].salvar}"/>--%>
                    <%--<input type='hidden' id="#equip-novo-id" name='regional.delegacia.id' value='${regional.delegacia.id}' />--%>
                    <%--<div class="modal-header">--%>
                        <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
                        <%--<h4 class="modal-title">Cadastrar Delegacia</h4>--%>
                    <%--</div>--%>
                    <%--<div class="modal-body">--%>
                        <%--<div class="form-group">--%>
                            <%--<label for="nome-delegacia">Nome do Delegacia</label>--%>
                            <%--<input id="nome-delegacia" class="form-control" type="text" name="regional.delegacia.nome"--%>
                                   <%--value="${delegacia.nome}" placeholder="Nome do delegacia">--%>
                        <%--</div>--%>
                        <%--<div class="form-group">--%>
                            <%--<label for="tombo-delegacia">Tombo</label>--%>
                            <%--<input id="tombo-delegacia" class="form-control" type="text" name="regional.delegacia.tombo"--%>
                                   <%--maxlength="10"--%>
                                   <%--value="${delegacia.nome}" placeholder="Digite o tombo do delegacia">--%>
                        <%--</div>--%>
                        <%--<div class="form-group">--%>
                            <%--<label for="nserie-delegacia">Número de Série</label>--%>
                            <%--<div class="input-group">--%>
                                <%--<input type="text" class="form-control" id="nserie-delegacia" name="regional.delegacia.numeroSerie"--%>
                                       <%--value="${delegacia.numeroSerie}" placeholder="Digite o N/S do delegacia" required>--%>
                                <%--<span class="input-group-btn">--%>
                                    <%--<button class="btn btn-default" id="btn-gerarns" type="button">Gerar Código</button>--%>
                                <%--</span>--%>
                            <%--</div><!-- /input-group -->--%>
                        <%--</div>--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<label for="nserie-delegacia">Número de Série</label>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<input id="nserie-delegacia" class="form-control" type="text" name="regional.delegacia.numeroSerie"&ndash;%&gt;--%>
                                       <%--&lt;%&ndash;value="${delegacia.numeroSerie}" placeholder="Digite o N/S do delegacia">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<button id="btn-gerarns" type="button" class="btn btn-default" style="float: right;">Gerar Código</button>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--<div class="form-group">--%>
                            <%--<label>Status: </label>--%>
                            <%--<select type="text" class="form-control" id="status-delegacia" placeholder="Status"--%>
                                    <%--required="true"--%>
                                    <%--name="regional.delegacia.status">--%>
                                <%--<option value=""></option>--%>
                                <%--<c:forEach items="${statusEquipamento}" var="s">--%>
                                    <%--<c:if test="${s.valor == delegacia.status.valor}">--%>
                                        <%--<option value="${s.valor}" selected="true">${s.chave}</option>--%>
                                    <%--</c:if>--%>
                                    <%--<c:if test="${!(s.valor == delegacia.status.valor)}">--%>
                                        <%--<option value="${s.valor}">${s.chave}</option>--%>
                                    <%--</c:if>--%>
                                <%--</c:forEach>--%>
                            <%--</select>--%>
                        <%--</div>--%>
                        <%--<div class="form-group">--%>
                            <%--<label>Setor: </label>--%>
                            <%--<select class="form-control" id="setor-delegacia" name="regional.delegacia.setor.id" type="text">--%>
                                <%--<option value=""></option>--%>
                                <%--<c:forEach items="${setores}" var="setor">--%>
                                    <%--<c:if test="${setor.valor == delegacia.setor.id}">--%>
                                        <%--<option value="${setor.valor}" selected="true">${setor.chave}</option>--%>
                                    <%--</c:if>--%>
                                    <%--<c:if test="${!(setor.valor == delegacia.setor.id)}">--%>
                                        <%--<option value="${setor.valor}">${setor.chave}</option>--%>
                                    <%--</c:if>--%>
                                <%--</c:forEach>--%>
                            <%--</select>--%>
                        <%--</div>--%>
                        <%--<div class="form-group">--%>
                            <%--<label>Descrição: </label>--%>
                            <%--<textarea id="descricao-delegacia" class="form-control" minlength="6" name="regional.delegacia.descricao" rows="2"--%>
                                      <%--required="true" >${delegacia.descricao}</textarea>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="modal-footer">--%>
                        <%--<button id="cadastro-equip" class="btn btn-primary" data-dismiss="modal">Cadastrar</button>--%>
                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>--%>
                    <%--</div>--%>
                <%--</div>--%>

            <%--</div>--%>
        <%--</div>--%>
    </jsp:body>
</tags:layout>
