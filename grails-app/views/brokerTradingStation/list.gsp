<%@ page import="alms.BrokerTradingStation" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerTradingStation.label', default: 'BrokerTradingStation')}"/>
</head>

<body>
<script type="text/javascript" charset="utf-8">
    var brokerTable;

    $(document).ready(function () {
        brokerTable = $('#brokerTradingStation').dataTable({
            "bServerSide": true,
            "bFilter": true,
            "sAjaxSource": "<g:createLink action="jsonList" params="${[brokerId:brokerId]}"/>",
            "aoColumns": [
                {"bSortable": false, "sClass": "nowrap minimum-width"}, null, null, null, null, null, null]
        });
    });
</script>
%{--todo mtb present checkbox--}%
<legend><g:message code="brokerTradingStation.list" default="Branches List"></g:message></legend>

<div class="well">
    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
           id="brokerTradingStation">
        <thead>
        <tr>

            <th></th>

            <th><g:message code="BrokerTradingStation.city" default="city"/></th>

            <th><g:message code="BrokerTradingStation.stationType" default="stationType"/></th>

            <th><g:message code="BrokerTradingStation.activities" default="activities"/></th>

            <th><g:message code="BrokerTradingStation.trader" default="trader"/></th>

            <th><g:message code="BrokerTradingStation.phone" default="phone"/></th>

            <th><g:message code="BrokerTradingStation.address" default="address"/></th>

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
