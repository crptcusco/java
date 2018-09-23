<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table class="table" data-planpm_id="${planPM.id}">
	<tr>
	<td>Equipo:</td><td>${planPM.planEquipo.manttoEquipo.equipo.equipo}</td>
	</tr>
	<tr>
	<td>Fecha Est.:</td>
	<td>
		<div class="box-tools pull-left">
			<input data-fnc="fe" type="text" size="10" readonly="readonly" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${planPM.fechaEstimada}" />" />
			<button type="button" class="btn box-tool" data-movday="-1">
				<i class="fa fa-arrow-circle-o-left"></i>
			</button>
			<button type="button" class="btn box-tool" data-movday="1">
				<i class="fa fa-arrow-circle-o-right"></i>
			</button>
		</div>		
	</td>
	</tr>
	<tr>
	<td>Fecha Ideal.:</td><td><fmt:formatDate pattern="yyyy-MM-dd" value="${planPM.fechaIdeal}" /></td>
	</tr>
	<tr>
	<td>Horom. Est.:</td><td><fmt:formatNumber type="number" maxFractionDigits="2" value="${planPM.horometroEstimado}"/></td>
	</tr>
	<tr>
	<td>Horom. Ideal.:</td><td><fmt:formatNumber type="number" maxFractionDigits="2" value="${planPM.horometroIdeal}"/></td>
	</tr>
	<tr>
	<td>Disp.:</td><td data-disp="0"></td>
	</tr>
</table>
<%@include file="popoverPlanAdd.jsp" %>