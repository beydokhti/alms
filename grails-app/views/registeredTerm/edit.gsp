<%@ page import="alms.RegisteredTerm" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registeredTerm.label', default: 'RegisteredTerm')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>

		</div>
		<div id="edit-registeredTerm" class="content scaffold-edit" role="main">
			<legend><g:message code="default.edit.label" args="[entityName]" /></legend>
			<g:if test="${flash.message}">
			<div class="alert alert-danger" role="alert">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${registeredTermInstance}">
			<ul class="alert alert-danger"role="alert">
				<g:eachError bean="${registeredTermInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" name="mainForm">
				<g:hiddenField name="id" value="${registeredTermInstance?.id}" />
				<g:hiddenField name="version" value="${registeredTermInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-default" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
