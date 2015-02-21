
<%@ page import="alms.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#list-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		%{--<div class="nav" role="navigation">--}%
			%{--<ul>--}%
				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			%{--</ul>--}%
		%{--</div>--}%
		<div id="list-person" class="content scaffold-list" role="main">
			<h1><g:message code="person.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'person.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'person.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="sex" title="${message(code: 'person.sex.label', default: 'Sex')}" />
					
						<g:sortableColumn property="degree" title="${message(code: 'person.degree.label', default: 'Degree')}" />
					
						<g:sortableColumn property="field" title="${message(code: 'person.field.label', default: 'Field')}" />
					
						<g:sortableColumn property="dataOfBirth" title="${message(code: 'person.dataOfBirth.label', default: 'Data Of Birth')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personInstanceList}" status="i" var="personInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: personInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "sex")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "degree")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "field")}</td>
					
						<td><g:formatDate date="${personInstance.dataOfBirth}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personInstanceTotal}" />
			</div>
            <g:link class="btn btn-primary active" action="create"><g:message code="person.create.label" args="[entityName]" /></g:link>
		</div>
	</body>
</html>
