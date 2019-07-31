<%--
  Created by IntelliJ IDEA.
  User: SINF
  Date: 22/07/2019
  Time: 17:14
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
                    <h1 class="page-header">Subcrimes</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
                <%--<input id="urlAssumir" type="hidden" value="${linkTo[SubcrimesController].assumirManutencao}">--%>
                <%--<input id="urlConcluir" type="hidden" value="${linkTo[SubcrimesController].concluir}">--%>
            <div class="panel painel-sisint">
                <div class="panel-body">
                    <form id="formTarefa" action="${linkTo[SubcrimesController].salvar}" enctype="multipart/form-data" method="post">
                        <input type="hidden" name="subcrime.id" value="${subcrime.id}">

                        <div class="row">
                            <div class="form-group col-md-4">
                                <label for="subcrime-crime">Crime: </label>
                                <select class="form-control" id="subcrime-crime" name="subcrime.crime.id" type="text">
                                    <option value=""></option>
                                    <c:forEach items="${crimes}" var="crime">
                                        <c:if test="${crime.valor == subcrime.crime.id}">
                                            <option value="${crime.valor}" selected="true">${crime.chave}</option>
                                        </c:if>
                                        <c:if test="${!(crime.valor == subcrime.crime.id)}">
                                            <option value="${crime.valor}">${crime.chave}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label for="nome-subcrime">Nome: </label>
                                <input id="nome-subcrime" class="form-control" minlength="4" name="subcrime.nome"
                                       type="text" required value="${subcrime.nome}">
                            </div>
                        </div>
                        <div class="panel">
                            <button class="btn btn-primary" type="submit">Salvar</button>
                        </div>
                    </form>
                </div>
            </div>
                <%--<a class="btn btn-info" style="margin-bottom: 16px;" href="${linkTo[SubcrimesController].form}">Cadastrar</a>--%>
            <div class="tabela-servicos">
                <table id="tabela-servico" class="table table-bordered tabela">
                    <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Crime</th>
                        <th>Ações</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${subcrimes}" var="subcrime">
                        <tr>
                            <td>${subcrime.nome}</td>
                            <td>${subcrime.crime.nome}</td>
                            <td>
                                <%--<a title="Detalhes" href="${linkTo[SubcrimesController].detalhes}?id=${subcrime.id}"><i class="fa fa-eye fa-lg"></i></a>--%>
                                <c:if test="${usuarioLogado.usuario.tipoUsuario == 'ADMINISTRADOR'}">
                                    <a href="${linkTo[SubcrimesController].editar}?id=${subcrime.id}"
                                       title="Editar"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a>
                                    <a class="link-remover" href="#modalRemover" data-toggle="modal"
                                       url-remover="${linkTo[SubcrimesController].remover}?id=${subcrime.id}"
                                       title="Remover"><i class="fa fa-trash fa-lg"></i></a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Modal REMOVER -->
        <div class="modal fade" id="modalRemover" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalLabel">Excluir Item</h4>
                    </div>
                    <div class="modal-body">
                        Deseja realmente excluir esta subcrimes?
                    </div>
                    <div class="modal-footer">
                        <a id="btn-remover" href="" class="btn btn-primary">Sim</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</tags:layout>


