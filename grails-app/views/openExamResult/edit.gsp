<%@ page import="alms.OpenExamResult" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'openExamResult.label', default: 'OpenExamResult')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>

<div id="edit-openExamResult" class="content scaffold-edit" role="main">
    <legend><g:message code="default.edit.label" args="[entityName]"/></legend>
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
    <g:form method="post" name="mainForm">
        <g:hiddenField name="id" value="${openExamResultInstance?.id}"/>
        <g:hiddenField name="version" value="${openExamResultInstance?.version}"/>
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
