<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
	<title>Estagiários</title>
	<jsp:include page="../modulos/newheader-estrutura.jsp" />
</head>
<body>
	<c:if test="${not estagiarioCadastrado}">
		<jsp:include page="../modulos/header.jsp" />
	</c:if>

	<div class="container">
		<c:if test="${not empty info}">
			<div class="alert alert-info alert-dismissible margin-top" role="alert">
				<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<c:out value="${info}"></c:out>
			</div>
		</c:if>

		<c:if test="${estagiarioCadastrado}"><!-- Tela de Cadastro Dados Pessoais para Inicio no NPI -->
			<div class="temp">
				<jsp:include page="../estagiario/estagiario-dados-pessoais.jsp" />
			</div>
		</c:if><!-- Tela de Cadastro Dados Pessoais para Inicio no NPI -->


<%-- 		<c:if test="${estagiarioCadastrado}"><!-- Cadastro de Contas e Seleção de Turma NPI --> --%>
<!-- 			<div class="temp"> -->
<%-- 				<jsp:include page="../estagiario/estagiario-contas-turma.jsp" /> --%>
<!-- 			</div> -->
<%-- 		</c:if><!-- Cadastro de Contas e Seleção de Turma NPI --> --%>
		
	</div>

	<jsp:include page="../modulos/newfooter.jsp" />
</body>
</html>