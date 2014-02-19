<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/folha_estilo.css"></link>
<title>Login</title>
</head>
<body class="pagina">

	<div class="pagina_login" >
		<img src="imagens/ifpi_logo.png" > 

		<form align="center" action="<c:url value='/auth/login' />" method="POST"">
		
			<br>
			<label for="login">Login</label><br>
			<input id="login" type="text" name="usuario.login" value="${usuario.login}" class="input-large" placeholder="Login" autofocus="autofocus" required /><br>
			
			<label for="senha">Senha</label><br>
			<input id="senha" type="password" name="usuario.senha" value="${usuario.senha}" class="input-large" placeholder="Senha" required /><br><br>
			
			<input class="btn_" type="submit" value="Entrar"/>
			<input class="btn_" type="reset" value="Limpar"/>
			<br>
		
		</form>
		
	</div>

</body>
</html>