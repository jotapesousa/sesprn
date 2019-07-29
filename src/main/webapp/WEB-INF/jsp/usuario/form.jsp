<%--
  Created by IntelliJ IDEA.
  User: SINF
  Date: 07/06/2019
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" uri="tagSesprn" %>
<%@ taglib prefix="td" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<tags:layout>
    <jsp:attribute name="cabecalho">
    </jsp:attribute>
    <jsp:attribute name="rodape">
        <script>
            $('#form-cadastro-usuario').validator();
        </script>
    </jsp:attribute>

    <jsp:body>
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header text-center">Cadastro de Usuários</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="panel col-md-4 col-md-offset-4">
            <div class="panel-body" style="padding-top: 0px;">
                <form id="form-cadastro-usuario" action="${linkTo[UsuarioController].salvar}" method="post">
                    <input type="hidden" name="usuario.id" value="${usuario.id}">
                    <input type="hidden" name="usuario.login" value="${usuario.login}">
                    <input type="hidden" name="usuario.tipousuario" value="${usuario.tipoUsuario}">
                    <input type="hidden" name="usuario.dataCadastro" value="${usuario.dataCadastro}">
                    <input type="hidden" name="usuario.delegacia.id" value="${usuario.delegacia.id}">
                    <div class="row">
                        <div class="form-group">
                            <label class="control-label" for="nome-usuario">Nome</label>
                            <input class="form-control" required minlength="3" id="nome-usuario" name="usuario.nome" type="text" value="${usuario.nome}">
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <label for="tipo-usuario">Tipo</label>
                            <select required class="form-control" id="tipo-usuario" name="usuario.tipoUsuario" type="text">
                                <option value=""></option>
                                <c:forEach items="${tipoUsuario}" var="tipo">
                                    <option value="${tipo.valor}">${tipo.chave}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="email-usuario">Email</label>
                            <input class="form-control" required id="email-usuario" name="usuario.email" type="email" value="${usuario.email}">
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <label for="delegacia-usuario">Delegacia </label>
                            <select class="form-control" required id="delegacia-usuario" name="usuario.delegacia.id">
                                <c:forEach items="${delegacias}" var="delegacia">
                                    <c:if test="${delegacia.valor == usuario.delegacia.id}">
                                        <option value="${delegacia.valor}" selected="true">${delegacia.chave}</option>
                                    </c:if>
                                    <c:if test="${!(delegacia.valor == usuario.delegacia.id)}">
                                        <option value="${delegacia.valor}">${delegacia.chave}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group text-center">
                            <button align="center" class="btn btn-primary btn-lg" type="submit">Cadastrar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</tags:layout>
