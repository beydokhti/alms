<%@ page import="alms.City" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'city.label', default: 'City')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-city" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-city" class="content scaffold-show" role="main">
    <legend><g:message code="default.show.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="alert">${flash.message}</div>
    </g:if>
    <ol class="property-list city">

        <g:if test="${cityInstance?.country}">
            <li class="fieldcontain">
                <span id="country-label" class="property-label"><g:message code="city.country.label"
                                                                           default="Country"/></span>

                <span class="property-value" aria-labelledby="country-label"><g:link controller="country" action="show"
                                                                                     id="${cityInstance?.country?.id}">${cityInstance?.country?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${cityInstance?.title}">
            <li class="fieldcontain">
                <span id="title-label" class="property-label"><g:message code="city.title.label"
                                                                         default="Title"/></span>

                <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${cityInstance}"
                                                                                         field="title"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${cityInstance?.id}"/>
            <g:link class="btn btn-default" action="edit" id="${cityInstance?.id}"><g:message code="default.button.edit.label"
                                                                                   default="Edit"/></g:link>
            <g:actionSubmit class="btn btn-default" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
