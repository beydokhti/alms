<%@ page import="alms.Broker" %>
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
        var brokerTable;

        $(document).ready(function () {
            brokerTable = $('#broker').dataTable({
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
                    {"bSortable": false, "sClass": "nowrap minimum-width"}, null, null, null, null, null, null]
            });
        });
    </script>

    <legend><g:message code="broker.list" default="Broker List"></g:message></legend>

    <div class="well">
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
               id="broker">
            <thead>
            <tr>

                <th></th>

                <th><g:message code="broker.brokerPersianName" default="Persian Name"/></th>

                <th><g:message code="broker.brokerLatinName" default="Latin Name"/></th>

                <th><g:message code="broker.registerNo" default="Register No"/></th>

                <th><g:message code="broker.registerLocation" default="Register Location"/></th>

                <th><g:message code="broker.seoRegisterNo" default="Seo Register No"/></th>

                <th><g:message code="broker.clubMembershipNo" default="Club MemberShip No"/></th>

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
