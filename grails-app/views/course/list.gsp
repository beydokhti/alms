<%@ page import="alms.Course" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<script type="text/javascript" charset="utf-8">
    var courseTable;

    $(document).ready(function () {
        courseTable = $('#course').dataTable({
            "bServerSide": true,
            "bFilter": true,
            "sAjaxSource": "<g:createLink action="jsonList" />",
            "aoColumns": [
                {
                    "bSortable": false,
                    "sClass": "nowrap minimum-width"
                }, null, {
                    "bSortable": false,
                    "sClass": "nowrap minimum-width"
                }]
        });
    });
</script>
%{--todo mtb present checkbox--}%
<legend><g:message code="course.list" default="Courses List"></g:message></legend>

<div class="well">
    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
           id="course">
        <thead>
        <tr>

            <th></th>

            <th><g:message code="course.title" default="City"/></th>

            <th></th>

        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <g:link class="btn btn-default" action="create" id="${courseId}"><g:message code="default.new.label"
                                                                    args="[entityName]"/></g:link>
    <g:link controller="scheduler" action="scheduler" class="btn btn-default">scheduler</g:link>
</div>

</body>
</html>
