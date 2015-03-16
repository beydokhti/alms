
<%@ page import="alms.Term" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'term.label', default: 'Term')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-term" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-term" class="content scaffold-show" role="main">
			<legend><g:message  code="default.show.label" args="[entityName]"/></legend>
			<g:if test="${flash.message}">
			<div class="alert alert-danger" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list term">
			
				<g:if test="${termInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="term.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${termInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${termInstance?.curriculum}">
				<li class="fieldcontain">
					<span id="curriculum-label" class="property-label"><g:message code="term.curriculum.label" default="Curriculum" /></span>
					
						<span class="property-value" aria-labelledby="curriculum-label"><g:link controller="curriculum" action="show" id="${termInstance?.curriculum?.id}">${termInstance?.curriculum?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${termInstance?.events}">
				<li class="fieldcontain">
					<span id="events-label" class="property-label"><g:message code="term.events.label" default="Events" /></span>
					
						<g:each in="${termInstance.events}" var="e">
						<span class="property-value" aria-labelledby="events-label"><g:link controller="event" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${termInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="term.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${termInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${termInstance?.id}" />
					<g:link class="edit" action="edit" id="${termInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
