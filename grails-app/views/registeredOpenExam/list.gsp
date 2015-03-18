
<%@ page import="alms.RegisteredOpenExam" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registeredOpenExam.label', default: 'Registered Open Exam')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <script type="text/javascript" charset="utf-8">
        var roeTable;

        $(document).ready(function () {
            roeTable = $('#roe').dataTable({
                "bServerSide": true,
                "bFilter": true,
                "sAjaxSource": "<g:createLink action="jsonList" params="${[personId:personId]}"/>",
                "aoColumns": [
                    {
                        "bSortable": false,
                        "sClass": "nowrap minimum-width"
                    }, null, null, null,null, null]
            });
        });
    </script>
    %{--todo mtb present checkbox--}%
    <legend><g:message code="registeredOpenExam.list" default="Policy List"></g:message></legend>

    <div class="well">
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
               id="roe">
            <thead>
            <tr>

                <th></th>

                <th><g:message code="registeredOpenExam.title" default="title"/></th>

                <th><g:message code="registeredOpenExam.examStartTime" default="examStartTime"/></th>

                <th><g:message code="registeredOpenExam.examEndTime" default="examEndTime"/></th>

                <th><g:message code="registeredOpenExam.venue" default="venue"/></th>

                <th><g:message code="registeredOpenExam.description" default="description"/></th>


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
