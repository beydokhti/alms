<%@ page import="alms.InstitutionMember" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerMember.label', default: 'InstitutionMember')}"/>
</head>

<body>
<div id="show-institutionMember" class="content scaffold-show" role="main">
    <legend><g:message code="default.show.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list institutionMember">

        <g:if test="${institutionMemberInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="institutionMember.name.label"
                                                                        default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${institutionMemberInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <g:if test="${institutionMemberInstance?.lastName}">
            <li class="fieldcontain">
                <span id="lastName-label" class="property-label"><g:message code="institutionMember.lastName.label"
                                                                            default="Last Name"/></span>

                <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue
                        bean="${institutionMemberInstance}" field="lastName"/></span>

            </li>
        </g:if>

        <g:if test="${institutionMemberInstance?.sex}">
            <li class="fieldcontain">
                <span id="sex-label" class="property-label"><g:message code="institutionMember.sex.label"
                                                                       default="Sex"/></span>

                <span class="property-value" aria-labelledby="sex-label"><g:fieldValue bean="${institutionMemberInstance}"
                                                                                       field="sex"/></span>

            </li>
        </g:if>

        <g:if test="${institutionMemberInstance?.startDate}">
            <li class="fieldcontain">
                <span id="startDate-label" class="property-label"><g:message code="institutionMember.startDate.label"
                                                                             default="Start Date"/></span>

                <span class="property-value" aria-labelledby="startDate-label"><g:formatDate
                        date="${institutionMemberInstance?.startDate}"/></span>

            </li>
        </g:if>

        <g:if test="${institutionMemberInstance?.degree}">
            <li class="fieldcontain">
                <span id="degree-label" class="property-label"><g:message code="institutionMember.degree.label"
                                                                          default="Degree"/></span>

                <span class="property-value" aria-labelledby="degree-label"><g:fieldValue bean="${institutionMemberInstance}"
                                                                                          field="degree"/></span>

            </li>
        </g:if>

        <g:if test="${institutionMemberInstance?.field}">
            <li class="fieldcontain">
                <span id="field-label" class="property-label"><g:message code="institutionMember.field.label"
                                                                         default="Field"/></span>

                <span class="property-value" aria-labelledby="field-label"><g:fieldValue bean="${institutionMemberInstance}"
                                                                                         field="field"/></span>

            </li>
        </g:if>

        <g:if test="${institutionMemberInstance?.dateOfBirth}">
            <li class="fieldcontain">
                <span id="dateOfBirth-label" class="property-label"><g:message code="institutionMember.dateOfBirth.label"
                                                                               default="Date Of Birth"/></span>

                <span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate
                        date="${institutionMemberInstance?.dateOfBirth}"/></span>

            </li>
        </g:if>

        <g:if test="${institutionMemberInstance?.nationalCode}">
            <li class="fieldcontain">
                <span id="nationalCode-label" class="property-label"><g:message code="institutionMember.nationalCode.label"
                                                                                default="National Code"/></span>

                <span class="property-value" aria-labelledby="nationalCode-label"><g:fieldValue
                        bean="${institutionMemberInstance}" field="nationalCode"/></span>

            </li>
        </g:if>

        <g:if test="${institutionMemberInstance?.mobile}">
            <li class="fieldcontain">
                <span id="mobile-label" class="property-label"><g:message code="institutionMember.mobile.label"
                                                                          default="Mobile"/></span>

                <span class="property-value" aria-labelledby="mobile-label"><g:fieldValue bean="${institutionMemberInstance}"
                                                                                          field="mobile"/></span>

            </li>
        </g:if>

        <g:if test="${institutionMemberInstance?.email}">
            <li class="fieldcontain">
                <span id="email-label" class="property-label"><g:message code="institutionMember.email.label"
                                                                         default="Email"/></span>

                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${institutionMemberInstance}"
                                                                                         field="email"/></span>

            </li>
        </g:if>

        <g:if test="${institutionMemberInstance?.certificates}">
            <li class="fieldcontain">
                <span id="certificates-label" class="property-label"><g:message code="institutionMember.certificates.label"
                                                                                default="Certificates"/></span>

                <g:each in="${institutionMemberInstance.certificates}" var="c">
                    <span class="property-value" aria-labelledby="certificates-label"><g:link
                            controller="obtainedCertificate" action="show"
                            id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${institutionMemberInstance?.id}"/>
            <g:link class="edit" action="edit" id="${institutionMemberInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="btn btn-default" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
