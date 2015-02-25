<%@ page import="alms.Certificate" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'certificate.label', default: 'Certificate')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-certificate" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-certificate" class="content scaffold-show" role="main">
    <legend><g:message code="default.show.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list certificate">

        <g:if test="${certificateInstance?.cerType}">
            <li class="fieldcontain">
                <span id="cerType-label" class="property-label"><g:message code="certificate.cerType.label"
                                                                           default="Cre Type"/></span>

                <span class="property-value" aria-labelledby="cerType-label"><g:fieldValue bean="${certificateInstance}"
                                                                                           field="cerType"/></span>

            </li>
        </g:if>

        <g:if test="${certificateInstance?.cerTitle}">
            <li class="fieldcontain">
                <span id="cerTitle-label" class="property-label"><g:message code="certificate.cerTitle.label"
                                                                            default="Cer Title"/></span>

                <span class="property-value" aria-labelledby="cerTitle-label"><g:fieldValue
                        bean="${certificateInstance}" field="cerTitle"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${certificateInstance?.id}"/>
            <g:link class="edit" action="edit" id="${certificateInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="btn btn-default" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
