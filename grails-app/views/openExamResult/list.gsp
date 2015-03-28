<%@ page import="alms.OpenExamResult" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'openExamResult.label', default: 'OpenExamResult')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<script type="text/javascript" charset="utf-8">
    var resultTable;

    $(document).ready(function () {
        resultTable = $('#result').dataTable({
            "bServerSide": true,
            "bFilter": true,
            "sAjaxSource": "<g:createLink action="jsonList" params="${[openExamId:openExamId]}"/>",
            "aoColumns": [
                {
                    "bSortable": false,
                    "sClass": "nowrap minimum-width"
                }, null, null, null, null]
        });
    });
</script>
%{--todo mtb present checkbox--}%
<legend><g:message code="openExamResult.list" default="Exam Result List"></g:message></legend>

<div class="well">
    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
           id="result">
        <thead>
        <tr>

            <th></th>

            <th><g:message code="openExamResult.person" default="person"/></th>

            <th><g:message code="openExamResult.correctAnswer" default="correctAnswer"/></th>

            <th><g:message code="openExamResult.wrongAnswer" default="wrongAnswer"/></th>

            <th><g:message code="openExamResult.finalScore" default="finalScore"/></th>

        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <g:link class="btn btn-default" action="create" id="${openExamId}"><g:message code="default.new.label"
                                                                                  args="[entityName]"/></g:link>
</div>
</body>
</html>
