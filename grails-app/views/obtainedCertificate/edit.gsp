<%@ page import="alms.ObtainedCertificate" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>

<div id="edit-obtainedCertificate" class="content scaffold-edit" role="main">
    <legend><g:message code="default.edit.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="alert">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${obtainedCertificateInstance}">
        <ul class="alert alert-danger"role="alert">
            <g:eachError bean="${obtainedCertificateInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${obtainedCertificateInstance?.id}"/>
        <g:hiddenField name="version" value="${obtainedCertificateInstance?.version}"/>
        <fieldset class="form-horizontal">
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
