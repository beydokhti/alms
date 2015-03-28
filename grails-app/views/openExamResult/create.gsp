<%@ page import="alms.OpenExamResult" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'openExamResult.label', default: 'OpenExamResult')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<div id="create-openExamResult" class="content scaffold-create" role="main">
    <legend><g:message code="default.create.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${openExamResultInstance}">
        <ul class="alert alert-danger" role="alert">
            <g:eachError bean="${openExamResultInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="save" name="mainForm">
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="btn btn-default"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
