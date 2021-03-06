<%--
  Created by IntelliJ IDEA.
  User: SINF
  Date: 07/06/2019
  Time: 13:18
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

    </jsp:attribute>

    <jsp:attribute name="rodape">
        <%--<script src="${ctx}/resources/js/dashboard/dashboard.js"></script>--%>
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Informações de Crimes</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-list-alt fa-5x"></i>
                            </div>
                            <%--<div class="col-xs-9 text-right">--%>
                                <%--<div class="huge">${servicosAbertos}</div>--%>
                                <%--<div>Serviços em Aberto</div>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                    <a href="${linkTo[IndexController].index}">
                        <div class="panel-footer">
                            <span class="pull-left">Ver Serviços</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-file-text fa-5x"></i>
                            </div>
                            <%--<div class="col-xs-9 text-right">--%>
                                <%--<div class="huge">${meusServicos}</div>--%>
                                <%--<div>Meus Serviços</div>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                    <%--<a href="${linkTo[ServicosController].meusServicos}">--%>
                        <%--<div class="panel-footer">--%>
                            <%--<span class="pull-left">Ver Meus Serviços</span>--%>
                            <%--<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>--%>
                            <%--<div class="clearfix"></div>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-tasks fa-5x"></i>
                            </div>
                            <%--<div class="col-xs-9 text-right">--%>
                                <%--<div class="huge">${tarefasPendentes}</div>--%>
                                <%--<div>Minhas Tarefas</div>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                    <%--<a href="${linkTo[TarefasController].minhasTarefas}">--%>
                        <%--<div class="panel-footer">--%>
                            <%--<span class="pull-left">Ver Pendentes</span>--%>
                            <%--<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>--%>
                            <%--<div class="clearfix"></div>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-laptop fa-5x"></i>
                            </div>
                            <%--<div class="col-xs-9 text-right">--%>
                                <%--<div class="huge">${manutencoesAbertas}</div>--%>
                                <%--<div>Manutenções em Aberto</div>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                    <%--<a href="${linkTo[ManutencaoController].lista}">--%>
                        <%--<div class="panel-footer">--%>
                            <%--<span class="pull-left">Ver Manutenções</span>--%>
                            <%--<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>--%>
                            <%--<div class="clearfix"></div>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                </div>
            </div>
        </div>
        <!-- /.row -->
        <%--<div class="row">--%>

        <%--<div class="col-lg-8">--%>
        <%--<div class="panel panel-default">--%>
        <%--<div class="panel-heading">--%>
        <%--<i class="fa fa-bar-chart-o fa-fw"></i> Gráfico de Chamados--%>
        <%--</div>--%>
        <%--<!-- /.panel-heading -->--%>
        <%--<div class="panel-body">--%>
        <%--<!-- <div id="morris-area-chart"></div> -->--%>
        <%--<div class="flot-chart">--%>
        <%--<div class="flot-chart-content" id="flot-line-chart"></div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<!-- /.panel-body -->--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<!-- /.col-lg-8 -->--%>
        <%--<div class="col-lg-4">--%>
        <%--<div class="panel panel-default">--%>
        <%--<div class="panel-heading">--%>
        <%--<i class="fa fa-bell fa-fw"></i> Últimos Serviços--%>
        <%--</div>--%>
        <%--<!-- /.panel-heading -->--%>
        <%--<div class="panel-body">--%>
        <%--<div class="list-group">--%>
        <%--<a href="#" class="list-group-item">--%>
        <%--<i class="fa fa-comment fa-fw"></i> New Comment--%>
        <%--<span class="pull-right text-muted small"><em>4 minutes ago</em>--%>
        <%--</span>--%>
        <%--</a>--%>
        <%--<a href="#" class="list-group-item">--%>
        <%--<i class="fa fa-twitter fa-fw"></i> 3 New Followers--%>
        <%--<span class="pull-right text-muted small"><em>12 minutes ago</em>--%>
        <%--</span>--%>
        <%--</a>--%>
        <%--<a href="#" class="list-group-item">--%>
        <%--<i class="fa fa-envelope fa-fw"></i> Message Sent--%>
        <%--<span class="pull-right text-muted small"><em>27 minutes ago</em>--%>
        <%--</span>--%>
        <%--</a>--%>
        <%--<a href="#" class="list-group-item">--%>
        <%--<i class="fa fa-tasks fa-fw"></i> New Task--%>
        <%--<span class="pull-right text-muted small"><em>43 minutes ago</em>--%>
        <%--</span>--%>
        <%--</a>--%>
        <%--<a href="#" class="list-group-item">--%>
        <%--<i class="fa fa-upload fa-fw"></i> Server Rebooted--%>
        <%--<span class="pull-right text-muted small"><em>11:32 AM</em>--%>
        <%--</span>--%>
        <%--</a>--%>
        <%--<a href="#" class="list-group-item">--%>
        <%--<i class="fa fa-bolt fa-fw"></i> Server Crashed!--%>
        <%--<span class="pull-right text-muted small"><em>11:13 AM</em>--%>
        <%--</span>--%>
        <%--</a>--%>
        <%--<a href="#" class="list-group-item">--%>
        <%--<i class="fa fa-warning fa-fw"></i> Server Not Responding--%>
        <%--<span class="pull-right text-muted small"><em>10:57 AM</em>--%>
        <%--</span>--%>
        <%--</a>--%>
        <%--<a href="#" class="list-group-item">--%>
        <%--<i class="fa fa-shopping-cart fa-fw"></i> New Order Placed--%>
        <%--<span class="pull-right text-muted small"><em>9:49 AM</em>--%>
        <%--</span>--%>
        <%--</a>--%>
        <%--<a href="#" class="list-group-item">--%>
        <%--<i class="fa fa-money fa-fw"></i> Payment Received--%>
        <%--<span class="pull-right text-muted small"><em>Yesterday</em>--%>
        <%--</span>--%>
        <%--</a>--%>
        <%--</div>--%>
        <%--<!-- /.list-group -->--%>
        <%--<a href="#" class="btn btn-default btn-block">View All Alerts</a>--%>
        <%--</div>--%>
        <%--<!-- /.panel-body -->--%>
        <%--</div>--%>
        <%--<!-- /.panel -->--%>
        <%--</div>--%>
        <%--</div>--%>
        <!-- /.row -->
    </jsp:body>
</tags:layout>
