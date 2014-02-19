<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/folha_estilo.css"></link>
<title>Sisbolsa</title>
</head>
<body>
	
	<div class="topo"><img src="imagens/ifpi_logo.png" align="left" height="100%"><br>
		<h2 align="right">Ola Administrador</h2>
	</div>
	<div class="menu_lateral" align="center"><br>
		
		<a href="pagina_administrador_usuario.html" ><button class="btn"> usuario</button></a><br><br>	
		<a href="pagina_administrador_bolsa.html" ><button class="btn"> Bolsa</button></a><br><br>	
		<a href="pagina_administrador_pagamento.html" ><button class="btn"> Pagamento</button></a><br><br>	
		<a href="pagina_administrador_selecao.html" ><button class="btn"> Selecao</button></a><br><br>
		<a href="<c:url value='/auth/logout'/>" ><button class="btn_sair"> Sair</button></a><br><br>	
		
	</div>
	<div class="conteudo"></div>
		
</body>
</html>