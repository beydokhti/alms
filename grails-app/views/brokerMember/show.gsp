<%@ page import="alms.BrokerMember" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerMember.label', default: 'BrokerMember')}"/>
</head>

<body>
<div id="show-brokerMember" class="content scaffold-show" role="main">
    <legend><g:message code="default.show.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="alert">${flash.message}</div>
    </g:if>
    <ol class="property-list brokerMember">

        <g:if test="${brokerMemberInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="brokerMember.name.label"
                                                                        default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${brokerMemberInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <g:if test="${brokerMemberInstance?.lastName}">
            <li class="fieldcontain">
                <span id="lastName-label" class="property-label"><g:message code="brokerMember.lastName.label"
                                                                            default="Last Name"/></span>

                <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue
                        bean="${brokerMemberInstance}" field="lastName"/></span>

            </li>
        </g:if>

        <g:if test="${brokerMemberInstance?.sex}">
            <li class="fieldcontain">
                <span id="sex-label" class="property-label"><g:message code="brokerMember.sex.label"
                                                                       default="Sex"/></span>

                <span class="property-value" aria-labelledby="sex-label"><g:fieldValue bean="${brokerMemberInstance}"
                                                                                       field="sex"/></span>

            </li>
        </g:if>

        <g:if test="${brokerMemberInstance?.position}">
            <li class="fieldcontain">
                <span id="position-label" class="property-label"><g:message code="brokerMember.position.label"
                                                                            default="Position"/></span>

                <span class="property-value" aria-labelledby="position-label"><g:fieldValue
                        bean="${brokerMemberInstance}" field="position"/></span>

            </li>
        </g:if>

        <g:if test="${brokerMemberInstance?.startDate}">
            <li class="fieldcontain">
                <span id="startDate-label" class="property-label"><g:message code="brokerMember.startDate.label"
                                                                             default="Start Date"/></span>

                <span class="property-value" aria-labelledby="startDate-label"><g:formatDate
                        date="${brokerMemberInstance?.startDate}"/></span>

            </li>
        </g:if>

        <g:if test="${brokerMemberInstance?.degree}">
            <li class="fieldcontain">
                <span id="degree-label" class="property-label"><g:message code="brokerMember.degree.label"
                                                                          default="Degree"/></span>

                <span class="property-value" aria-labelledby="degree-label"><g:fieldValue bean="${brokerMemberInstance}"
                                                                                          field="degree"/></span>

            </li>
        </g:if>

        <g:if test="${brokerMemberInstance?.field}">
            <li class="fieldcontain">
                <span id="field-label" class="property-label"><g:message code="brokerMember.field.label"
                                                                         default="Field"/></span>

                <span class="property-value" aria-labelledby="field-label"><g:fieldValue bean="${brokerMemberInstance}"
                                                                                         field="field"/></span>

            </li>
        </g:if>

        <g:if test="${brokerMemberInstance?.dateOfBirth}">
            <li class="fieldcontain">
                <span id="dateOfBirth-label" class="property-label"><g:message code="brokerMember.dateOfBirth.label"
                                                                               default="Date Of Birth"/></span>

                <span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate
                        date="${brokerMemberInstance?.dateOfBirth}"/></span>

            </li>
        </g:if>

        <g:if test="${brokerMemberInstance?.nationalCode}">
            <li class="fieldcontain">
                <span id="nationalCode-label" class="property-label"><g:message code="brokerMember.nationalCode.label"
                                                                                default="National Code"/></span>

                <span class="property-value" aria-labelledby="nationalCode-label"><g:fieldValue
                        bean="${brokerMemberInstance}" field="nationalCode"/></span>

            </li>
        </g:if>

        <g:if test="${brokerMemberInstance?.mobile}">
            <li class="fieldcontain">
                <span id="mobile-label" class="property-label"><g:message code="brokerMember.mobile.label"
                                                                          default="Mobile"/></span>

                <span class="property-value" aria-labelledby="mobile-label"><g:fieldValue bean="${brokerMemberInstance}"
                                                                                          field="mobile"/></span>

            </li>
        </g:if>

        <g:if test="${brokerMemberInstance?.email}">
            <li class="fieldcontain">
                <span id="email-label" class="property-label"><g:message code="brokerMember.email.label"
                                                                         default="Email"/></span>

                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${brokerMemberInstance}"
                                                                                         field="email"/></span>

            </li>
        </g:if>

        <g:if test="${brokerMemberInstance?.certificates}">
            <li class="fieldcontain">
                <span id="certificates-label" class="property-label"><g:message code="brokerMember.certificates.label"
                                                                                default="Certificates"/></span>

                <g:each in="${brokerMemberInstance.certificates}" var="c">
                    <span class="property-value" aria-labelledby="certificates-label"><g:link
                            controller="obtainedCertificate" action="show"
                            id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${brokerMemberInstance?.id}"/>
            <g:link class="btn btn-default" action="edit" id="${brokerMemberInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="btn btn-default" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
