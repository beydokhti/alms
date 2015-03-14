
<%@ page import="alms.Exam" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'exam.label', default: 'Exam')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-exam" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-exam" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-danger" role="alert">${flash.message}</div>
			</g:if>
			<ol class="property-list exam">
			
				<g:if test="${examInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="exam.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${examInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				%{--<g:if test="${examInstance?.examDate}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="examDate-label" class="property-label"><g:message code="exam.examDate.label" default="Exam Date" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="examDate-label"><g:formatDate date="${examInstance?.examDate}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			%{----}%
				<g:if test="${examInstance?.event}">
				<li class="fieldcontain">
					<span id="event-label" class="property-label"><g:message code="exam.event.label" default="Event" /></span>
					
						<span class="property-value" aria-labelledby="event-label"><g:link controller="event" action="show" id="${examInstance?.event?.id}">${examInstance?.event?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${examInstance?.examEndTime}">
				<li class="fieldcontain">
					<span id="examEndTime-label" class="property-label"><g:message code="exam.examEndTime.label" default="Exam End Time" /></span>
					
						<span class="property-value" aria-labelledby="examEndTime-label"><g:formatDate date="${examInstance?.examEndTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${examInstance?.examStartTime}">
				<li class="fieldcontain">
					<span id="examStartTime-label" class="property-label"><g:message code="exam.examStartTime.label" default="Exam Start Time" /></span>
					
						<span class="property-value" aria-labelledby="examStartTime-label"><g:formatDate date="${examInstance?.examStartTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${examInstance?.event}">
				<li class="fieldcontain">
					<span id="exams-label" class="property-label"><g:message code="exam.event.label" default="Exams" /></span>
					
						<span class="property-value" aria-labelledby="exams-label"><g:link controller="event" action="show" id="${examInstance?.event?.id}">${examInstance?.event?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${examInstance?.venue}">
				<li class="fieldcontain">
					<span id="venue-label" class="property-label"><g:message code="exam.venue.label" default="Venue" /></span>
					
						<span class="property-value" aria-labelledby="venue-label"><g:fieldValue bean="${examInstance}" field="venue"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${examInstance?.id}" />
					<g:link class="btn btn-default" action="edit" id="${examInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
