<%--
  Created by IntelliJ IDEA.
  User: SINF
  Date: 30/01/2018
  Time: 15:33
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
        <script src="${ctx}/resources/js/table.js"></script>
        <script src="${ctx}/resources/js/init.js"></script>
    </jsp:attribute>

    <jsp:body>
        <div class="panel painel-sisint">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Gerenciamento de Delegacias</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <div class="panel-body">
                <form id="formTarefa" action="${linkTo[DelegaciaController].salvar}" enctype="multipart/form-data" method="post">
                    <input type="hidden" name="delegacia.id" value="${delegacia.id}">

                    <div class="row">
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

                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="nome-delegacia">Nome: </label>
                            <input id="nome-delegacia" class="form-control" minlength="4" name="delegacia.nome"
                                   type="text" required value="${delegacia.nome}">
                        </div>
                    </div>
                    <div class="panel">
                        <button class="btn btn-primary" type="submit">Salvar</button>
                        <br><br>
                    </div>
                </form>
            </div>

            <div class="panel-body" style="padding-top: 0px;">
                <%--<a class="btn btn-info" style="margin-bottom: 16px;" href="${linkTo[DelegaciaController].form}">Cadastrar</a>--%>
                <div class="tabela-delegacias">
                    <table id="tabela-servico" class="table table-bordered tabela">
                        <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Regional</th>
                            <th>Ações</th>
                            <%--<th>Detalhes</th>--%>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${delegacias}" var="delegacia">
                            <tr class="lista-delegacia">
                                <td>${delegacia.nome}</td>
                                <td>${delegacia.regional.nome}</td>
                                <td><a title="Editar" class="editar-equip" href="${linkTo[DelegaciaController].editar}?id=${delegacia.id}" alt="Editar">
                                    <i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a>
                                    <c:if test="${usuarioLogado.isAdmin()}">
                                        <a title="Remover" class="link-remover" href="#delete-modal" url-remover="${linkTo[DelegaciaController].remover}?id=${delegacia.id}"
                                           data-toggle="modal" alt="Remover">
                                            <i class="fa fa-trash fa-lg"></i></a>
                                    </c:if>
                                    <%--&lt;%&ndash;<a href="#"><i class="glyphicon glyphicon-file"></i></a>&ndash;%&gt;--%>
                                </td>
                                <%--<td><a href="#">Detalhar</a></td>--%>
                            </tr>
                        </c:forEach>

                        <!-- Modal REMOVER -->
                        <div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="modalLabel">Excluir Delegacia</h4>
                                    </div>
                                    <div class="modal-body">
                                        Deseja realmente excluir esta delegacia?
                                    </div>
                                    <div class="modal-footer">
                                        <a id="btn-remover" href="" class="btn btn-primary">Sim</a>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </jsp:body>
</tags:layout>>
