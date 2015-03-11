<%@ page import="alms.BrokerMember" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerMember.label', default: 'BrokerMember')}"/>
</head>

<body>
<script type="text/javascript" charset="utf-8">
    var brokerTable;

    $(document).ready(function () {
        brokerTable = $('#brokerMember').dataTable({
            "bServerSide": true,
            "bFilter": true,
            "sAjaxSource": "<g:createLink action="jsonList" params="${[brokerId:brokerId]}"/>",
            "aoColumns": [
                {
                    "bSortable": false,
                    "sClass": "nowrap minimum-width"
                }, null, null, null, null, null, null, null, null, null, null, null]
        });
    });
</script>
%{--todo mtb present checkbox--}%
<legend><g:message code="brokerMember.list" default="Members List"></g:message></legend>

<div class="well">
    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
           id="brokerMember">
        <thead>
        <tr>

            <th></th>

            <th><g:message code="BrokerMember.name" default="name"/></th>

            <th><g:message code="BrokerMember.lastName" default="lastName"/></th>

            <th><g:message code="BrokerMember.sex" default="sex"/></th>

            <th><g:message code="BrokerMember.position" default="position"/></th>

            <th><g:message code="BrokerMember.startDate" default="startDate"/></th>

            <th><g:message code="BrokerMember.degree" default="degree"/></th>

            <th><g:message code="BrokerMember.field" default="field"/></th>

            <th><g:message code="BrokerMember.dateOfBirth" default="dateOfBirth"/></th>

            <th><g:message code="BrokerMember.nationalCode" default="nationalCode"/></th>

            <th><g:message code="BrokerMember.mobile" default="mobile"/></th>

            <th><g:message code="BrokerMember.email" default="email"/></th>

        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <g:link class="btn btn-default" action="create" id="${brokerId}"><g:message code="default.new.label"
                                                                    args="[entityName]"/></g:link>
   <g:link class="btn btn-default" action="assign" id="${brokerId}"><g:message code="default.assign.label"
                                                                    args="[entityName]"/></g:link>
</div>
</body>
</html>
