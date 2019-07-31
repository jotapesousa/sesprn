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
        <script src="${ctx}/resources/js/relatoriogeral/addRelatorio.js"></script>
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
        <form id="form-relatorioGeral" action="${linkTo[RelatoriogeralController].salvar}" method="post">
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
                <input id="urlSalvar" type="hidden" value="${linkTo[RelatoriogeralController].salvar}"/>
                <div class="col-md-offset-5">
                    <input id="relatoriogeral-id" type="hidden" name="relatoriogeral.id" value="${relatoriogeral.id}"/>
                    <input id="relatoriogeral-dataAbertura" type="hidden" name="relatoriogeral.dataAbertura" value="${relatoriogeral.dataAbertura}"/>
                    <input id="relatoriogeral-responsavel" type="hidden" name="relatoriogeral.responsavel.id" value="${usuarioLogado.usuario.id}"/>
                    <input id="relatoriogeral-delegacia" type="hidden" name="relatoriogeral.delegacia.id" value="${usuarioLogado.usuario.delegacia.id}"/>
                    <input id="relatoriogeral-delegacia-nome" type="hidden" value="${usuarioLogado.usuario.delegacia.nome}"/>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="titulo-relatoriogeral">Título</label>
                            <input type="text" minlength="5" class="form-control" id="titulo-relatoriogeral" required="true"
                                   value="${relatoriogeral.titulo}" placeholder="Titulo do Relatório"
                                   name="relatoriogeral.titulo"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="mesRelatorioGeral">Mês</label>
                                <input type="text" name="relatoriogeral.mes" value="${relatoriogeral.mes}" class="form-control"
                                       id="mesRelatorioGeral" readonly/>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="anoRelatorioGeral">Ano</label>
                                <input type="text" name="relatoriogeral.ano" value="${relatoriogeral.ano}" class="form-control"
                                       id="anoRelatorioGeral" readonly/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <!-- BOTAO PARA MODAL SERVICO -->
                        <div class="col-md-offset-1">
                            <button type="button" id="btnAddRelatorio" class="btn btn-info btn-lg"
                                    data-toggle="modal" data-target="#modalNovoRelatorio">Novo Relatório</button>
                            <br><br>
                        </div>
                    </div>
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
                                <label for="crime-relatorio">Crime </label>
                                <select class="form-control" required id="crime-relatorio" name="relatorio.subcrime.crime.id">
                                    <option value=""></option>
                                    <c:forEach items="${crimes}" var="crime">
                                        <c:if test="${crime.valor == relatorio.crime.id}">
                                            <option value="${crime.valor}" selected="true">${crime.chave}</option>
                                        </c:if>
                                        <c:if test="${!(crime.valor == relatorio.crime.id)}">
                                            <option value="${crime.valor}">${crime.chave}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="subcrime-relatorio">Subcrime:</label>
                                <select class="form-control" required id="subcrime-relatorio" name="relatorio.subcrime.id">
                                    <option></option>
                                    <c:forEach items="${subcrimes}" var="subcrime">
                                        <c:choose>
                                            <c:when test="${subcrime.valor == relatorio.subcrime.id}">
                                                <option value="${subcrime.valor}" selected="true">${subcrime.chave}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${subcrime.valor}">${subcrime.chave}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-3">
                                    <label for="qtdeCrimes-relatorio">Número de Crimes</label>
                                    <input type="text" class="form-control" id="qtdeCrimes-relatorio" required="true"
                                           value="${relatorio.qtdeCrimes}" placeholder=""
                                           name="relatorio.qtdeCrimes"/>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="btnSalvarRelatorio" data-dismiss="modal">Adicionar</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </form>

        <div class="col-md-offset-4 col-md-4">
            <div id="relatorios-cadastrados">
            </div>
        </div>

    </jsp:body>
</tags:layout>