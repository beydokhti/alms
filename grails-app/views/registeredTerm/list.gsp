
<%@ page import="alms.RegisteredTerm" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registeredTerm.label', default: 'RegisteredTerm')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

    <div id="list-person" class="content scaffold-list" role="main">
        <script type="text/javascript" charset="utf-8">
            var regTable;

            $(document).ready(function () {
                regTable = $('#registeredTerm').dataTable({
                    "bServerSide": true,
                    "bFilter": true,
                    "sAjaxSource": "<g:createLink action="jsonList" params="${[personId:personId]}"/>",
                    "aoColumns": [
                        {"bSortable": false, "sClass": "nowrap minimum-width"}, null, null, null ,null,null,null]
                });
            });
        </script>

        <legend><g:message code="registeredTerm.list" default="Registered Terms List"></g:message></legend>

        <div class="well">
            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
                   id="registeredTerm">
                <thead>
                <tr>

                    <th></th>

                    <th><g:message code="registeredTerm.person" default="person"/></th>

                    <th><g:message code="registeredTerm.term" default="term"/></th>

                    <th><g:message code="registeredTerm.mark" default="mark"/></th>

                    <th><g:message code="registeredTerm.examStartDate" default="exam start date"/></th>

                    <th><g:message code="registeredTerm.examDate" default="exam end date"/></th>

                    <th><g:message code="registeredTerm.examVenue" default="exam venue"/></th>

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
