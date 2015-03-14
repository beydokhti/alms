<%@ page import="alms.InstitutionMember" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'institutionMember.label', default: 'InstitutionMember')}"/>
</head>

<body>
<script type="text/javascript" charset="utf-8">
    var institutionTable;

    $(document).ready(function () {
        institutionTable = $('#institutionMember').dataTable({
            "bServerSide": true,
            "bFilter": true,
            "sAjaxSource": "<g:createLink action="jsonList" params="${[institutionId:institutionId]}"/>",
            "aoColumns": [
                {
                    "bSortable": false,
                    "sClass": "nowrap minimum-width"
                }, null, null, null, null, null, null, null, null, null, null]
        });
    });
</script>
%{--todo mtb present checkbox--}%
<legend><g:message code="institutionMember.list" default="Members List"></g:message></legend>

<div class="well">
    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
           id="institutionMember">
        <thead>
        <tr>

            <th></th>

            <th><g:message code="InstitutionMember.name" default="name"/></th>

            <th><g:message code="InstitutionMember.lastName" default="lastName"/></th>

            <th><g:message code="InstitutionMember.sex" default="sex"/></th>

            <th><g:message code="InstitutionMember.startDate" default="startDate"/></th>

            <th><g:message code="InstitutionMember.degree" default="degree"/></th>

            <th><g:message code="InstitutionMember.field" default="field"/></th>

            <th><g:message code="InstitutionMember.dateOfBirth" default="dateOfBirth"/></th>

            <th><g:message code="InstitutionMember.nationalCode" default="nationalCode"/></th>

            <th><g:message code="InstitutionMember.mobile" default="mobile"/></th>

            <th><g:message code="InstitutionMember.email" default="email"/></th>

        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <g:link class="btn btn-default" action="create" id="${institutionId}"><g:message code="default.new.label"
                                                                    args="[entityName]"/></g:link>
   <g:link class="btn btn-default" action="assign" id="${institutionId}"><g:message code="default.assign.label"
                                                                    args="[entityName]"/></g:link>
</div>
</body>
</html>
