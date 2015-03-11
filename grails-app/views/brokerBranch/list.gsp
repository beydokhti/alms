<%@ page import="alms.BrokerBranch" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerBranch.label', default: 'BrokerBranch')}"/>
</head>

<body>
<script type="text/javascript" charset="utf-8">
    var brokerTable;

    $(document).ready(function () {
        brokerTable = $('#brokerBranches').dataTable({
            "bServerSide": true,
            "bFilter": true,
            "sAjaxSource": "<g:createLink action="jsonList" params="${[brokerId:brokerId]}"/>",
            "aoColumns": [
                {
                    "bSortable": false,
                    "sClass": "nowrap minimum-width"
                }, null, null, null, null, null, null, null, null, null, null]
        });
    });
</script>
%{--todo mtb present checkbox--}%
<legend><g:message code="brokerBranches.list" default="Branches List"></g:message></legend>

<div class="well">
    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
           id="brokerBranches">
        <thead>
        <tr>

            <th></th>

            <th><g:message code="brokerBranches.city" default="City"/></th>

            <th><g:message code="brokerBranches.branchType" default="Branch Type"/></th>

            <th><g:message code="brokerBranches.representativePerson" default="Representative Person"/></th>

            <th><g:message code="brokerBranches.personnelCount" default="Personnel Count"/></th>

            <th><g:message code="brokerBranches.tseStock" default="tse Stock"/></th>

            <th><g:message code="brokerBranches.imeStock" default="ime Stock"/></th>

            <th><g:message code="brokerBranches.energyStock" default="Energy Stock"/></th>

            <th><g:message code="brokerBranches.imeFuture" default="ime Future"/></th>

            <th><g:message code="brokerBranches.tseFuture" default="tse Future"/></th>

            <th><g:message code="brokerBranches.mutualFundAdmin" default="Mutual Fund Admin"/></th>

        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <g:link class="btn btn-default" action="create" id="${brokerId}"><g:message code="default.new.label"
                                                                    args="[entityName]"/></g:link>
</div>
</body>
</html>
