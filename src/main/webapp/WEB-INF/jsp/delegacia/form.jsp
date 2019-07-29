<%--
  Created by IntelliJ IDEA.
  User: samue
  Date: 08/09/2017
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" uri="tagSesprn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<tags:layout>
    <jsp:attribute name="cabecalho">
        <link href="${ctx}/resources/css/componentes/checkbox.css" rel="stylesheet"/>
    </jsp:attribute>
    <jsp:attribute name="rodape">
        <script src="${ctx}/resources/plugins/typeahead/typeahead.bundle.js"></script>

        <!-- Gerador de Código -->
        <script>
            $('#btn-gerarns').click(function() {
                var ns = 'PC' + moment().year() + moment().unix() + 'RN';

                $('#ns-delegacia').val(ns);
            })
        </script>
    </jsp:attribute>

    <jsp:body>
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Cadastro de Delegacias</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="panel painel-sisint">
            <div class="panel-body">
                <form id="formTarefa" action="${linkTo[DelegaciaController].salvar}" enctype="multipart/form-data" method="post">
                    <input type="hidden" name="delegacia.id" value="${delegacia.id}">

                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="nome-delegacia">Nome: </label>
                            <input id="nome-delegacia" class="form-control" minlength="4" name="delegacia.nome"
                                   type="text" required value="${delegacia.nome}">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="delegacia-regional">Regional: </label>
                            <select class="form-control" id="delegacia-regional" name="delegacia.regional.id" type="text">
                                <option value=""></option>
                                <c:forEach items="${regionais}" var="regional">
                                    <c:if test="${regional.valor == delegacia.regional.id}">
                                        <option value="${regional.valor}" selected="true">${regional.chave}</option>
                                    </c:if>
                                    <c:if test="${!(regional.valor == delegacia.regional.id)}">
                                        <option value="${regional.valor}">${regional.chave}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="panel">
                        <button class="btn btn-primary" type="submit">Salvar</button>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</tags:layout>
