<%@ page import="alms.BrokerSoftware" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerSoftware.label', default: 'BrokerSoftware')}"/>
</head>

<body>
<div id="show-brokerSoftware" class="content scaffold-show" role="main">
    <legend><g:message code="default.show.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="alert">${flash.message}</div>
    </g:if>
    <ol class="property-list brokerSoftware">

        <g:if test="${brokerSoftwareInstance?.title1}">
            <li class="fieldcontain">
                <span id="title1-label" class="property-label"><g:message code="brokerSoftware.title1.label"
                                                                          default="Title1"/></span>

                <span class="property-value" aria-labelledby="title1-label"><g:fieldValue
                        bean="${brokerSoftwareInstance}" field="title1"/></span>

            </li>
        </g:if>

        <g:if test="${brokerSoftwareInstance?.title2}">
            <li class="fieldcontain">
                <span id="title2-label" class="property-label"><g:message code="brokerSoftware.title2.label"
                                                                          default="Title2"/></span>

                <span class="property-value" aria-labelledby="title2-label"><g:fieldValue
                        bean="${brokerSoftwareInstance}" field="title2"/></span>

            </li>
        </g:if>

        <g:if test="${brokerSoftwareInstance?.companyName}">
            <li class="fieldcontain">
                <span id="companyName-label" class="property-label"><g:message code="brokerSoftware.companyName.label"
                                                                               default="Company Name"/></span>

                <span class="property-value" aria-labelledby="companyName-label"><g:fieldValue
                        bean="${brokerSoftwareInstance}" field="companyName"/></span>

            </li>
        </g:if>

        <g:if test="${brokerSoftwareInstance?.contractType}">
            <li class="fieldcontain">
                <span id="contractType-label" class="property-label"><g:message code="brokerSoftware.contractType.label"
                                                                                default="Contract Type"/></span>

                <span class="property-value" aria-labelledby="contractType-label"><g:fieldValue
                        bean="${brokerSoftwareInstance}" field="contractType"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${brokerSoftwareInstance?.id}"/>
            <g:link class="btn btn-default" action="edit" id="${brokerSoftwareInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="btn btn-default" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
