
<%@ page import="alms.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-event" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list event">
			
				<g:if test="${eventInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="event.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${eventInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.start}">
				<li class="fieldcontain">
					<span id="start-label" class="property-label"><g:message code="event.start.label" default="Start" /></span>
					
						<span class="property-value" aria-labelledby="start-label"><g:formatDate date="${eventInstance?.start}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.end}">
				<li class="fieldcontain">
					<span id="end-label" class="property-label"><g:message code="event.end.label" default="End" /></span>
					
						<span class="property-value" aria-labelledby="end-label"><g:formatDate date="${eventInstance?.end}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.startTimezone}">
				<li class="fieldcontain">
					<span id="startTimezone-label" class="property-label"><g:message code="event.startTimezone.label" default="Start Timezone" /></span>
					
						<span class="property-value" aria-labelledby="startTimezone-label"><g:fieldValue bean="${eventInstance}" field="startTimezone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.endTimezone}">
				<li class="fieldcontain">
					<span id="endTimezone-label" class="property-label"><g:message code="event.endTimezone.label" default="End Timezone" /></span>
					
						<span class="property-value" aria-labelledby="endTimezone-label"><g:fieldValue bean="${eventInstance}" field="endTimezone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="event.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${eventInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.recurrenceID}">
				<li class="fieldcontain">
					<span id="recurrenceID-label" class="property-label"><g:message code="event.recurrenceID.label" default="Recurrence ID" /></span>
					
						<span class="property-value" aria-labelledby="recurrenceID-label"><g:fieldValue bean="${eventInstance}" field="recurrenceID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.recurrenceRule}">
				<li class="fieldcontain">
					<span id="recurrenceRule-label" class="property-label"><g:message code="event.recurrenceRule.label" default="Recurrence Rule" /></span>
					
						<span class="property-value" aria-labelledby="recurrenceRule-label"><g:fieldValue bean="${eventInstance}" field="recurrenceRule"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.recurrenceException}">
				<li class="fieldcontain">
					<span id="recurrenceException-label" class="property-label"><g:message code="event.recurrenceException.label" default="Recurrence Exception" /></span>
					
						<span class="property-value" aria-labelledby="recurrenceException-label"><g:fieldValue bean="${eventInstance}" field="recurrenceException"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.ownerID}">
				<li class="fieldcontain">
					<span id="ownerID-label" class="property-label"><g:message code="event.ownerID.label" default="Owner ID" /></span>
					
						<span class="property-value" aria-labelledby="ownerID-label"><g:fieldValue bean="${eventInstance}" field="ownerID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.isAllDay}">
				<li class="fieldcontain">
					<span id="isAllDay-label" class="property-label"><g:message code="event.isAllDay.label" default="Is All Day" /></span>
					
						<span class="property-value" aria-labelledby="isAllDay-label"><g:fieldValue bean="${eventInstance}" field="isAllDay"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${eventInstance?.id}" />
					<g:link class="edit" action="edit" id="${eventInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
