<%@ page import="alms.Institution" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'institution.label', default: 'Institution')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<div id="list-institution" class="content scaffold-list" role="main">
    <script type="text/javascript" charset="utf-8">
        var institutionTable;

        $(document).ready(function () {
            institutionTable = $('#institution').dataTable({
                "bServerSide": true,
                "bFilter": true,
                "sAjaxSource": "<g:createLink action="jsonList"/>",
                "aoColumns": [
                    {"bSortable": false, "sClass": "nowrap minimum-width"}, null, null, null, null, null, null]
            });
        });
    </script>

    <legend><g:message code="institution.list" default="Institution List"></g:message></legend>

    <div class="well">
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
               id="institution">
            <thead>
            <tr>

                <th></th>


                <th><g:message code="institution.name" default="Name"/></th>

                <th><g:message code="institution.nationalCode" default="National Code"/></th>

                <th><g:message code="institution.registerNumber" default="Register No"/></th>

                <th><g:message code="institution.address" default="address"/></th>

                <th><g:message code="institution.fax" default="fax"/></th>

                <th><g:message code="institution.email" default="email"/></th>

            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <g:link class="btn" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link>
    </div>

</div>
</body>
</html>
