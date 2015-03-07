<%@ page import="alms.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-person" class="content scaffold-show" role="main">
    <legend><g:message code="default.show.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
%{--<ol class="property-list person">--}%

    <div class="row">
        <g:if test="${personInstance?.name}">
            <div class="fieldcontain ">
                <span id="name-label" class="property-label"><g:message code="person.name.label" default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${personInstance}"
                                                                                        field="name"/></span>

            </div>
        </g:if>

        <g:if test="${personInstance?.lastName}">
            <li class="fieldcontain">
                <span id="lastName-label" class="property-label"><g:message code="person.lastName.label"
                                                                            default="Last Name"/></span>

                <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${personInstance}"
                                                                                            field="lastName"/></span>

            </li>
        </g:if>

        <g:if test="${personInstance?.sex}">
            <li class="fieldcontain">
                <span id="sex-label" class="property-label"><g:message code="person.sex.label" default="Sex"/></span>

                <span class="property-value" aria-labelledby="sex-label"><g:fieldValue bean="${personInstance}"
                                                                                       field="sex"/></span>

            </li>
        </g:if>

        <g:if test="${personInstance?.degree}">
            <li class="fieldcontain">
                <span id="degree-label" class="property-label"><g:message code="person.degree.label"
                                                                          default="Degree"/></span>

                <span class="property-value" aria-labelledby="degree-label"><g:fieldValue bean="${personInstance}"
                                                                                          field="degree"/></span>

            </li>
        </g:if>

        <g:if test="${personInstance?.field}">
            <li class="fieldcontain">
                <span id="field-label" class="property-label"><g:message code="person.field.label"
                                                                         default="Field"/></span>

                <span class="property-value" aria-labelledby="field-label"><g:fieldValue bean="${personInstance}"
                                                                                         field="field"/></span>

            </li>
        </g:if>

        <g:if test="${personInstance?.dateOfBirth}">
            <li class="fieldcontain">
                <span id="dateOfBirth-label" class="property-label"><g:message code="person.dateOfBirth.label"
                                                                               default="Data Of Birth"/></span>

                <span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate
                        date="${personInstance?.dateOfBirth}"/></span>

            </li>
        </g:if>

        <g:if test="${personInstance?.nationalCode}">
            <li class="fieldcontain">
                <span id="nationalCode-label" class="property-label"><g:message code="person.nationalCode.label"
                                                                                default="National Code"/></span>

                <span class="property-value" aria-labelledby="nationalCode-label"><g:fieldValue bean="${personInstance}"
                                                                                                field="nationalCode"/></span>

            </li>
        </g:if>

        <g:if test="${personInstance?.mobile}">
            <li class="fieldcontain">
                <span id="mobile-label" class="property-label"><g:message code="person.mobile.label"
                                                                          default="Mobile"/></span>

                <span class="property-value" aria-labelledby="mobile-label"><g:fieldValue bean="${personInstance}"
                                                                                          field="mobile"/></span>

            </li>
        </g:if>

        <g:if test="${personInstance?.email}">
            <li class="fieldcontain">
                <span id="email-label" class="property-label"><g:message code="person.email.label"
                                                                         default="Email"/></span>

                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${personInstance}"
                                                                                         field="email"/></span>

            </li>
        </g:if>

        <g:if test="${personInstance?.certificates}">
            <li class="fieldcontain">
                <span id="certificates-label" class="property-label"><g:message code="person.certificates.label"
                                                                                default="Certificates"/></span>

                <g:each in="${personInstance.certificates}" var="c">
                    <span class="property-value" aria-labelledby="certificates-label"><g:link
                            controller="obtainedCertificate" action="show"
                            id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </div>
%{--</ol>--}%
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${personInstance?.id}"/>
            <g:link class="edit" action="edit" id="${personInstance?.id}"><g:message code="default.button.edit.label"
                                                                                     default="Edit"/></g:link>
            <g:actionSubmit class="btn btn-default" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
