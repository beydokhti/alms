<%@ page import="alms.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}"/>
    %{--<title><g:message code="default.list.label" args="[entityName]" /></title>--}%

</head>

<body>

<div id="list-broker" class="content scaffold-list" role="main">
    <script type="text/javascript" charset="utf-8">
        var userTable;

        $(document).ready(function () {
            userTable = $('#user').dataTable({
//                "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
//                "sPaginationType": "bootstrap",
//                "oLanguage": {
                %{--"sLengthMenu": "_MENU_ <g:message code='records-per-page' default="Record per Page"/>",--}%
                %{--"sSearch": "<g:message code='find' default="Find"/>:",--}%
                %{--"sInfo": "<g:message code='showing' default="Showing"/> _START_ <g:message code='to'/> _END_ <g:message code='from'/> _TOTAL_"--}%
//                },
                "bServerSide": true,
                "bFilter": true,
                "sAjaxSource": "<g:createLink action="jsonList"/>",
                "aoColumns": [
                    {"bSortable": false, "sClass": "nowrap minimum-width"}, null, null, null, null, null]
            });
        });
    </script>

    <legend><g:message code="user.list" default="User List"></g:message></legend>

    <div class="well">
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
               id="user">
            <thead>
            <tr>

                <th></th>

                <th><g:message code="User.username" default="username"/></th>

                <th><g:message code="User.enabled" default="enabled"/></th>

                <th><g:message code="User.accountExpired" default="accountExpired"/></th>

                <th><g:message code="User.accountLocked" default="accountLocked"/></th>

                <th><g:message code="User.passwordExpired" default="passwordExpired"/></th>

            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

</div>
</body>
</html>
