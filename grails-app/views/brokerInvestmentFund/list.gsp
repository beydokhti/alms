<%@ page import="alms.BrokerInvestmentFund" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerInvestmentFund.label', default: 'BrokerInvestmentFund')}"/>
</head>

<body>
<script type="text/javascript" charset="utf-8">
    var brokerTable;

    $(document).ready(function () {
        brokerTable = $('#brokerInvestmentFund').dataTable({
            "bServerSide": true,
            "bFilter": true,
            "sAjaxSource": "<g:createLink action="jsonList" params="${[brokerId:brokerId]}"/>",
            "aoColumns": [
                {"bSortable": false, "sClass": "nowrap minimum-width"}, null, null, null, null, null, null, null, null, null]
        });
    });
</script>
%{--todo mtb present checkbox--}%
<legend><g:message code="brokerInvestmentFund.list" default="Investment Fund List"></g:message></legend>

<div class="well">
    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
           id="brokerInvestmentFund">
        <thead>
        <tr>

            <th></th>

            <th><g:message code="BrokerInvestmentFund.fundName" default="fundName"/></th>

            <th><g:message code="BrokerInvestmentFund.startingDate" default="startingDate"/></th>

            <th><g:message code="BrokerInvestmentFund.typeAndScale" default="typeAndScale"/></th>

            <th><g:message code="BrokerInvestmentFund.fundManager" default="fundManager"/></th>

            <th><g:message code="BrokerInvestmentFund.fundCustodian" default="fundCustodian"/></th>

            <th><g:message code="BrokerInvestmentFund.agencyFund" default="agencyFund"/></th>

            <th><g:message code="BrokerInvestmentFund.fundRegisterManager" default="fundRegisterManager"/></th>

            <th><g:message code="BrokerInvestmentFund.liquidityGuaranteeFund" default="liquidityGuaranteeFund"/></th>

            <th><g:message code="BrokerInvestmentFund.investmentManager" default="investmentManager"/></th>

        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <g:link class="btn" action="create" id="${brokerId}"><g:message code="default.new.label"
                                                                    args="[entityName]"/></g:link>
</div>
</body>
</html>
