
<%@ page import="alms.RegisteredEvent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registeredEvent.label', default: 'RegisteredEvent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

    <div id="list-person" class="content scaffold-list" role="main">
        <script type="text/javascript" charset="utf-8">
            var regTable;

            $(document).ready(function () {
                regTable = $('#registeredEvent').dataTable({
                    "bServerSide": true,
                    "bFilter": true,
                    "sAjaxSource": "<g:createLink action="jsonList" params="${[personId:personId]}"/>",
                    "aoColumns": [
                        {"bSortable": false, "sClass": "nowrap minimum-width"}, null, null, null ,null,null,null]
                });
            });
        </script>

        <legend><g:message code="registeredEvent.list" default="Registered Events List"></g:message></legend>

        <div class="well">
            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
                   id="registeredEvent">
                <thead>
                <tr>

                    <th></th>

                    <th><g:message code="registeredEvent.person" default="person"/></th>

                    <th><g:message code="registeredEvent.event" default="event"/></th>

                    <th><g:message code="registeredEvent.mark" default="mark"/></th>

                    <th><g:message code="registeredEvent.examStartDate" default="exam start date"/></th>

                    <th><g:message code="registeredEvent.examDate" default="exam end date"/></th>

                    <th><g:message code="registeredEvent.examVenue" default="exam venue"/></th>

                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <g:link class="btn btn-default" action="create" id="${personId}"><g:message code="default.new.label" args="[entityName]"/></g:link>
        </div>

    </div>
	</body>
</html>
