<%@ page import="alms.OpenExamPolicy" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'openExamPolicy.label', default: 'OpenExamPolicy')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<script type="text/javascript" charset="utf-8">
    var policyTable;

    $(document).ready(function () {
        policyTable = $('#policy').dataTable({
            "bServerSide": true,
            "bFilter": true,
            "sAjaxSource": "<g:createLink action="jsonList" params="${[openExamId:openExamId]}"/>",
            "aoColumns": [
                {
                    "bSortable": false,
                    "sClass": "nowrap minimum-width"
                }, null, null, null, null]
        });
    });
</script>
%{--todo mtb present checkbox--}%
<legend><g:message code="openExamPolicy.list" default="Policy List"></g:message></legend>

<div class="well">
    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
           id="policy">
        <thead>
        <tr>

            <th></th>

            <th><g:message code="openExamPolicy.title" default="title"/></th>

            <th><g:message code="openExamPolicy.personGroup" default="personGroup"/></th>

            <th><g:message code="openExamPolicy.price" default="price"/></th>

            <th><g:message code="openExamPolicy.discountPercentage" default="discountPercentage"/></th>


        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <g:link class="btn btn-default" action="create" id="${openExamId}"><g:message code="default.new.label"
                                                                                args="[entityName]"/></g:link>
</div>
</body>
</html>
