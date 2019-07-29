<%--
  Created by IntelliJ IDEA.
  User: SINF
  Date: 25/05/2018
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" uri="tagSesprn" %>
<%@ taglib prefix="td" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<tags:layout>
    <jsp:attribute name="cabecalho">
    </jsp:attribute>
    <jsp:attribute name="rodape">
        <script src="${ctx}/resources/plugins/dataTables/datatables.js"><c:out value=""/></script>
        <script src="${ctx}/resources/plugins/dataTables/Buttons-1.4.2/js/buttons.html5.js"><c:out value=""/></script>
        <script src="${ctx}/resources/js/servicos/lista.js"></script>
        <script src="${ctx}/resources/js//delegacias/delegacia.js"></script>
        <script src="${ctx}/resources/plugins/moment/date-time-moment.js"></script>
        <script src="${ctx}/resources/js/regional/form.js"></script>
        <script>
            $(document).ready(function () {

            });


        </script>
    </jsp:attribute>

    <jsp:body>
        <div class="panel painel-sisint">
            <div class="panel-heading">
                <h4 align="center">Detalhes de Manutenção</h4>
            </div>
            <div class="panel-body" style="padding-top: 0px;">
                <div class="row">
                    <div class="panel">
                        <div class="panel-body">
                            <div class="col-md-12">
                                <label for="regional-titulo">Nome do Solicitante: </label>
                                <span id="regional-titulo">${regional.nomeSolicitante}</span>
                                <br>
                                <label for="regional-setor">Setor do Solicitante: </label>
                                <span id="regional-setor">${regional.setor.nome}</span>
                                <br>                             
                                <label for="regional-tecnico">Criada Por: </label>
                                <span id="regional-tecnico">${regional.tecnicoCriou.nome}</span>
                                <br>
                                <label for="regional-tecnico">Técnico reponsável: </label>
                                <span id="regional-tecnico">${regional.tecnicoResponsavel.nome}</span>
                                <br>
                                <label for="regional-dataAbertura">Data de abertura: </label>
                                <span id="regional-dataAbertura">${regional.dataAbertura}</span>
                                <br>
                                <label for="regional-dataFechamento">Data de fechamento: </label>
                                <span id="regional-dataFechamento">${regional.dataFechamento}</span>
                                <br>
                                <label for="regional-descricao">Descrição da Manutenção: </label>
                                <span id="regional-descricao">${regional.descricao}</span>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
                <%--<c:if test="${not empty regional.delegacia}">--%>
                    <div class="row">
                        <div class="panel">
                            <div class="panel-body">
                                    <div class="caixa-pontilhada col-md-12" style="border: 1px solid #000341;
                                         margin-bottom: 16px;
                                         border-style: dashed;
                                         background-color: rgba(238,242,255,0.97)">
                                        <h4 id="tarefa-codigo" align="center">Nome do Equipamento: ${regional.delegacia.nome}</h4>
                                        <label for="delegacia-tombo">Tombo: </label>
                                        <span id="delegacia-tombo">${regional.delegacia.tombo}</span>
                                        <br>
                                        <label for="delegacia-nserie">Data de finalização: </label>
                                        <span id="delegacia-nserie">${regional.delegacia.numeroSerie}</span>
                                        <br>
                                        <label for="delegacia-setor">Setor do Equipamento: </label>
                                        <span id="delegacia-setor">${regional.delegacia.setor.nome}</span>
                                        <br>
                                        <label for="delegacia-status">Status do Equipamento: </label>
                                        <span id="delegacia-status" class="label status-equip">${regional.delegacia.status.chave}</span>
                                        <br>
                                        <label for="delegacia-descricao">Descrição: </label>
                                        <span id="delegacia-descricao">${regional.delegacia.descricao}</span>
                                        <br>
                                    </div>
                            </div>
                        </div>
                    </div>
                <%--</c:if>--%>
                <button href="" class="btn btn-default" onclick="history.back(1)">Voltar</button>
            </div>

            </div>
        </div>
    </jsp:body>
</tags:layout>
