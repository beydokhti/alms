
<%@ page import="alms.Curriculum" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'curriculum.label', default: 'Curriculum')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

    <div id="list-curriculum" class="content scaffold-list" role="main">
        <script type="text/javascript" charset="utf-8">
            var curriculumTable;

            $(document).ready(function () {
                curriculumTable = $('#curriculum').dataTable({
                    "bServerSide": true,
                    "bFilter": true,
                    "sAjaxSource": "<g:createLink action="jsonList"/>",
                    "aoColumns": [
                        {"bSortable": false, "sClass": "nowrap minimum-width"}, null,null, null]
                });
            });
        </script>

        <legend><g:message code="curriculum.list" default="Curriculum List"></g:message></legend>

        <div class="well">
            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
                   id="curriculum">
                <thead>
                <tr>

                    <th></th>

                    <th><g:message code="curriculum.title" default="Title"/></th>

                    <th><g:message code="curriculum.certificate" default="Certificate"/></th>

                    <th><g:message code="curriculum.courseSummary" default="Course"/></th>

                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <g:link class="btn btn-default" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link>
            <g:link controller="scheduler" action="scheduler" class="btn btn-default">scheduler</g:link>

        </div>

    </div>
	</body>
</html>
