<%@ page import="alms.RegisteredOpenExam" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'registeredOpenExam.label', default: 'RegisteredOpenExam')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div id="edit-registeredOpenExam" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${registeredOpenExamInstance}">
        <ul class="alert alert-danger" role="alert">
            <g:eachError bean="${registeredOpenExamInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form method="post" name="mainForm">
        <g:hiddenField name="id" value="${registeredOpenExamInstance?.id}"/>
        <g:hiddenField name="version" value="${registeredOpenExamInstance?.version}"/>
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="btn btn-default" action="update"
                            value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            <g:actionSubmit class="btn btn-default" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate=""
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
