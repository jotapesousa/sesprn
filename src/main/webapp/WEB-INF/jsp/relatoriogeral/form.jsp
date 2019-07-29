<%--
  Created by IntelliJ IDEA.
  User: SINF
  Date: 23/07/2019
  Time: 15:04
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
        <script src="${ctx}/resources/js/relatoriogeral/relatorioGeral.js"></script>
        <%--<script src="${ctx}/resources/js/servicos/tarefas.js"></script>--%>
        <%--<script src="${ctx}/resources/js/servicos/btnTarefa.js"></script>--%>
        <%--<script src="${ctx}/resources/js/servicos/adicionarTarefa.js"></script>--%>
    </jsp:attribute>

    <jsp:body>
        <div class="row">
            <div class="col-lg-12" align="center">
                <h1 class="page-header">Cadastro de Relatórios</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <input id="contx" hidden value="${ctx}">
        <form id="form-relatorioGeral" action="${linkTo[RelatorioGeralController].salvar}" method="post">

            <div id="container-inputs-relatorios">

            </div>
            <%--<c:forEach items="${listaLogs}" var="log" varStatus="status">--%>
                <%--<input type="hidden" name="servico.logRelatorios[${status.index}].id" value="${log.id}"/>--%>
                <%--<input type="hidden" name="servico.logRelatorios[${status.index}].log" value="${log.log}"/>--%>
                <%--<input type="hidden" name="servico.logRelatorios[${status.index}].usuario.id" value="${log.usuario.id}"/>--%>
                <%--<input type="hidden" name="servico.logRelatorios[${status.index}].servico.id" value="${log.servico.id}"/>--%>
                <%--<input type="hidden" name="servico.logRelatorios[${status.index}].dataAlteracao" value="${log.dataAlteracao}"/>--%>
            <%--</c:forEach>--%>
            <%--<input type="hidden" name="servico.codigoServico" value="${servico.codigoServico}"/>--%>
            <div class="panel-body">
                <input id="urlSalvar" type="hidden" value="${linkTo[RelatorioGeralController].salvar}"/>
                <div class="col-md-offset-4">
                    <input id="relatoriogeral-id" type="hidden" name="relatoriogeral.id" value="${relatoriogeral.id}"/>
                    <input id="relatoriogeral-dataAbertura" type="hidden" name="relatoriogeral.dataAbertura" value="${relatoriogeral.dataAbertura}"/>
                    <input id="relatoriogeral-responsavel" type="hidden" name="relatoriogeral.responsavel.id" value="${usuarioLogado.usuario.id}"/>
                    <input id="relatoriogeral-delegacia" type="hidden" name="relatoriogeral.delegacia.id" value="${usuarioLogado.usuario.delegacia.id}"/>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="titulo-relatoriogeral">Título</label>
                            <input type="text" minlength="5" class="form-control" id="titulo-relatoriogeral" required="true"
                                   value="${relatoriogeral.titulo}" placeholder="Titulo do Relatório"
                                   name="relatoriogeral.titulo"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-2">
                            <label for="qteCrimes-relatoriogeral">Número de Crimes</label>
                            <input type="text" class="form-control" id="qteCrimes-relatoriogeral" required="true"
                                   value="${relatoriogeral.qtdeCrimes}" placeholder=""
                                   name="relatoriogeral.qtdeCrimes"/>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="mesRelatorio">Mês</label>
                                <input type="text" name="relatoriogeral.mes" value="${relatoriogeral.mes}" class="form-control"
                                       id="mesRelatorio" readonly/>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="anoRelatorio">Ano</label>
                                <input type="text" name="relatoriogeral.ano" value="${relatoriogeral.ano}" class="form-control"
                                       id="anoRelatorio" readonly/>
                            </div>
                        </div>
                    </div>
                    <%--<div class="row">--%>

                    <%--</div>--%>
                    <%--<div class="row">--%>
                        <%--<div class="form-group col-md-6">--%>

                        <%--</div>--%>
                    <%--</div>--%>
                </div>
                            <%--<div class="row">--%>
                            <%--<div class="form-group col-md-3">--%>
                            <%--<label for="delegacia-relatoriogeral">Delegacia </label>--%>
                            <%--<select class="form-control" required id="delegacia-relatoriogeral" name="relatoriogeral.delegacia.id">--%>
                            <%--<option value=""></option>--%>
                            <%--<c:forEach items="${delegacias}" var="delegacia">--%>
                            <%--<c:if test="${delegacia.valor == relatoriogeral.delegacia.id}">--%>
                            <%--<option value="${delegacia.valor}" selected="true">${delegacia.chave}</option>--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${!(delegacia.valor == relatoriogeral.delegacia.id)}">--%>
                            <%--<option value="${delegacia.valor}">${delegacia.chave}</option>--%>
                            <%--</c:if>--%>
                            <%--</c:forEach>--%>
                            <%--</select>--%>
                            <%--</div>--%>
                            <%--</div>--%>

                <!-- BOTAO PARA MODAL SERVICO -->
                <div class="panel" align="center">
                    <button type="button" id="btnAddRelatorio" class="btn btn-primary btn-lg"
                            data-toggle="modal" data-target="#modalNovoRelatorio">Novo Relatório</button>
                    <br><br>
                </div>
            </div>

            <!-- MODAL SERVICO -->
            <div class="modal fade" id="modalNovoRelatorio" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <input type="hidden" name="relatorio.id" value="${relatorio.id}"/>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Novo Relatório</h4>
                        </div>
                        <div id="corpoModalServico" class="modal-body">
                            <div class="form-group">
                                <label for="crime-relatoriogeral">Crime </label>
                                <select class="form-control" required id="crime-relatoriogeral" name="relatoriogeral.subcrime.crime.id">
                                    <option value=""></option>
                                    <c:forEach items="${crimes}" var="crime">
                                        <c:if test="${crime.valor == relatoriogeral.crime.id}">
                                            <option value="${crime.valor}" selected="true">${crime.chave}</option>
                                        </c:if>
                                        <c:if test="${!(crime.valor == relatoriogeral.crime.id)}">
                                            <option value="${crime.valor}">${crime.chave}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="subcrime">Subcrime:</label>
                                <select class="form-control" required id="subcrime" name="relatoriogeral.subcrime.id">
                                    <option></option>
                                    <c:forEach items="${subcrimes}" var="subcrime">
                                        <c:choose>
                                            <c:when test="${subcrime.valor == relatoriogeral.subcrime.id}">
                                                <option value="${subcrime.valor}" selected="true">${subcrime.chave}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${subcrime.valor}">${subcrime.chave}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>
                            <button type="submit" class="btn btn-primary" id="btnSalvarServico">Sim</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

        </form>

        <div id="novosrelatorios-cadastrados"class="list-group">
            NOVOS RELATORIOS
        </div>

            <%--<!-- MODAL TAREFA -->--%>
            <%--<div class="modal fade" id="myModal" role="dialog">--%>
                <%--<div class="modal-dialog">--%>
                    <%--<input type="hidden" name="tarefa.id" value="${tarefa.id}"/>--%>
                    <%--<!-- Modal content-->--%>
                    <%--<div class="modal-content">--%>
                        <%--<div class="modal-header">--%>
                            <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
                            <%--<h2 class="modal-title text-center">Cadastro de Tarefa</h2>--%>
                        <%--</div>--%>
                        <%--<div class="modal-body">--%>
                            <%--<div class="form-horizontal">--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="control-label col-sm-2" for="titulo-tarefa">Título:</label>--%>
                                    <%--<div class="col-sm-10">--%>
                                        <%--<input type="email" name="tarefa.titulo" class="form-control"--%>
                                               <%--id="titulo-tarefa" placeholder="Titulo">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="control-label col-sm-2" for="data-fechamento-tarefa">Data de--%>
                                        <%--Finalização:</label>--%>
                                    <%--<div class="col-md-10">--%>
                                        <%--<input type="text" class="form-control datePicker"--%>
                                               <%--id="data-fechamento-tarefa"--%>
                                               <%--required="true"--%>
                                               <%--value="${tarefa.dataFechamento}"--%>
                                               <%--placeholder="Data de finalização" readonly="readonly" name="tarefa.dataFechamento"/>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="control-label col-sm-2" for="status-tarefa">Status</label>--%>
                                    <%--<div class="col-md-10">--%>
                                        <%--<select type="text" class="form-control" id="status-tarefa"--%>
                                                <%--placeholder="Status"--%>
                                                <%--required="true"--%>
                                                <%--name="tarefa.statusTarefa">--%>
                                            <%--<option value=""></option>--%>
                                            <%--<c:forEach items="${status}" var="s">--%>
                                                <%--<c:if test="${s.valor == tarefa.statusTarefa.valor}">--%>
                                                    <%--<option value="${s.valor}" selected="true">${s.chave}</option>--%>
                                                <%--</c:if>--%>
                                                <%--<c:if test="${!(s.valor == tarefa.statusTarefa.valor)}">--%>
                                                    <%--<option value="${s.valor}">${s.chave}</option>--%>
                                                <%--</c:if>--%>
                                            <%--</c:forEach>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="control-label col-sm-2" for="tecnico-tarefa">Ténico--%>
                                        <%--Responsável</label>--%>
                                    <%--<div class="col-md-10">--%>
                                        <%--<select class="form-control" id="tecnico-tarefa" name="tarefa.tecnico">--%>
                                            <%--<option value=""></option>--%>
                                            <%--<c:forEach items="${usuarios}" var="usuario">--%>
                                                <%--<c:if test="${usuario.valor == servico.tecnico.id}">--%>
                                                    <%--<option value="${usuario.valor}"--%>
                                                            <%--selected="true">${usuario.chave}</option>--%>
                                                <%--</c:if>--%>
                                                <%--<c:if test="${!(usuario.valor == servico.tecnico.id)}">--%>
                                                    <%--<option value="${usuario.valor}">${usuario.chave}</option>--%>
                                                <%--</c:if>--%>
                                            <%--</c:forEach>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<label>Possui pendência:--%>
                                    <%--<div style="margin-left: 16px; float: right;">--%>
                                        <%--<input type="checkbox" name="tarefa.pendente" value="${tarefa.pendente}"/>--%>
                                    <%--</div>--%>
                                <%--</label>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="control-label col-sm-2" for="descricao-tarefa">Descrição:</label>--%>
                                    <%--<div class="col-md-10">--%>
                                            <%--<textarea class="form-control" name="tarefa.descricao" rows="2" required="true"--%>
                                                      <%--id="descricao-tarefa">${tarefa.descricao}</textarea>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>

                        <%--</div>--%>
                        <%--<div class="modal-footer">--%>
                            <%--<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>--%>
                            <%--<button id="btnSalvarTarefa" type="button" class="btn btn-primary" data-dismiss="modal">--%>
                                <%--Salvar--%>
                            <%--</button>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>

        </div>
    </jsp:body>
</tags:layout>