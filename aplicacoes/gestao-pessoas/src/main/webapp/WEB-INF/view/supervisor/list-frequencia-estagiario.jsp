<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="nome" value="${sessionScope.usuario.nome}"/>
<c:set var="nomeFormatado" value="${fn:substring(nome, 0, fn:indexOf(nome, ' '))}" />

<html>
	<head>
		<jsp:include page="../modulos/header-estrutura.jsp" />
		<title>Frequencia Estagiario</title>
	</head>
<body>
	<jsp:include page="../modulos/header.jsp" />

<div class="container">
	<div class="row">

	<div class="panel panel-primary">
	
	
		<div class="panel-heading">
			<h2 class="titulo-panels"><span class="fa fa-calendar"></span> Frequência: ${estagiario.nomeCompleto}</h2>
			
			<div class="pull-right">
				<a title="Voltar" class="btn btn-primary back"><span class="fa fa-arrow-circle-o-left"></span> Voltar</a>
			</div>
		</div>
	
		<div class="panel-body">
	
			<div class="form-group">
				<label class="col-sm-2 text-view-info"><strong>Turma: </strong></label><label class="col-sm-2 text-view-info">${turma.nome}</label>

				<label class="col-sm-2 text-view-info"><strong>Periodo: </strong></label><label class="col-sm-3 text-view-info">de <fmt:formatDate value="${turma.inicio}" pattern="dd/MM/yyyy" /> a <fmt:formatDate value="${turma.termino}" pattern="dd/MM/yyyy" /></label>

				<label class="col-sm-3"></label>
			</div><br>
	
			<div class="form-group">
				<label class="col-sm-2 text-view-info"><strong>Dias Trabalhados: </strong></label><label class="col-sm-2 text-view-info">${dadosConsolidados.diasTrabalhados}</label>
		
				<label class="col-sm-2 text-view-info"><strong>Frequência (%): </strong></label><label class="col-sm-2 text-view-info">${dadosConsolidados.porcentagemFrequencia}</label>
		
				<label class="col-sm-2 text-view-info"><strong>Faltas: </strong></label><label class="col-sm-2 text-view-info">${dadosConsolidados.faltas}</label>
			</div><br><br>
	
			<c:if test="${not empty message}"><div class="alert alert-info msg"><i class="fa fa-info-circle"> </i> ${message}</div></c:if>

			<table id="table-frequencias" class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Data</th>
						<th>Observação</th>
						<th>Status</th>
					</tr>
		       </thead>
		       <tbody class="text-view-info">
					<c:forEach var="frequencia" items="${frequencias}">
				        <c:choose>
				            <c:when test="${frequencia.statusFrequencia != 'AGUARDO'}">
				            	<tr class="success">
									<td><strong><fmt:formatDate value="${frequencia.data}" pattern="E" />, <fmt:formatDate value="${frequencia.data}" pattern="dd/MM/yyyy" /></strong></td>
									<td><a href="#" class="observacaoFrequencia" title="Realizar observação" data-pk="${frequencia.id}">${frequencia.observacao}</a></td>
									<td><a href="#" class="statusFrequencia" title="Atualizar status" data-pk="${frequencia.id}">${frequencia.statusFrequencia}</a></td>
								</tr>
				            </c:when>
				            <c:otherwise>
					            <tr class="warning">
									<td><strong><fmt:formatDate value="${frequencia.data}" pattern="E" />, <fmt:formatDate value="${frequencia.data}" pattern="dd/MM/yyyy" /></strong></td>
									<td colspan="2">Aguardando data para lançamento da frequência.</td>
								</tr>
				            </c:otherwise>
				        </c:choose>
					</c:forEach>
		       </tbody>
			</table>
		</div>
	</div>
	</div>
</div><br><br>

	<jsp:include page="../modulos/footer.jsp" />

	<script type="text/javascript">
		$(".menu #turmas").addClass("active");
	</script>

</body>