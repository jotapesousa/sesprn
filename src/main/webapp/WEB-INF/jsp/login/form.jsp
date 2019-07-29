<%--
  Created by IntelliJ IDEA.
  User: SINF
  Date: 06/06/2019
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" uri="tagSesprn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="${ctx}/resources/css/form-signin.css" rel="stylesheet" />
    <title>Sistema Estatístico de Segurança Pública do RN</title>
</head>
<body style="background-color: #3498db;">
    <div class="container">
        <c:set var="ctx" value="${pageContext.request.contextPath}"/>
        <div class="panel-body">
            <div class="form-signin" style="padding-bottom: 50px; border-radius: 10px;">
                <div class="panel-heading" align="center" style="height: 30%;">
                    <%--<img src="${ctx}/resources/imagens/logo-transp.png" style="width: 100%;"/>--%>
                </div>
                <form method="post" action="${linkTo[LoginController].login}">
                    <input id="login-usuario" type="text" class="form-control" name="usuario.login" placeholder="Login" autofocus>
                    <input id="senha-usuario" type="password" class="form-control" name="usuario.senha" placeholder="Senha">
                    <jsp:include page="/WEB-INF/jsp/erros/msgError.jsp"/>
                    <button class="btn btn-primary btn-lg btn-block">Entrar</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        $('.alert').fadeOut(3000);
    </script>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>

