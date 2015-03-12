<%@ page import="alms.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <style>
    .col-md-3 {
        height: 30px
    }
    </style>
</head>

<body>

<div id="show-person" class="content scaffold-show" role="main">
    <legend><g:message code="default.show.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="row">
        <g:if test="${personInstance?.name}">
            <div class="fieldcontain ">
                <span id="name-label" class="col-md-3"><g:message code="person.name.label" default="Name"/></span>

                <span class="col-md-3" aria-labelledby="name-label"><g:fieldValue bean="${personInstance}"
                                                                                  field="name"/></span>

            </div>
        </g:if>

        <g:if test="${personInstance?.lastName}">

            <span id="lastName-label" class="col-md-3"><g:message code="person.lastName.label"
                                                                  default="Last Name"/></span>

            <span class="col-md-3" aria-labelledby="lastName-label"><g:fieldValue bean="${personInstance}"
                                                                                  field="lastName"/></span>

        </g:if>

        <g:if test="${personInstance?.sex}">

            <span id="sex-label" class="col-md-3"><g:message code="person.sex.label" default="Sex"/></span>

            <span class="col-md-3" aria-labelledby="sex-label"><g:fieldValue bean="${personInstance}"
                                                                             field="sex"/></span>

        </g:if>

        <g:if test="${personInstance?.degree}">

            <span id="degree-label" class="col-md-3"><g:message code="person.degree.label"
                                                                default="Degree"/></span>

            <span class="col-md-3" aria-labelledby="degree-label"><g:fieldValue bean="${personInstance}"
                                                                                field="degree"/></span>

        </g:if>

        <g:if test="${personInstance?.field}">

            <span id="field-label" class="col-md-3"><g:message code="person.field.label"
                                                               default="Field"/></span>

            <span class="col-md-3" aria-labelledby="field-label"><g:fieldValue bean="${personInstance}"
                                                                               field="field"/></span>

        </g:if>

        <g:if test="${personInstance?.dateOfBirth}">

            <span id="dateOfBirth-label" class="col-md-3"><g:message code="person.dateOfBirth.label"
                                                                     default="Data Of Birth"/></span>

            <span class="col-md-3" aria-labelledby="dateOfBirth-label"><g:formatDate
                    date="${personInstance?.dateOfBirth}"/></span>

        </g:if>

        <g:if test="${personInstance?.nationalCode}">

            <span id="nationalCode-label" class="col-md-3"><g:message code="person.nationalCode.label"
                                                                      default="National Code"/></span>

            <span class="col-md-3" aria-labelledby="nationalCode-label"><g:fieldValue bean="${personInstance}"
                                                                                      field="nationalCode"/></span>

        </g:if>

        <g:if test="${personInstance?.mobile}">

            <span id="mobile-label" class="col-md-3"><g:message code="person.mobile.label"
                                                                default="Mobile"/></span>

            <span class="col-md-3" aria-labelledby="mobile-label"><g:fieldValue bean="${personInstance}"
                                                                                field="mobile"/></span>

        </g:if>

        <g:if test="${personInstance?.email}">

            <span id="email-label" class="col-md-3"><g:message code="person.email.label"
                                                               default="Email"/></span>

            <span class="col-md-3" aria-labelledby="email-label"><g:fieldValue bean="${personInstance}"
                                                                               field="email"/></span>

        </g:if>

    </div>
    <g:if test="${readOnly = false}">
        <div class="col-md-12">
            <g:form>
                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${personInstance?.id}"/>
                    <g:link class="btn btn-default" action="edit" id="${personInstance?.id}"><g:message
                            code="default.button.edit.label"
                            default="Edit"/></g:link>
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
