<%@ page import="alms.BrokerBranch" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerBranch.label', default: 'BrokerBranch')}"/>
</head>

<body>
<div id="show-brokerBranch" class="content scaffold-show" role="main">
    <legend><g:message code="default.show.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list brokerBranch">

        <g:if test="${brokerBranchInstance?.city}">
            <li class="fieldcontain">
                <span id="city-label" class="property-label"><g:message code="brokerBranch.city.label"
                                                                        default="City"/></span>

                <span class="property-value" aria-labelledby="city-label"><g:link controller="city" action="show"
                                                                                  id="${brokerBranchInstance?.city?.id}">${brokerBranchInstance?.city?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${brokerBranchInstance?.branchType}">
            <li class="fieldcontain">
                <span id="branchType-label" class="property-label"><g:message code="brokerBranch.branchType.label"
                                                                              default="Branch Type"/></span>

                <span class="property-value" aria-labelledby="branchType-label"><g:fieldValue
                        bean="${brokerBranchInstance}" field="branchType"/></span>

            </li>
        </g:if>

        <g:if test="${brokerBranchInstance?.representativePerson}">
            <li class="fieldcontain">
                <span id="representativePerson-label" class="property-label"><g:message
                        code="brokerBranch.representativePerson.label" default="Representative Person"/></span>

                <span class="property-value" aria-labelledby="representativePerson-label"><g:fieldValue
                        bean="${brokerBranchInstance}" field="representativePerson"/></span>

            </li>
        </g:if>

        <g:if test="${brokerBranchInstance?.personnelCount}">
            <li class="fieldcontain">
                <span id="personnelCount-label" class="property-label"><g:message
                        code="brokerBranch.personnelCount.label" default="Personnel Count"/></span>

                <span class="property-value" aria-labelledby="personnelCount-label"><g:fieldValue
                        bean="${brokerBranchInstance}" field="personnelCount"/></span>

            </li>
        </g:if>

        <g:if test="${brokerBranchInstance?.tseStock}">
            <li class="fieldcontain">
                <span id="tseStock-label" class="property-label"><g:message code="brokerBranch.tseStock.label"
                                                                            default="Tse Stock"/></span>

                <span class="property-value" aria-labelledby="tseStock-label"><g:formatBoolean
                        boolean="${brokerBranchInstance?.tseStock}"/></span>

            </li>
        </g:if>

        <g:if test="${brokerBranchInstance?.imeStock}">
            <li class="fieldcontain">
                <span id="imeStock-label" class="property-label"><g:message code="brokerBranch.imeStock.label"
                                                                            default="Ime Stock"/></span>

                <span class="property-value" aria-labelledby="imeStock-label"><g:formatBoolean
                        boolean="${brokerBranchInstance?.imeStock}"/></span>

            </li>
        </g:if>

        <g:if test="${brokerBranchInstance?.energyStock}">
            <li class="fieldcontain">
                <span id="energyStock-label" class="property-label"><g:message code="brokerBranch.energyStock.label"
                                                                               default="Energy Stock"/></span>

                <span class="property-value" aria-labelledby="energyStock-label"><g:formatBoolean
                        boolean="${brokerBranchInstance?.energyStock}"/></span>

            </li>
        </g:if>

        <g:if test="${brokerBranchInstance?.imeFuture}">
            <li class="fieldcontain">
                <span id="imeFuture-label" class="property-label"><g:message code="brokerBranch.imeFuture.label"
                                                                             default="Ime Future"/></span>

                <span class="property-value" aria-labelledby="imeFuture-label"><g:formatBoolean
                        boolean="${brokerBranchInstance?.imeFuture}"/></span>

            </li>
        </g:if>

        <g:if test="${brokerBranchInstance?.tseFuture}">
            <li class="fieldcontain">
                <span id="tseFuture-label" class="property-label"><g:message code="brokerBranch.tseFuture.label"
                                                                             default="Tse Future"/></span>

                <span class="property-value" aria-labelledby="tseFuture-label"><g:formatBoolean
                        boolean="${brokerBranchInstance?.tseFuture}"/></span>

            </li>
        </g:if>

        <g:if test="${brokerBranchInstance?.mutualFundAdmin}">
            <li class="fieldcontain">
                <span id="mutualFundAdmin-label" class="property-label"><g:message
                        code="brokerBranch.mutualFundAdmin.label" default="Mutual Fund Admin"/></span>

                <span class="property-value" aria-labelledby="mutualFundAdmin-label"><g:formatBoolean
                        boolean="${brokerBranchInstance?.mutualFundAdmin}"/></span>

            </li>
        </g:if>

        <g:if test="${brokerBranchInstance?.address}">
            <li class="fieldcontain">
                <span id="address-label" class="property-label"><g:message code="brokerBranch.address.label"
                                                                           default="Address"/></span>

                <span class="property-value" aria-labelledby="address-label"><g:link controller="address" action="show"
                                                                                     id="${brokerBranchInstance?.address?.id}">${brokerBranchInstance?.address?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${brokerBranchInstance?.phones}">
            <li class="fieldcontain">
                <span id="phones-label" class="property-label"><g:message code="brokerBranch.phones.label"
                                                                          default="Phones"/></span>

                <span class="property-value" aria-labelledby="phones-label"><g:fieldValue bean="${brokerBranchInstance}"
                                                                                          field="phones"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${brokerBranchInstance?.id}"/>
            <g:link class="btn btn-default" action="edit" id="${brokerBranchInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="btn btn-default" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
