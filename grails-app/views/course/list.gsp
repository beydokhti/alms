
<%@ page import="alms.Course" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-course" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-course" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="start" title="${message(code: 'course.start.label', default: 'Start')}" />
					
						<g:sortableColumn property="end" title="${message(code: 'course.end.label', default: 'End')}" />
					
						<g:sortableColumn property="startTimezone" title="${message(code: 'course.startTimezone.label', default: 'Start Timezone')}" />
					
						<g:sortableColumn property="endTimezone" title="${message(code: 'course.endTimezone.label', default: 'End Timezone')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'course.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="recurrenceID" title="${message(code: 'course.recurrenceID.label', default: 'Recurrence ID')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${courseInstanceList}" status="i" var="courseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${courseInstance.id}">${fieldValue(bean: courseInstance, field: "start")}</g:link></td>
					
						<td>${fieldValue(bean: courseInstance, field: "end")}</td>
					
						<td>${fieldValue(bean: courseInstance, field: "startTimezone")}</td>
					
						<td>${fieldValue(bean: courseInstance, field: "endTimezone")}</td>
					
						<td>${fieldValue(bean: courseInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: courseInstance, field: "recurrenceID")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${courseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
