<%@ page import="alms.ObtainedCertificate" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-obtainedCertificate" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-obtainedCertificate" class="content scaffold-show" role="main">
    <legend><g:message code="default.show.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list obtainedCertificate">

        <g:if test="${obtainedCertificateInstance?.certificate}">
            <li class="fieldcontain">
                <span id="certificate-label" class="property-label"><g:message
                        code="obtainedCertificate.certificate.label" default="Certificate"/></span>

                <span class="property-value" aria-labelledby="certificate-label"><g:link controller="certificate"
                                                                                         action="show"
                                                                                         id="${obtainedCertificateInstance?.certificate?.id}">${obtainedCertificateInstance?.certificate?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${obtainedCertificateInstance?.obtainedDate}">
            <li class="fieldcontain">
                <span id="obtainedDate-label" class="property-label"><g:message
                        code="obtainedCertificate.obtainedDate.label" default="Obtained Date"/></span>

                <span class="property-value" aria-labelledby="obtainedDate-label"><g:formatDate
                        date="${obtainedCertificateInstance?.obtainedDate}"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${obtainedCertificateInstance?.id}"/>
            <g:link class="edit" action="edit" id="${obtainedCertificateInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="btn btn-default" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
