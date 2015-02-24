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
                "sAjaxSource": "<g:createLink action="jsonList" params="brokerId:${brokerId}"/>",
                "aoColumns": [
                    {"bSortable": false, "sClass": "nowrap minimum-width"}, null, null, null, null, null, null]
            });
        });
    </script>

    <legend><g:message code="brokerShareholder.list" default="Broker List"></g:message></legend>

    <div class="well">
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
               id="broker">
            <thead>
            <tr>

                <th></th>

                <th><g:message code="brokerShareholder.shareholderName" default="Persian Name"/></th>

                <th><g:message code="brokerShareholder.ownershipType" default="Latin Name"/></th>

                <th><g:message code="brokerShareholder.ownershipPercent" default="Register No"/></th>

                <th><g:message code="brokerShareholder.sharesCount" default="Register Location"/></th>

                <th><g:message code="brokerShareholder.representativeOnBoard" default="Seo Register No"/></th>

                <th><g:message code="brokerShareholder.description" default="Club MemberShip No"/></th>

            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <g:link class="btn" action="create" id="${brokerId}"><g:message code="default.new.label"  args="[entityName]"/></g:link>
    </div>

</div>

</body>
</html>
