<%@ page import="alms.RegisteredOpenExam" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registeredOpenExam.label', default: 'RegisteredOpenExam')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-registeredOpenExam" class="content scaffold-create" role="main">
			<legend><g:message code="default.create.label" args="[entityName]" /></legend>
			<g:if test="${flash.message}">
			<div class="alert alert-danger" role="alert">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${registeredOpenExamInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${registeredOpenExamInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" name="mainForm">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="btn btn-default" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
