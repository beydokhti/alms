<%@ page import="alms.Institution" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'institution.label', default: 'Institution')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>

    <style>
    .col-md-3 {
        height: 30px
    }
    </style>
</head>

<body>

<div id="show-institution" class="content scaffold-show" role="main">
    <legend><g:message code="default.show.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:if test="${institutionInstance?.name}">

        <span id="name-label" class="col-md-3"><g:message code="institution.name.label"
                                                          default="Name"/></span>

        <span class="col-md-3" aria-labelledby="name-label"><g:fieldValue bean="${institutionInstance}"
                                                                          field="name"/></span>

    </g:if>

    <g:if test="${institutionInstance?.nationalCode}">

        <span id="nationalCode-label" class="col-md-3"><g:message code="institution.nationalCode.label"
                                                                  default="National Code"/></span>

        <span class="col-md-3" aria-labelledby="nationalCode-label"><g:fieldValue
                bean="${institutionInstance}" field="nationalCode"/></span>

    </g:if>

    <g:if test="${institutionInstance?.registerNumber}">

        <span id="registerNumber-label" class="col-md-3"><g:message
                code="institution.registerNumber.label" default="Register Number"/></span>

        <span class="col-md-3" aria-labelledby="registerNumber-label"><g:fieldValue
                bean="${institutionInstance}" field="registerNumber"/></span>

    </g:if>

    <g:if test="${institutionInstance?.address}">

        <span id="address-label" class="col-md-3"><g:message code="institution.address.label"
                                                             default="Address"/></span>

        <span class="col-md-3" aria-labelledby="address-label"><g:fieldValue bean="${institutionInstance}"
                                                                             field="address"/></span>

    </g:if>

    <g:if test="${institutionInstance?.phone}">

        <span id="phone-label" class="col-md-3"><g:message code="institution.phone.label"
                                                           default="Phone"/></span>

        <span class="col-md-3" aria-labelledby="phone-label"><g:fieldValue bean="${institutionInstance}"
                                                                           field="phone"/></span>

    </g:if>

    <g:if test="${institutionInstance?.fax}">

        <span id="fax-label" class="col-md-3"><g:message code="institution.fax.label"
                                                         default="Fax"/></span>

        <span class="col-md-3" aria-labelledby="fax-label"><g:fieldValue bean="${institutionInstance}"
                                                                         field="fax"/></span>

    </g:if>

    <g:if test="${institutionInstance?.email}">

        <span id="email-label" class="col-md-3"><g:message code="institution.email.label"
                                                           default="Email"/></span>

        <span class="col-md-3" aria-labelledby="email-label"><g:fieldValue bean="${institutionInstance}"
                                                                           field="email"/></span>

    </g:if>

    <g:if test="${readOnly = false}">
        <div class="col-md-12">
            <g:form>
                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${institutionInstance?.id}"/>
                    <g:link class="btn btn-default" action="edit" id="${institutionInstance?.id}"><g:message
                            code="default.button.edit.label" default="Edit"/></g:link>
                    <g:actionSubmit class="btn btn-default" action="delete"
                                    value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                </fieldset>
            </g:form>
        </div>
    </g:if>
</div>
</body>
</html>
