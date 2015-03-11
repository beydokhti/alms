<%@ page import="alms.BrokerLicense" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerLicense.label', default: 'BrokerLicense')}"/>
</head>

<body>
<script type="text/javascript" charset="utf-8">
    var brokerTable;

    $(document).ready(function () {
        brokerTable = $('#brokerLicense').dataTable({
            "bServerSide": true,
            "bFilter": true,
            "sAjaxSource": "<g:createLink action="jsonList" params="${[brokerId:brokerId]}"/>",
            "aoColumns": [
                {"bSortable": false, "sClass": "nowrap minimum-width"}, null, null, null, null, null, null, null]
        });
    });
</script>
%{--todo mtb present checkbox--}%
<legend><g:message code="brokerLicense.list" default="License List"></g:message></legend>

<div class="well">
    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
           id="brokerLicense">
        <thead>
        <tr>

            <th></th>

            <th><g:message code="BrokerLicense.displayOrder" default="displayOrder"/></th>

            <th><g:message code="BrokerLicense.title1" default="title1"/></th>

            <th><g:message code="BrokerLicense.title2" default="title2"/></th>

            <th><g:message code="BrokerLicense.hasLicense" default="hasLicense"/></th>

            <th><g:message code="BrokerLicense.licenseNumber" default="licenseNumber"/></th>

            <th><g:message code="BrokerLicense.licenseDate" default="licenseDate"/></th>

            <th><g:message code="BrokerLicense.licenseExpiry" default="licenseExpiry"/></th>

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
