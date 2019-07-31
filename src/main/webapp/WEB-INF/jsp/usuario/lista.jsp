<%--
  Created by IntelliJ IDEA.
  User: SINF
  Date: 14/06/2019
  Time: 16:23
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
        <script src="${ctx}/resources/js/usuario.js"></script>
        <script src="${ctx}/resources/js/table.js"></script>
    </jsp:attribute>

    <jsp:body>
        <div class="panel painel-sisint">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Gerenciamento de Usuários</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="panel-body" style="padding-top: 0px;">
                <a class="btn btn-info" style="margin-bottom: 16px;" href="${linkTo[UsuarioController].form}">Cadastrar</a>
                <div class="tabela-servicos">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Delegacia</th>
                            <th>Login</th>
                            <th>Tipo</th>
                            <th>Permissão</th>
                            <th>Ações</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${usuarios}" var="usuario">
                            <tr>
                                <td>${usuario.nome}</td>
                                <td>${usuario.delegacia.nome}</td>
                                <td>${usuario.login}</td>
                                <td>${usuario.tipoUsuario.chave}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${usuario.permitido}">PERMITITDO</c:when>
                                        <c:otherwise>NÃO PERMITIDO</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a title="Editar" href="${linkTo[UsuarioController].editar}?id=${usuario.id}">
                                        <i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a>
                                    <c:if test="${usuarioLogado.isAdmin()}">
                                        <a title="Remover" class="link-remover" href="#delete-modal"
                                           url-remover="${linkTo[UsuarioController].remover}?id=${usuario.id}" data-toggle="modal">
                                            <i class="fa fa-trash fa-lg"></i></a>
                                    </c:if>
                                    <c:choose>
                                        <c:when test="${!usuario.permitido}">
                                            <a title="Permitir" class="link-permitir" href="#permitir-modal"
                                               id-permitir="${usuario.id}" url-permitir="${linkTo[UsuarioController].permitir}" data-toggle="modal">
                                                <i class="fa fa-check fa-lg" aria-hidden="true"></i></a>
                                        </c:when>
                                        <c:otherwise>
                                            <a title="Desativar" class="link-desativar" href="#desativar-modal"
                                               id-desativar="${usuario.id}" url-desativar="${linkTo[UsuarioController].desativar}?id=${usuario.id}" data-toggle="modal">
                                                <i class="fa fa-times fa-lg" aria-hidden="true"></i></a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>

                        <!-- Modal PERMITIR -->
                        <div class="modal fade" id="permitir-modal" tabindex="-1" role="dialog" aria-labelledby="modalLabelPermitir">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
                                        <h3 class="modal-title text-center">Permissão de Usuário</h3>
                                    </div>
                                        <input id="inputPermitir" type="hidden" name="usuario.id" value="" />
                                        <div class="modal-body">
                                            <br><br>
                                            <label for="delegacia-usuario">Informe a Delegacia do Usuário </label>
                                            <select class="form-control input-lg" required id="delegacia-usuario" name="usuario.delegacia.id">
                                                <option value=""></option>
                                                <c:forEach items="${delegacias}" var="delegacia">
                                                    <c:if test="${delegacia.valor == usuario.delegacia.id}">
                                                        <option value="${delegacia.valor}" selected="true">${delegacia.chave}</option>
                                                    </c:if>
                                                    <c:if test="${!(delegacia.valor == usuario.delegacia.id)}">
                                                        <option value="${delegacia.valor}">${delegacia.chave}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <br><br>
                                        </div>
                                        <div class="modal-footer">
                                            <a id="btn-permitir" href="" class="btn btn-primary">Sim</a>
                                            <button class="btn btn-default" data-dismiss="modal">N&atilde;o</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- Modal DESATIVAR -->
                        <div class="modal fade" id="desativar-modal" tabindex="-1" role="dialog" aria-labelledby="modalLabelDesativar">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="modalLabelDesativar">Desativar Usuário</h4>
                                    </div>
                                    <div class="modal-body">
                                        Deseja realmente desativar esse usuário do sistema?
                                    </div>
                                    <div class="modal-footer">
                                        <a id="btn-desativar" href="" class="btn btn-primary">Sim</a>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal REMOVER -->
                        <div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="modalLabelRemover">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="modalLabelRemover">Excluir Item</h4>
                                    </div>
                                    <div class="modal-body">
                                        Deseja realmente excluir este item?
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
</tags:layout>