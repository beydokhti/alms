<%@ page import="alms.Broker" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}"/>
</head>

<body>

<div id="show-broker" class="content scaffold-show" role="main">
    <legend><g:message code="default.show.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list broker">

        <g:if test="${brokerInstance?.brokerPersianName}">
            <li class="fieldcontain">
                <span id="brokerPersianName-label" class="property-label"><g:message
                        code="broker.brokerPersianName.label" default="Broker Persian Name"/></span>

                <span class="property-value" aria-labelledby="brokerPersianName-label"><g:fieldValue
                        bean="${brokerInstance}" field="brokerPersianName"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.brokerLatinName}">
            <li class="fieldcontain">
                <span id="brokerLatinName-label" class="property-label"><g:message code="broker.brokerLatinName.label"
                                                                                   default="Broker Latin Name"/></span>

                <span class="property-value" aria-labelledby="brokerLatinName-label"><g:fieldValue
                        bean="${brokerInstance}" field="brokerLatinName"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.registerDate}">
            <li class="fieldcontain">
                <span id="registerDate-label" class="property-label"><g:message code="broker.registerDate.label"
                                                                                default="Register Date"/></span>

                <span class="property-value" aria-labelledby="registerDate-label"><g:formatDate
                        date="${brokerInstance?.registerDate}"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.registerNo}">
            <li class="fieldcontain">
                <span id="registerNo-label" class="property-label"><g:message code="broker.registerNo.label"
                                                                              default="Register No"/></span>

                <span class="property-value" aria-labelledby="registerNo-label"><g:fieldValue bean="${brokerInstance}"
                                                                                              field="registerNo"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.registerLocation}">
            <li class="fieldcontain">
                <span id="registerLocation-label" class="property-label"><g:message code="broker.registerLocation.label"
                                                                                    default="Register Location"/></span>

                <span class="property-value" aria-labelledby="registerLocation-label"><g:fieldValue
                        bean="${brokerInstance}" field="registerLocation"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.seoRegisterDate}">
            <li class="fieldcontain">
                <span id="seoRegisterDate-label" class="property-label"><g:message code="broker.seoRegisterDate.label"
                                                                                   default="Seo Register Date"/></span>

                <span class="property-value" aria-labelledby="seoRegisterDate-label"><g:formatDate
                        date="${brokerInstance?.seoRegisterDate}"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.seoRegisterNo}">
            <li class="fieldcontain">
                <span id="seoRegisterNo-label" class="property-label"><g:message code="broker.seoRegisterNo.label"
                                                                                 default="Seo Register No"/></span>

                <span class="property-value" aria-labelledby="seoRegisterNo-label"><g:fieldValue
                        bean="${brokerInstance}" field="seoRegisterNo"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.clubMembershipNo}">
            <li class="fieldcontain">
                <span id="clubMembershipNo-label" class="property-label"><g:message code="broker.clubMembershipNo.label"
                                                                                    default="Club Membership No"/></span>

                <span class="property-value" aria-labelledby="clubMembershipNo-label"><g:fieldValue
                        bean="${brokerInstance}" field="clubMembershipNo"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.clubMembershipDate}">
            <li class="fieldcontain">
                <span id="clubMembershipDate-label" class="property-label"><g:message
                        code="broker.clubMembershipDate.label" default="Club Membership Date"/></span>

                <span class="property-value" aria-labelledby="clubMembershipDate-label"><g:formatDate
                        date="${brokerInstance?.clubMembershipDate}"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.registeredCapital}">
            <li class="fieldcontain">
                <span id="registeredCapital-label" class="property-label"><g:message
                        code="broker.registeredCapital.label" default="Registered Capital"/></span>

                <span class="property-value" aria-labelledby="registeredCapital-label"><g:fieldValue
                        bean="${brokerInstance}" field="registeredCapital"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.paidCapital}">
            <li class="fieldcontain">
                <span id="paidCapital-label" class="property-label"><g:message code="broker.paidCapital.label"
                                                                               default="Paid Capital"/></span>

                <span class="property-value" aria-labelledby="paidCapital-label"><g:fieldValue bean="${brokerInstance}"
                                                                                               field="paidCapital"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.sharesNumber}">
            <li class="fieldcontain">
                <span id="sharesNumber-label" class="property-label"><g:message code="broker.sharesNumber.label"
                                                                                default="Shares Number"/></span>

                <span class="property-value" aria-labelledby="sharesNumber-label"><g:fieldValue bean="${brokerInstance}"
                                                                                                field="sharesNumber"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.financialYearEndMonth}">
            <li class="fieldcontain">
                <span id="financialYearEndMonth-label" class="property-label"><g:message
                        code="broker.financialYearEndMonth.label" default="Financial Year End Month"/></span>

                <span class="property-value" aria-labelledby="financialYearEndMonth-label"><g:fieldValue
                        bean="${brokerInstance}" field="financialYearEndMonth"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.financialYearEndDay}">
            <li class="fieldcontain">
                <span id="financialYearEndDay-label" class="property-label"><g:message
                        code="broker.financialYearEndDay.label" default="Financial Year End Day"/></span>

                <span class="property-value" aria-labelledby="financialYearEndDay-label"><g:fieldValue
                        bean="${brokerInstance}" field="financialYearEndDay"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.nationalCode}">
            <li class="fieldcontain">
                <span id="nationalCode-label" class="property-label"><g:message code="broker.nationalCode.label"
                                                                                default="National Code"/></span>

                <span class="property-value" aria-labelledby="nationalCode-label"><g:fieldValue bean="${brokerInstance}"
                                                                                                field="nationalCode"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.economicCode}">
            <li class="fieldcontain">
                <span id="economicCode-label" class="property-label"><g:message code="broker.economicCode.label"
                                                                                default="Economic Code"/></span>

                <span class="property-value" aria-labelledby="economicCode-label"><g:fieldValue bean="${brokerInstance}"
                                                                                                field="economicCode"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.centralOfficeAddress}">
            <li class="fieldcontain">
                <span id="centralOfficeAddress-label" class="property-label"><g:message
                        code="broker.centralOfficeAddress.label" default="Central Office Address"/></span>

                <span class="property-value" aria-labelledby="centralOfficeAddress-label"><g:fieldValue
                        bean="${brokerInstance}" field="centralOfficeAddress"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.centralOfficePostalCode}">
            <li class="fieldcontain">
                <span id="centralOfficePostalCode-label" class="property-label"><g:message
                        code="broker.centralOfficePostalCode.label" default="Central Office Postal Code"/></span>

                <span class="property-value" aria-labelledby="centralOfficePostalCode-label"><g:fieldValue
                        bean="${brokerInstance}" field="centralOfficePostalCode"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.POBox}">
            <li class="fieldcontain">
                <span id="POBox-label" class="property-label"><g:message code="broker.POBox.label"
                                                                         default="POB ox"/></span>

                <span class="property-value" aria-labelledby="POBox-label"><g:fieldValue bean="${brokerInstance}"
                                                                                         field="POBox"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.website}">
            <li class="fieldcontain">
                <span id="website-label" class="property-label"><g:message code="broker.website.label"
                                                                           default="Website"/></span>

                <span class="property-value" aria-labelledby="website-label"><g:fieldValue bean="${brokerInstance}"
                                                                                           field="website"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.email}">
            <li class="fieldcontain">
                <span id="email-label" class="property-label"><g:message code="broker.email.label"
                                                                         default="Email"/></span>

                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${brokerInstance}"
                                                                                         field="email"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.tseRank}">
            <li class="fieldcontain">
                <span id="tseRank-label" class="property-label"><g:message code="broker.tseRank.label"
                                                                           default="Tse Rank"/></span>

                <span class="property-value" aria-labelledby="tseRank-label"><g:fieldValue bean="${brokerInstance}"
                                                                                           field="tseRank"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.tseOrdinaryPoint}">
            <li class="fieldcontain">
                <span id="tseOrdinaryPoint-label" class="property-label"><g:message code="broker.tseOrdinaryPoint.label"
                                                                                    default="Tse Ordinary Point"/></span>

                <span class="property-value" aria-labelledby="tseOrdinaryPoint-label"><g:fieldValue
                        bean="${brokerInstance}" field="tseOrdinaryPoint"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.tseEncouragingPoint}">
            <li class="fieldcontain">
                <span id="tseEncouragingPoint-label" class="property-label"><g:message
                        code="broker.tseEncouragingPoint.label" default="Tse Encouraging Point"/></span>

                <span class="property-value" aria-labelledby="tseEncouragingPoint-label"><g:fieldValue
                        bean="${brokerInstance}" field="tseEncouragingPoint"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.imeRank}">
            <li class="fieldcontain">
                <span id="imeRank-label" class="property-label"><g:message code="broker.imeRank.label"
                                                                           default="Ime Rank"/></span>

                <span class="property-value" aria-labelledby="imeRank-label"><g:fieldValue bean="${brokerInstance}"
                                                                                           field="imeRank"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.imeOrdinaryPoint}">
            <li class="fieldcontain">
                <span id="imeOrdinaryPoint-label" class="property-label"><g:message code="broker.imeOrdinaryPoint.label"
                                                                                    default="Ime Ordinary Point"/></span>

                <span class="property-value" aria-labelledby="imeOrdinaryPoint-label"><g:fieldValue
                        bean="${brokerInstance}" field="imeOrdinaryPoint"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.imeEncouragingPoint}">
            <li class="fieldcontain">
                <span id="imeEncouragingPoint-label" class="property-label"><g:message
                        code="broker.imeEncouragingPoint.label" default="Ime Encouraging Point"/></span>

                <span class="property-value" aria-labelledby="imeEncouragingPoint-label"><g:fieldValue
                        bean="${brokerInstance}" field="imeEncouragingPoint"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.brokerBranches}">
            <li class="fieldcontain">
                <span id="brokerBranches-label" class="property-label"><g:message code="broker.brokerBranches.label"
                                                                                  default="Broker Branches"/></span>

                <g:each in="${brokerInstance.brokerBranches}" var="b">
                    <span class="property-value" aria-labelledby="brokerBranches-label"><g:link
                            controller="brokerBranch" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.brokerInvestmentFounds}">
            <li class="fieldcontain">
                <span id="brokerInvestmentFounds-label" class="property-label"><g:message
                        code="broker.brokerInvestmentFounds.label" default="Broker Investment Founds"/></span>

                <g:each in="${brokerInstance.brokerInvestmentFounds}" var="b">
                    <span class="property-value" aria-labelledby="brokerInvestmentFounds-label"><g:link
                            controller="brokerInvestmentFund" action="show"
                            id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.brokerLicenses}">
            <li class="fieldcontain">
                <span id="brokerLicenses-label" class="property-label"><g:message code="broker.brokerLicenses.label"
                                                                                  default="Broker Licenses"/></span>

                <g:each in="${brokerInstance.brokerLicenses}" var="b">
                    <span class="property-value" aria-labelledby="brokerLicenses-label"><g:link
                            controller="brokerLicense" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.brokerMembers}">
            <li class="fieldcontain">
                <span id="brokerMembers-label" class="property-label"><g:message code="broker.brokerMembers.label"
                                                                                 default="Broker Members"/></span>

                <g:each in="${brokerInstance.brokerMembers}" var="b">
                    <span class="property-value" aria-labelledby="brokerMembers-label"><g:link controller="brokerMember"
                                                                                               action="show"
                                                                                               id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.brokerPortfolios}">
            <li class="fieldcontain">
                <span id="brokerPortfolios-label" class="property-label"><g:message code="broker.brokerPortfolios.label"
                                                                                    default="Broker Portfolios"/></span>

                <g:each in="${brokerInstance.brokerPortfolios}" var="b">
                    <span class="property-value" aria-labelledby="brokerPortfolios-label"><g:link
                            controller="brokerPortfolio" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.brokerShareholders}">
            <li class="fieldcontain">
                <span id="brokerShareholders-label" class="property-label"><g:message
                        code="broker.brokerShareholders.label" default="Broker Shareholders"/></span>

                <g:each in="${brokerInstance.brokerShareholders}" var="b">
                    <span class="property-value" aria-labelledby="brokerShareholders-label"><g:link
                            controller="brokerShareholder" action="show"
                            id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.brokerTradingStations}">
            <li class="fieldcontain">
                <span id="brokerTradingStations-label" class="property-label"><g:message
                        code="broker.brokerTradingStations.label" default="Broker Trading Stations"/></span>

                <g:each in="${brokerInstance.brokerTradingStations}" var="b">
                    <span class="property-value" aria-labelledby="brokerTradingStations-label"><g:link
                            controller="brokerTradingStation" action="show"
                            id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.centralOfficeFaxes}">
            <li class="fieldcontain">
                <span id="centralOfficeFaxes-label" class="property-label"><g:message
                        code="broker.centralOfficeFaxes.label" default="Central Office Faxes"/></span>

                <span class="property-value" aria-labelledby="centralOfficeFaxes-label"><g:fieldValue
                        bean="${brokerInstance}" field="centralOfficeFaxes"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.centralOfficePhones}">
            <li class="fieldcontain">
                <span id="centralOfficePhones-label" class="property-label"><g:message
                        code="broker.centralOfficePhones.label" default="Central Office Phones"/></span>

                <span class="property-value" aria-labelledby="centralOfficePhones-label"><g:fieldValue
                        bean="${brokerInstance}" field="centralOfficePhones"/></span>

            </li>
        </g:if>

        <g:if test="${brokerInstance?.institutions}">
            <li class="fieldcontain">
                <span id="institutions-label" class="property-label"><g:message code="broker.institutions.label"
                                                                                default="Institutions"/></span>

                <g:each in="${brokerInstance.institutions}" var="i">
                    <span class="property-value" aria-labelledby="institutions-label"><g:link controller="institution"
                                                                                              action="show"
                                                                                              id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${brokerInstance?.id}"/>
            <g:link class="edit" action="edit" id="${brokerInstance?.id}"><g:message code="default.button.edit.label"
                                                                                     default="Edit"/></g:link>
            <g:actionSubmit class="btn btn-default" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
