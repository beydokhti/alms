<%@ page import="alms.BrokerSoftware" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerSoftware.label', default: 'BrokerSoftware')}"/>
</head>

<body>
<script type="text/javascript" charset="utf-8">
    var brokerTable;

    $(document).ready(function () {
        brokerTable = $('#brokerSoftware').dataTable({
            "bServerSide": true,
            "bFilter": true,
            "sAjaxSource": "<g:createLink action="jsonList" params="${[brokerId:brokerId]}"/>",
            "aoColumns": [
                {"bSortable": false, "sClass": "nowrap minimum-width"}, null, null, null, null]
        });
    });
</script>
%{--todo mtb present checkbox--}%
<legend><g:message code="brokerSoftware.list" default="Branches List"></g:message></legend>

<div class="well">
    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
           id="brokerSoftware">
        <thead>
        <tr>

            <th></th>

            <th><g:message code="BrokerSoftware.title1" default="title1"/></th>

            <th><g:message code="BrokerSoftware.title2" default="title2"/></th>

            <th><g:message code="BrokerSoftware.companyName" default="companyName"/></th>

            <th><g:message code="BrokerSoftware.contractType" default="contractType"/></th>

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
