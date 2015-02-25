<%@ page import="alms.BrokerPortfolio" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio')}"/>
</head>

<body>
<script type="text/javascript" charset="utf-8">
    var brokerTable;

    $(document).ready(function () {
        brokerTable = $('#brokerPortfolio').dataTable({
            "bServerSide": true,
            "bFilter": true,
            "sAjaxSource": "<g:createLink action="jsonList" params="${[brokerId:brokerId]}"/>",
            "aoColumns": [
                {"bSortable": false, "sClass": "nowrap minimum-width"}, null, null, null]
        });
    });
</script>
%{--todo mtb present checkbox--}%
<legend><g:message code="brokerPortfolio.list" default="Branches List"></g:message></legend>

<div class="well">
    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
           id="brokerPortfolio">
        <thead>
        <tr>

            <th></th>

            <th><g:message code="BrokerPortfolio.countOfContract" default="countOfContract"/></th>

            <th><g:message code="BrokerPortfolio.sumOfContract" default="sumOfContract"/></th>

            <th><g:message code="BrokerPortfolio.countOfConsultantContract" default="countOfConsultantContract"/></th>

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
