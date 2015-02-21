
<%@ page import="alms.Broker" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-broker" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-broker" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="brokerPersianName" title="${message(code: 'broker.brokerPersianName.label', default: 'Broker Persian Name')}" />
					
						<g:sortableColumn property="brokerLatinName" title="${message(code: 'broker.brokerLatinName.label', default: 'Broker Latin Name')}" />
					
						<g:sortableColumn property="registerDate" title="${message(code: 'broker.registerDate.label', default: 'Register Date')}" />
					
						<g:sortableColumn property="registerNo" title="${message(code: 'broker.registerNo.label', default: 'Register No')}" />
					
						<g:sortableColumn property="registerLocation" title="${message(code: 'broker.registerLocation.label', default: 'Register Location')}" />
					
						<g:sortableColumn property="seoRegisterDate" title="${message(code: 'broker.seoRegisterDate.label', default: 'Seo Register Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${brokerInstanceList}" status="i" var="brokerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${brokerInstance.id}">${fieldValue(bean: brokerInstance, field: "brokerPersianName")}</g:link></td>
					
						<td>${fieldValue(bean: brokerInstance, field: "brokerLatinName")}</td>
					
						<td><g:formatDate date="${brokerInstance.registerDate}" /></td>
					
						<td>${fieldValue(bean: brokerInstance, field: "registerNo")}</td>
					
						<td>${fieldValue(bean: brokerInstance, field: "registerLocation")}</td>
					
						<td><g:formatDate date="${brokerInstance.seoRegisterDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${brokerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
