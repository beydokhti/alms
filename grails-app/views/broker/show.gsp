<%@ page import="alms.Broker" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}"/>
    <style>
    .col-md-3 {
        height: 30px
    }

    .col-md-12 {
        height: 30px
    }
    </style>

</head>

<body>

<div id="show-broker" class="content scaffold-show" role="main">
    <legend><g:message code="default.show.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="alert alert-success" role="alert">${flash.message}</div>
    </g:if>
%{--<ol class="property-list broker">--}%

    <g:if test="${brokerInstance?.brokerPersianName}">
    %{--<li class="fieldcontain">--}%
        <div id="brokerPersianName-label" class="col-md-3"><g:message
                code="broker.brokerPersianName.label" default="Broker Persian Name"/></div>

        <div class="col-md-3" aria-labelledby="brokerPersianName-label"><g:fieldValue
                bean="${brokerInstance}" field="brokerPersianName"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.brokerLatinName}">
    %{--<li class="fieldcontain">--}%
        <div id="brokerLatinName-label" class="col-md-3"><g:message code="broker.brokerLatinName.label"
                                                                    default="Broker Latin Name"/></div>

        <div class="col-md-3" aria-labelledby="brokerLatinName-label"><g:fieldValue
                bean="${brokerInstance}" field="brokerLatinName"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.registerDate}">
    %{--<li class="fieldcontain">--}%
        <div id="registerDate-label" class="col-md-3"><g:message code="broker.registerDate.label"
                                                                 default="Register Date"/></div>

        <div class="col-md-3" aria-labelledby="registerDate-label"><g:formatDate
                date="${brokerInstance?.registerDate}"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.registerNo}">
    %{--<li class="fieldcontain">--}%
        <div id="registerNo-label" class="col-md-3"><g:message code="broker.registerNo.label"
                                                               default="Register No"/></div>

        <div class="col-md-3" aria-labelledby="registerNo-label"><g:fieldValue bean="${brokerInstance}"
                                                                               field="registerNo"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.registerLocation}">
    %{--<li class="fieldcontain">--}%
        <div id="registerLocation-label" class="col-md-3"><g:message code="broker.registerLocation.label"
                                                                     default="Register Location"/></div>

        <div class="col-md-3" aria-labelledby="registerLocation-label"><g:fieldValue
                bean="${brokerInstance}" field="registerLocation"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.seoRegisterDate}">
    %{--<li class="fieldcontain">--}%
        <div id="seoRegisterDate-label" class="col-md-3"><g:message code="broker.seoRegisterDate.label"
                                                                    default="Seo Register Date"/></div>

        <div class="col-md-3" aria-labelledby="seoRegisterDate-label"><g:formatDate
                date="${brokerInstance?.seoRegisterDate}"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.seoRegisterNo}">
    %{--<li class="fieldcontain">--}%
        <div id="seoRegisterNo-label" class="col-md-3"><g:message code="broker.seoRegisterNo.label"
                                                                  default="Seo Register No"/></div>

        <div class="col-md-3" aria-labelledby="seoRegisterNo-label"><g:fieldValue
                bean="${brokerInstance}" field="seoRegisterNo"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.clubMembershipNo}">
    %{--<li class="fieldcontain">--}%
        <div id="clubMembershipNo-label" class="col-md-3"><g:message code="broker.clubMembershipNo.label"
                                                                     default="Club Membership No"/></div>

        <div class="col-md-3" aria-labelledby="clubMembershipNo-label"><g:fieldValue
                bean="${brokerInstance}" field="clubMembershipNo"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.clubMembershipDate}">
    %{--<li class="fieldcontain">--}%
        <div id="clubMembershipDate-label" class="col-md-3"><g:message
                code="broker.clubMembershipDate.label" default="Club Membership Date"/></div>

        <div class="col-md-3" aria-labelledby="clubMembershipDate-label"><g:formatDate
                date="${brokerInstance?.clubMembershipDate}"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.registeredCapital}">
    %{--<li class="fieldcontain">--}%
        <div id="registeredCapital-label" class="col-md-3"><g:message
                code="broker.registeredCapital.label" default="Registered Capital"/></div>

        <div class="col-md-3" aria-labelledby="registeredCapital-label"><g:fieldValue
                bean="${brokerInstance}" field="registeredCapital"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.paidCapital}">
    %{--<li class="fieldcontain">--}%
        <div id="paidCapital-label" class="col-md-3"><g:message code="broker.paidCapital.label"
                                                                default="Paid Capital"/></div>

        <div class="col-md-3" aria-labelledby="paidCapital-label"><g:fieldValue bean="${brokerInstance}"
                                                                                field="paidCapital"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.sharesNumber}">
    %{--<li class="fieldcontain">--}%
        <div id="sharesNumber-label" class="col-md-3"><g:message code="broker.sharesNumber.label"
                                                                 default="Shares Number"/></div>

        <div class="col-md-3" aria-labelledby="sharesNumber-label"><g:fieldValue bean="${brokerInstance}"
                                                                                 field="sharesNumber"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.financialYearEndMonth}">
    %{--<li class="fieldcontain">--}%
        <div id="financialYearEndMonth-label" class="col-md-3"><g:message
                code="broker.financialYearEndMonth.label" default="Financial Year End Month"/></div>

        <div class="col-md-3" aria-labelledby="financialYearEndMonth-label"><g:fieldValue
                bean="${brokerInstance}" field="financialYearEndMonth"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.financialYearEndDay}">
    %{--<li class="fieldcontain">--}%
        <div id="financialYearEndDay-label" class="col-md-3"><g:message
                code="broker.financialYearEndDay.label" default="Financial Year End Day"/></div>

        <div class="col-md-3" aria-labelledby="financialYearEndDay-label"><g:fieldValue
                bean="${brokerInstance}" field="financialYearEndDay"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.nationalCode}">
    %{--<li class="fieldcontain">--}%
        <div id="nationalCode-label" class="col-md-3"><g:message code="broker.nationalCode.label"
                                                                 default="National Code"/></div>

        <div class="col-md-3" aria-labelledby="nationalCode-label"><g:fieldValue bean="${brokerInstance}"
                                                                                 field="nationalCode"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.economicCode}">
    %{--<li class="fieldcontain">--}%
        <div id="economicCode-label" class="col-md-3"><g:message code="broker.economicCode.label"
                                                                 default="Economic Code"/></div>

        <div class="col-md-3" aria-labelledby="economicCode-label"><g:fieldValue bean="${brokerInstance}"
                                                                                 field="economicCode"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.centralOfficeAddress}">
    %{--<li class="fieldcontain">--}%
        <div id="centralOfficeAddress-label" class="col-md-3"><g:message
                code="broker.centralOfficeAddress.label" default="Central Office Address"/></div>

        <div class="col-md-3" aria-labelledby="centralOfficeAddress-label"><g:fieldValue
                bean="${brokerInstance}" field="centralOfficeAddress"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.centralOfficePostalCode}">
    %{--<li class="fieldcontain">--}%
        <div id="centralOfficePostalCode-label" class="col-md-3"><g:message
                code="broker.centralOfficePostalCode.label" default="Central Office Postal Code"/></div>

        <div class="col-md-3" aria-labelledby="centralOfficePostalCode-label"><g:fieldValue
                bean="${brokerInstance}" field="centralOfficePostalCode"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.POBox}">
    %{--<li class="fieldcontain">--}%
        <div id="POBox-label" class="col-md-3"><g:message code="broker.POBox.label"
                                                          default="POB ox"/></div>

        <div class="col-md-3" aria-labelledby="POBox-label"><g:fieldValue bean="${brokerInstance}"
                                                                          field="POBox"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.website}">
    %{--<li class="fieldcontain">--}%
        <div id="website-label" class="col-md-3"><g:message code="broker.website.label"
                                                            default="Website"/></div>

        <div class="col-md-3" aria-labelledby="website-label"><g:fieldValue bean="${brokerInstance}"
                                                                            field="website"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.email}">
    %{--<li class="fieldcontain">--}%
        <div id="email-label" class="col-md-3"><g:message code="broker.email.label"
                                                          default="Email"/></div>

        <div class="col-md-3" aria-labelledby="email-label"><g:fieldValue bean="${brokerInstance}"
                                                                          field="email"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.tseRank}">
    %{--<li class="fieldcontain">--}%
        <div id="tseRank-label" class="col-md-3"><g:message code="broker.tseRank.label"
                                                            default="Tse Rank"/></div>

        <div class="col-md-3" aria-labelledby="tseRank-label"><g:fieldValue bean="${brokerInstance}"
                                                                            field="tseRank"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.tseOrdinaryPoint}">
    %{--<li class="fieldcontain">--}%
        <div id="tseOrdinaryPoint-label" class="col-md-3"><g:message code="broker.tseOrdinaryPoint.label"
                                                                     default="Tse Ordinary Point"/></div>

        <div class="col-md-3" aria-labelledby="tseOrdinaryPoint-label"><g:fieldValue
                bean="${brokerInstance}" field="tseOrdinaryPoint"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.tseEncouragingPoint}">
    %{--<li class="fieldcontain">--}%
        <div id="tseEncouragingPoint-label" class="col-md-3"><g:message
                code="broker.tseEncouragingPoint.label" default="Tse Encouraging Point"/></div>

        <div class="col-md-3" aria-labelledby="tseEncouragingPoint-label"><g:fieldValue
                bean="${brokerInstance}" field="tseEncouragingPoint"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.imeRank}">
    %{--<li class="fieldcontain">--}%
        <div id="imeRank-label" class="col-md-3"><g:message code="broker.imeRank.label"
                                                            default="Ime Rank"/></div>

        <div class="col-md-3" aria-labelledby="imeRank-label"><g:fieldValue bean="${brokerInstance}"
                                                                            field="imeRank"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.imeOrdinaryPoint}">
    %{--<li class="fieldcontain">--}%
        <div id="imeOrdinaryPoint-label" class="col-md-3"><g:message code="broker.imeOrdinaryPoint.label"
                                                                     default="Ime Ordinary Point"/></div>

        <div class="col-md-3" aria-labelledby="imeOrdinaryPoint-label"><g:fieldValue
                bean="${brokerInstance}" field="imeOrdinaryPoint"/></div>

    %{--</li>--}%
    </g:if>

    <g:if test="${brokerInstance?.imeEncouragingPoint}">
    %{--<li class="fieldcontain">--}%
        <div id="imeEncouragingPoint-label" class="col-md-3"><g:message
                code="broker.imeEncouragingPoint.label" default="Ime Encouraging Point"/></div>

        <div class="col-md-3" aria-labelledby="imeEncouragingPoint-label"><g:fieldValue
                bean="${brokerInstance}" field="imeEncouragingPoint"/></div>

    %{--</li>--}%
    </g:if>

%{--<g:if test="${brokerInstance?.brokerBranches}">--}%
%{--<li class="fieldcontain">--}%
%{--<div id="brokerBranches-label" class="col-md-3"><g:message code="broker.brokerBranches.label"--}%
%{--default="Broker Branches"/></div>--}%

%{--<g:each in="${brokerInstance.brokerBranches}" var="b">--}%
%{--<div class="col-md-3" aria-labelledby="brokerBranches-label"><g:link--}%
%{--controller="brokerBranch" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></div>--}%
%{--</g:each>--}%

%{--</li>--}%
%{--</g:if>--}%

%{--<g:if test="${brokerInstance?.brokerInvestmentFounds}">--}%
%{--<li class="fieldcontain">--}%
%{--<div id="brokerInvestmentFounds-label" class="col-md-3"><g:message--}%
%{--code="broker.brokerInvestmentFounds.label" default="Broker Investment Founds"/></div>--}%

%{--<g:each in="${brokerInstance.brokerInvestmentFounds}" var="b">--}%
%{--<div class="col-md-3" aria-labelledby="brokerInvestmentFounds-label"><g:link--}%
%{--controller="brokerInvestmentFund" action="show"--}%
%{--id="${b.id}">${b?.encodeAsHTML()}</g:link></div>--}%
%{--</g:each>--}%

%{--</li>--}%
%{--</g:if>--}%

%{--<g:if test="${brokerInstance?.brokerLicenses}">--}%
%{--<li class="fieldcontain">--}%
%{--<div id="brokerLicenses-label" class="col-md-3"><g:message code="broker.brokerLicenses.label"--}%
%{--default="Broker Licenses"/></div>--}%

%{--<g:each in="${brokerInstance.brokerLicenses}" var="b">--}%
%{--<div class="col-md-3" aria-labelledby="brokerLicenses-label"><g:link--}%
%{--controller="brokerLicense" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></div>--}%
%{--</g:each>--}%

%{--</li>--}%
%{--</g:if>--}%

%{--<g:if test="${brokerInstance?.brokerMembers}">--}%
%{--<li class="fieldcontain">--}%
%{--<div id="brokerMembers-label" class="col-md-3"><g:message code="broker.brokerMembers.label"--}%
%{--default="Broker Members"/></div>--}%

%{--<g:each in="${brokerInstance.brokerMembers}" var="b">--}%
%{--<div class="col-md-3" aria-labelledby="brokerMembers-label"><g:link controller="brokerMember"--}%
%{--action="show"--}%
%{--id="${b.id}">${b?.encodeAsHTML()}</g:link></div>--}%
%{--</g:each>--}%

%{--</li>--}%
%{--</g:if>--}%

%{--<g:if test="${brokerInstance?.brokerPortfolios}">--}%
%{--<li class="fieldcontain">--}%
%{--<div id="brokerPortfolios-label" class="col-md-3"><g:message code="broker.brokerPortfolios.label"--}%
%{--default="Broker Portfolios"/></div>--}%

%{--<g:each in="${brokerInstance.brokerPortfolios}" var="b">--}%
%{--<div class="col-md-3" aria-labelledby="brokerPortfolios-label"><g:link--}%
%{--controller="brokerPortfolio" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></div>--}%
%{--</g:each>--}%

%{--</li>--}%
%{--</g:if>--}%

%{--<g:if test="${brokerInstance?.brokerShareholders}">--}%
%{--<li class="fieldcontain">--}%
%{--<div id="brokerShareholders-label" class="col-md-3"><g:message--}%
%{--code="broker.brokerShareholders.label" default="Broker Shareholders"/></div>--}%

%{--<g:each in="${brokerInstance.brokerShareholders}" var="b">--}%
%{--<div class="col-md-3" aria-labelledby="brokerShareholders-label"><g:link--}%
%{--controller="brokerShareholder" action="show"--}%
%{--id="${b.id}">${b?.encodeAsHTML()}</g:link></div>--}%
%{--</g:each>--}%

%{--</li>--}%
%{--</g:if>--}%

%{--<g:if test="${brokerInstance?.brokerTradingStations}">--}%
%{--<li class="fieldcontain">--}%
%{--<div id="brokerTradingStations-label" class="col-md-3"><g:message--}%
%{--code="broker.brokerTradingStations.label" default="Broker Trading Stations"/></div>--}%

%{--<g:each in="${brokerInstance.brokerTradingStations}" var="b">--}%
%{--<div class="col-md-3" aria-labelledby="brokerTradingStations-label"><g:link--}%
%{--controller="brokerTradingStation" action="show"--}%
%{--id="${b.id}">${b?.encodeAsHTML()}</g:link></div>--}%
%{--</g:each>--}%

%{--</li>--}%
%{--</g:if>--}%

%{--<g:if test="${brokerInstance?.centralOfficeFaxes}">--}%
%{--<li class="fieldcontain">--}%
%{--<div id="centralOfficeFaxes-label" class="col-md-3"><g:message--}%
%{--code="broker.centralOfficeFaxes.label" default="Central Office Faxes"/></div>--}%

%{--<div class="col-md-3" aria-labelledby="centralOfficeFaxes-label"><g:fieldValue--}%
%{--bean="${brokerInstance}" field="centralOfficeFaxes"/></div>--}%

%{--</li>--}%
%{--</g:if>--}%

%{--<g:if test="${brokerInstance?.centralOfficePhones}">--}%
%{--<li class="fieldcontain">--}%
%{--<div id="centralOfficePhones-label" class="col-md-3"><g:message--}%
%{--code="broker.centralOfficePhones.label" default="Central Office Phones"/></div>--}%

%{--<div class="col-md-3" aria-labelledby="centralOfficePhones-label"><g:fieldValue--}%
%{--bean="${brokerInstance}" field="centralOfficePhones"/></div>--}%

%{--</li>--}%
%{--</g:if>--}%

%{--<g:if test="${brokerInstance?.institutions}">--}%
%{--%{--<li class="fieldcontain">--}%
%{--<div id="institutions-label" class="col-md-3"><g:message code="broker.institutions.label"--}%
%{--default="Institutions"/></div>--}%

%{--<g:each in="${brokerInstance.institutions}" var="i">--}%
%{--<div class="col-md-3" aria-labelledby="institutions-label"><g:link controller="institution"--}%
%{--action="show"--}%
%{--id="${i.id}">${i?.encodeAsHTML()}</g:link></div>--}%
%{--</g:each>--}%

%{--%{--</li>--}%
%{--</g:if>--}%

%{--</ol>--}%
    <g:if test="${readOnly == false}">
        <div class="col-md-12" style="">
        <g:form>
            <fieldset class="form-horizontal">
            <g:hiddenField name="id" value="${brokerInstance?.id}"/>
            <g:link class="btn btn-default" action="edit" id="${brokerInstance?.id}"><g:message
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
