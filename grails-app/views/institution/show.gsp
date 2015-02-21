
<%@ page import="alms.Institution" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'institution.label', default: 'Institution')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-institution" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-institution" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list institution">
			
				<g:if test="${institutionInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="institution.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${institutionInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.nationalCode}">
				<li class="fieldcontain">
					<span id="nationalCode-label" class="property-label"><g:message code="institution.nationalCode.label" default="National Code" /></span>
					
						<span class="property-value" aria-labelledby="nationalCode-label"><g:fieldValue bean="${institutionInstance}" field="nationalCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.registerNumber}">
				<li class="fieldcontain">
					<span id="registerNumber-label" class="property-label"><g:message code="institution.registerNumber.label" default="Register Number" /></span>
					
						<span class="property-value" aria-labelledby="registerNumber-label"><g:fieldValue bean="${institutionInstance}" field="registerNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="institution.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${institutionInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="institution.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${institutionInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.fax}">
				<li class="fieldcontain">
					<span id="fax-label" class="property-label"><g:message code="institution.fax.label" default="Fax" /></span>
					
						<span class="property-value" aria-labelledby="fax-label"><g:fieldValue bean="${institutionInstance}" field="fax"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="institution.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${institutionInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="institution.person.label" default="Person" /></span>
					
						<g:each in="${institutionInstance.person}" var="p">
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${institutionInstance?.id}" />
					<g:link class="edit" action="edit" id="${institutionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
