<%@ page import="alms.Certificate" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'certificate.label', default: 'Certificate')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<div id="list-certificate" class="content scaffold-list" role="main">
    <script type="text/javascript" charset="utf-8">
        var certificateTable;

        $(document).ready(function () {
            certificateTable = $('#certificate').dataTable({
                "bServerSide": true,
                "bFilter": true,
                "sAjaxSource": "<g:createLink action="jsonList"/>",
                "aoColumns": [
                    {"bSortable": false, "sClass": "nowrap minimum-width"}, null, null]
            });
        });
    </script>

    <legend><g:message code="certificate.list" default="Certificate List"></g:message></legend>

    <div class="well">
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
               id="certificate">
            <thead>
            <tr>

                <th></th>

                <th><g:message code="certificate.cerType" default="cerType"/></th>

                <th><g:message code="certificate.cerTitle" default="cerTitle"/></th>

            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <g:link class="btn btn-default" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link>
    </div>

</div>

</body>
</html>
