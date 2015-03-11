<%@ page import="alms.BrokerShareholder" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerShareholder.label', default: 'BrokerShareholder')}"/>
</head>

<body>

<div id="list-broker" class="content scaffold-list" role="main">
    <script type="text/javascript" charset="utf-8">
        var brokerTable;

        $(document).ready(function () {
            brokerTable = $('#broker').dataTable({
                "bServerSide": true,
                "bFilter": true,
                "sAjaxSource": "<g:createLink action="jsonList" params="${[brokerId:brokerId]}"/>",
                "aoColumns": [
                    {"bSortable": false, "sClass": "nowrap minimum-width"}, null, null, null, null, null, null]
            });
        });
    </script>

    <legend><g:message code="brokerShareholder.list" default="Shareholder List"></g:message></legend>

    <div class="well">
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
               id="broker">
            <thead>
            <tr>

                <th></th>

                <th><g:message code="brokerShareholder.shareholderName" default="Shareholder Name"/></th>

                <th><g:message code="brokerShareholder.ownershipType" default="Ownership Type"/></th>

                <th><g:message code="brokerShareholder.ownershipPercent" default="Ownership Percent"/></th>

                <th><g:message code="brokerShareholder.sharesCount" default="Shares Count"/></th>

                <th><g:message code="brokerShareholder.representativeOnBoard" default="Representative On Board"/></th>

                <th><g:message code="brokerShareholder.description" default="description"/></th>

            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <g:link class="btn btn-default" action="create" id="${brokerId}"><g:message code="default.new.label"
                                                                        args="[entityName]"/></g:link>
    </div>

</div>

<g:if test="${totalStock == 100}">
    <div class="alert alert-success" role="alert">
        <g:message code="brokerShareholder.totalStock.success" default="Success"/>
    </div>
</g:if>
<g:else>
    <div class="alert alert-danger" role="alert">
        <g:message code="brokerShareholder.totalStock.danger" default="Danger"/>
    </div>
</g:else>
</body>
</html>
