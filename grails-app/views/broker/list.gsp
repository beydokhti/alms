
<%@ page import="alms.Broker" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

</head>
<body>
%{--<script src="D:/Project/Broker/alms/web-app/DataTables-1.10.5/media/js/jquery.js" charset="UTF-8"></script>--}%

<a href="#list-broker" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="list-broker" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="alert alert-info" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${instanceTotal > 0}">
        %{--<script src="/alms/static/js/jquery.js" type="text/javascript" charset="UTF-8"></script>--}%
        <script src="/alms/static/js/jquery.dataTables.min.js" type="text/javascript" charset="UTF-8"></script>
        %{--<script src="/alms/static/js/jquery.dataTables.js" type="text/javascript" charset="UTF-8"></script>--}%

        <script type="text/javascript" charset="utf-8">
            var brokerTable;

            $(document).ready(function () {
                brokerTable = $('#broker').DataTable({
                    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
                    "sPaginationType": "bootstrap",
                    "oLanguage": {
                        "sLengthMenu": "_MENU_ <g:message code='records-per-page' default="Record per Page"/>",
                        "sSearch": "<g:message code='find' default="Find"/>:",
                        "sInfo": "<g:message code='showing' default="Showing"/> _START_ <g:message code='to'/> _END_ <g:message code='from'/> _TOTAL_"
                    },
                    "bServerSide": true,
                    "bFilter": true,
                    "sAjaxSource": "<g:createLink action="jsonList"/>",
                    "aoColumns": [
                        { "bSortable": false, "sClass": "nowrap minimum-width"}, null, null, null, null, null, null, null]
                });
            });
//            alert("HALAAAA")
        </script>
    </g:if>
    <div class="page-header">
        <h1><g:message code="broker.list"/></h1>
    </div>
    <div class="well">
        <g:if test="${instanceTotal > 0}">
            test
            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width" id="broker">
                <thead>
                <tr>

                    <th></th>

                    <th><g:message code="broker.brokerPersianName" default="Persian Name"/></th>

                    <th><g:message code="broker.brokerLatinName" default="Latin Name"/></th>

                    <th><g:message code="broker.registerNo" default="Register No"/></th>

                    <th><g:message code="broker.registerLocation" default="Register Location"/></th>

                    <th><g:message code="broker.seoRegisterNo" default="Seo Register No"/></th>

                    <th><g:message code="broker.seoRegisterNo" default="Seo Register No"/></th>

                    <th><g:message code="broker.clubMembershipNo" default="Club MemberShip No"/></th>

                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </g:if>
        <g:else>
            <div class="alert alert-info">
                <g:message code="no.record.found"/>
            </div>
        </g:else>
        <g:link class="button action blue" action="create"><span class="glabel"><g:message code="default.new.label" args="[entityName]" /></span></g:link>
    </div>

</div>
</body>
</html>
