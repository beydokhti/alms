
<%@ page import="alms.RegisteredEvent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registeredEvent.label', default: 'RegisteredEvent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-registeredEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-registeredEvent" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-danger" role="alert">${flash.message}</div>
			</g:if>
			<ol class="property-list registeredEvent">
			
				<g:if test="${registeredEventInstance?.event}">
				<li class="fieldcontain">
					<span id="event-label" class="property-label"><g:message code="registeredEvent.event.label" default="Event" /></span>
					
						<span class="property-value" aria-labelledby="event-label"><g:link controller="event" action="show" id="${registeredEventInstance?.event?.id}">${registeredEventInstance?.event?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${registeredEventInstance?.mark}">
				<li class="fieldcontain">
					<span id="mark-label" class="property-label"><g:message code="registeredEvent.mark.label" default="Mark" /></span>
					
						<span class="property-value" aria-labelledby="mark-label"><g:fieldValue bean="${registeredEventInstance}" field="mark"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${registeredEventInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="registeredEvent.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${registeredEventInstance?.person?.id}">${registeredEventInstance?.person?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${registeredEventInstance?.id}" />
					<g:link class="btn btn-default" action="edit" id="${registeredEventInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
