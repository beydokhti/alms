
<%@ page import="alms.RegisteredTerm" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registeredTerm.label', default: 'RegisteredTerm')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-registeredTerm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-registeredTerm" class="content scaffold-show" role="main">
			<legend><g:message  code="default.show.label" args="[entityName]"/></legend>
			<g:if test="${flash.message}">
			<div class="alert alert-danger" role="alert">${flash.message}</div>
			</g:if>
			<ol class="property-list registeredTerm">
			
				<g:if test="${registeredTermInstance?.term}">
				<li class="fieldcontain">
					<span id="term-label" class="property-label"><g:message code="registeredTerm.term.label" default="Term" /></span>
					
						<span class="property-value" aria-labelledby="term-label"><g:link controller="term" action="show" id="${registeredTermInstance?.term?.id}">${registeredTermInstance?.term?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${registeredTermInstance?.mark}">
				<li class="fieldcontain">
					<span id="mark-label" class="property-label"><g:message code="registeredTerm.mark.label" default="Mark" /></span>
					
						<span class="property-value" aria-labelledby="mark-label"><g:fieldValue bean="${registeredTermInstance}" field="mark"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${registeredTermInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="registeredTerm.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${registeredTermInstance?.person?.id}">${registeredTermInstance?.person?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${registeredTermInstance?.id}" />
					<g:link class="btn btn-default" action="edit" id="${registeredTermInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
