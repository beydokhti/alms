<%@ page import="alms.ObtainedCertificate" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<script type="text/javascript" charset="utf-8">
    var obcerTable;

    $(document).ready(function () {
        obcerTable = $('#obtainedCertificate').dataTable({
            "bServerSide": true,
            "bFilter": true,
            "sAjaxSource": "<g:createLink action="jsonList" params="${[personId:personId]}"/>",
            "aoColumns": [
                {"bSortable": false, "sClass": "nowrap minimum-width"}, null, null]
        });
    });
</script>
%{--todo mtb present checkbox--}%
<legend><g:message code="obtainedCertificate.list" default="Certificate List"></g:message></legend>

<div class="well">
    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
           id="obtainedCertificate">
        <thead>
        <tr>

            <th></th>

            <th><g:message code="obtainedCertificate.certificate" default="certificate"/></th>

            <th><g:message code="obtainedCertificate.obtainedDate" default="obtainedDate"/></th>

        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <g:link class="btn btn-default" action="create" id="${personId}"><g:message code="default.new.label"
                                                                    args="[entityName]"/></g:link>
</div>
</body>
</html>
