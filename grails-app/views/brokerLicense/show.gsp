<%@ page import="alms.BrokerLicense" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerLicense.label', default: 'BrokerLicense')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-brokerLicense" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                    default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-brokerLicense" class="content scaffold-show" role="main">
    <legend><g:message code="default.show.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="alert">${flash.message}</div>
    </g:if>
    <ol class="property-list brokerLicense">

        <g:if test="${brokerLicenseInstance?.displayOrder}">
            <li class="fieldcontain">
                <span id="displayOrder-label" class="property-label"><g:message code="brokerLicense.displayOrder.label"
                                                                                default="Display Order"/></span>

                <span class="property-value" aria-labelledby="displayOrder-label"><g:fieldValue
                        bean="${brokerLicenseInstance}" field="displayOrder"/></span>

            </li>
        </g:if>

        <g:if test="${brokerLicenseInstance?.title1}">
            <li class="fieldcontain">
                <span id="title1-label" class="property-label"><g:message code="brokerLicense.title1.label"
                                                                          default="Title1"/></span>

                <span class="property-value" aria-labelledby="title1-label"><g:fieldValue
                        bean="${brokerLicenseInstance}" field="title1"/></span>

            </li>
        </g:if>

        <g:if test="${brokerLicenseInstance?.title2}">
            <li class="fieldcontain">
                <span id="title2-label" class="property-label"><g:message code="brokerLicense.title2.label"
                                                                          default="Title2"/></span>

                <span class="property-value" aria-labelledby="title2-label"><g:fieldValue
                        bean="${brokerLicenseInstance}" field="title2"/></span>

            </li>
        </g:if>

        <g:if test="${brokerLicenseInstance?.hasLicense}">
            <li class="fieldcontain">
                <span id="hasLicense-label" class="property-label"><g:message code="brokerLicense.hasLicense.label"
                                                                              default="Has License"/></span>

                <span class="property-value" aria-labelledby="hasLicense-label"><g:formatBoolean
                        boolean="${brokerLicenseInstance?.hasLicense}"/></span>

            </li>
        </g:if>

        <g:if test="${brokerLicenseInstance?.licenseNumber}">
            <li class="fieldcontain">
                <span id="licenseNumber-label" class="property-label"><g:message
                        code="brokerLicense.licenseNumber.label" default="License Number"/></span>

                <span class="property-value" aria-labelledby="licenseNumber-label"><g:fieldValue
                        bean="${brokerLicenseInstance}" field="licenseNumber"/></span>

            </li>
        </g:if>

        <g:if test="${brokerLicenseInstance?.licenseDate}">
            <li class="fieldcontain">
                <span id="licenseDate-label" class="property-label"><g:message code="brokerLicense.licenseDate.label"
                                                                               default="License Date"/></span>

                <span class="property-value" aria-labelledby="licenseDate-label"><g:formatDate
                        date="${brokerLicenseInstance?.licenseDate}"/></span>

            </li>
        </g:if>

        <g:if test="${brokerLicenseInstance?.licenseExpiry}">
            <li class="fieldcontain">
                <span id="licenseExpiry-label" class="property-label"><g:message
                        code="brokerLicense.licenseExpiry.label" default="License Expiry"/></span>

                <span class="property-value" aria-labelledby="licenseExpiry-label"><g:formatDate
                        date="${brokerLicenseInstance?.licenseExpiry}"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${brokerLicenseInstance?.id}"/>
            <g:link class="btn btn-default" action="edit" id="${brokerLicenseInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="btn btn-default" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
