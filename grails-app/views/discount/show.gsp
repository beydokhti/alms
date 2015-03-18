
<%@ page import="alms.Discount" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'discount.label', default: 'Discount')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-discount" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-discount" class="content scaffold-show" role="main">
			<legend><g:message code="default.show.label" args="[entityName]" /></legend>
			<g:if test="${flash.message}">
			<div class="alert alert-danger" role="alert">${flash.message}</div>
			</g:if>
			<ol class="property-list discount">
			
				<g:if test="${discountInstance?.personGroup}">
				<li class="fieldcontain">
					<span id="personGroup-label" class="property-label"><g:message code="discount.personGroup.label" default="Person Type" /></span>
					
						<span class="property-value" aria-labelledby="personGroup-label"><g:fieldValue bean="${discountInstance}" field="personGroup"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${discountInstance?.discountPercentage}">
				<li class="fieldcontain">
					<span id="discountPercentage-label" class="property-label"><g:message code="discount.discountPercentage.label" default="Discount Percentage" /></span>
					
						<span class="property-value" aria-labelledby="discountPercentage-label"><g:fieldValue bean="${discountInstance}" field="discountPercentage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${discountInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="discount.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${discountInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${discountInstance?.event}">
				<li class="fieldcontain">
					<span id="event-label" class="property-label"><g:message code="discount.event.label" default="Event" /></span>
					
						<span class="property-value" aria-labelledby="event-label"><g:link controller="event" action="show" id="${discountInstance?.event?.id}">${discountInstance?.event?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${discountInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="discount.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${discountInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${discountInstance?.id}" />
					<g:link class="btn btn-default" action="edit" id="${discountInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
