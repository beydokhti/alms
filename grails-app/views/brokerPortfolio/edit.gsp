<%@ page import="alms.BrokerPortfolio" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio')}"/>
</head>

<body>
<div id="edit-brokerPortfolio" class="content scaffold-edit" role="main">
    <legend><g:message code="default.edit.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${brokerPortfolioInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${brokerPortfolioInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${brokerPortfolioInstance?.id}"/>
        <g:hiddenField name="version" value="${brokerPortfolioInstance?.version}"/>
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
