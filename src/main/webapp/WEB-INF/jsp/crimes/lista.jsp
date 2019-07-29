<%--
  Created by IntelliJ IDEA.
  User: SINF
  Date: 22/07/2019
  Time: 17:13
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
        <script src="${ctx}/resources/plugins/moment/date-time-moment.js"></script>
        <script src="${ctx}/resources/js/init.js"></script>
        <script>
            $(document).ready(function () {
                $.fn.dataTable.moment('DD/MM/YYYY');

                $('.table').DataTable( {
                    pageLength:25,
                    "language":
                        {
                            "sEmptyTable": "Nenhum registro encontrado",
                            "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                            "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
                            "sInfoFiltered": "(Filtrados de _MAX_ registros)",
                            "sInfoPostFix": "",
                            "sInfoThousands": ".",
                            "sLengthMenu": "_MENU_ resultados por página",
                            "sLoadingRecords": "Carregando...",
                            "sProcessing": "Processando...",
                            "sZeroRecords": "Nenhum registro encontrado",
                            "sSearch": "Pesquisar",
                            "oPaginate": {
                                "sNext": "Próximo",
                                "sPrevious": "Anterior",
                                "sFirst": "Primeiro",
                                "sLast": "Último"
                            },
                            "oAria": {
                                "sSortAscending": ": Ordenar colunas de forma ascendente",
                                "sSortDescending": ": Ordenar colunas de forma descendente"
                            }
                        }
                } );
            });


        </script>
    </jsp:attribute>

    <jsp:body>
        <div class="panel painel-sisint">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Crimes</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
                <%--<input id="urlAssumir" type="hidden" value="${linkTo[CrimesController].assumirManutencao}">--%>
                <%--<input id="urlConcluir" type="hidden" value="${linkTo[CrimesController].concluir}">--%>
            <div class="panel painel-sisint">
                <div class="panel-body">
                    <form id="formTarefa" action="${linkTo[CrimesController].salvar}" method="post">
                        <input type="hidden" name="crime.id" value="${crime.id}">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="nome-crime">Crime: </label>
                                <input id="nome-crime" class="form-control" minlength="3" name="crime.nome"
                                       type="text" required value="${crime.nome}">
                            </div>
                        </div>
                        <div>
                            <button class="btn btn-primary" type="submit">Salvar</button>
                        </div>
                    </form>
                </div>
            </div>
                <%--<a class="btn btn-info" style="margin-bottom: 16px;" href="${linkTo[CrimesController].form}">Cadastrar</a>--%>
            <div class="tabela-servicos">
                <table id="tabela-servico" class="table table-bordered tabela">
                    <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Ações</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${crimes}" var="crime">
                        <tr>
                            <td>${crime.nome}</td>
                            <td>
                                <%--<a title="Detalhes" href="${linkTo[CrimesController].detalhes}?id=${crime.id}"><i class="fa fa-eye fa-lg"></i></a>--%>
                                <c:if test="${usuarioLogado.usuario.tipoUsuario == 'ADMINISTRADOR'}">
                                    <a href="${linkTo[CrimesController].editar}?id=${crime.id}"
                                       title="Editar"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a>
                                    <a class="link-remover" href="#modalRemover" data-toggle="modal"
                                       url-remover="${linkTo[CrimesController].remover}?id=${crime.id}"
                                       title="Remover"><i class="fa fa-trash fa-lg"></i></a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
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
                        Deseja realmente excluir esta crime?
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


