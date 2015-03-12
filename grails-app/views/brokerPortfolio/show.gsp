<%@ page import="alms.BrokerPortfolio" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio')}"/>
</head>

<body>
<div id="show-brokerPortfolio" class="content scaffold-show" role="main">
    <legend><g:message code="default.show.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list brokerPortfolio">

        <g:if test="${brokerPortfolioInstance?.countOfContract}">
            <li class="fieldcontain">
                <span id="countOfContract-label" class="property-label"><g:message
                        code="brokerPortfolio.countOfContract.label" default="Count Of Contract"/></span>

                <span class="property-value" aria-labelledby="countOfContract-label"><g:fieldValue
                        bean="${brokerPortfolioInstance}" field="countOfContract"/></span>

            </li>
        </g:if>

        <g:if test="${brokerPortfolioInstance?.sumOfContract}">
            <li class="fieldcontain">
                <span id="sumOfContract-label" class="property-label"><g:message
                        code="brokerPortfolio.sumOfContract.label" default="Sum Of Contract"/></span>

                <span class="property-value" aria-labelledby="sumOfContract-label"><g:fieldValue
                        bean="${brokerPortfolioInstance}" field="sumOfContract"/></span>

            </li>
        </g:if>

        <g:if test="${brokerPortfolioInstance?.countOfConsultantContract}">
            <li class="fieldcontain">
                <span id="countOfConsultantContract-label" class="property-label"><g:message
                        code="brokerPortfolio.countOfConsultantContract.label"
                        default="Count Of Consultant Contract"/></span>

                <span class="property-value" aria-labelledby="countOfConsultantContract-label"><g:fieldValue
                        bean="${brokerPortfolioInstance}" field="countOfConsultantContract"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${brokerPortfolioInstance?.id}"/>
            <g:link class="btn btn-default" action="edit" id="${brokerPortfolioInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="btn btn-default" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
