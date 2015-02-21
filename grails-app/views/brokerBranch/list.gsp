
<%@ page import="alms.BrokerBranch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'brokerBranch.label', default: 'BrokerBranch')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-brokerBranch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-brokerBranch" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="brokerBranch.city.label" default="City" /></th>
					
						<g:sortableColumn property="branchType" title="${message(code: 'brokerBranch.branchType.label', default: 'Branch Type')}" />
					
						<g:sortableColumn property="representativePerson" title="${message(code: 'brokerBranch.representativePerson.label', default: 'Representative Person')}" />
					
						<g:sortableColumn property="personnelCount" title="${message(code: 'brokerBranch.personnelCount.label', default: 'Personnel Count')}" />
					
						<g:sortableColumn property="tseStock" title="${message(code: 'brokerBranch.tseStock.label', default: 'Tse Stock')}" />
					
						<g:sortableColumn property="imeStock" title="${message(code: 'brokerBranch.imeStock.label', default: 'Ime Stock')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${brokerBranchInstanceList}" status="i" var="brokerBranchInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${brokerBranchInstance.id}">${fieldValue(bean: brokerBranchInstance, field: "city")}</g:link></td>
					
						<td>${fieldValue(bean: brokerBranchInstance, field: "branchType")}</td>
					
						<td>${fieldValue(bean: brokerBranchInstance, field: "representativePerson")}</td>
					
						<td>${fieldValue(bean: brokerBranchInstance, field: "personnelCount")}</td>
					
						<td><g:formatBoolean boolean="${brokerBranchInstance.tseStock}" /></td>
					
						<td><g:formatBoolean boolean="${brokerBranchInstance.imeStock}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${brokerBranchInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
