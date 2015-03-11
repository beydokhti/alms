<%@ page import="alms.Discount" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'discount.label', default: 'Discount')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
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
                    {"bSortable": false, "sClass": "nowrap minimum-width"},null, null, null, null, null, null]
            });
        });
    </script>

    <legend><g:message code="discount.list" default="Discount List"></g:message></legend>

    <div class="well">
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
               id="broker">
            <thead>
            <tr>

                <th></th>

                <th><g:message code="discount.title" default="Title"/></th>

                <th><g:message code="discount.personType" default="Person Type"/></th>

                <th><g:message code="discount.discountPercentage" default="Percentage"/></th>

                <th><g:message code="discount.startDate" default="Start Date"/></th>

                <th><g:message code="discount.endDate" default="End Date"/></th>

                <th><g:message code="discount.event" default="Event"/></th>

            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <g:if test="${hasEvent==true}">
        <g:link class="btn btn-default" action="create"><g:message code="default.new.label"
                                                                   args="[entityName]"/></g:link>
        </g:if>
    </div>
    <g:if test="${hasEvent==false}">
        <div class="alert alert-danger" role="alert">
            <g:message code="discount.hasEvent.danger" default="Danger"/>
        </div>
    </g:if>

</div>
</body>
</html>
