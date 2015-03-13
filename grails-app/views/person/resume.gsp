<%@ page import="alms.Person" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'person.label', default: 'ObtainedCertificate')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<div id="list-person" class="content scaffold-list" role="main">
    <script type="text/javascript" charset="utf-8">
        var resumeTable;

        $(document).ready(function () {
            resumeTable = $('#resume').dataTable({
                "bServerSide": true,
                "bFilter": true,
                "sAjaxSource": "<g:createLink action="jsonResumeList" controller="person" params="${[personId:personId]}"/>",
                "aoColumns": [null, null, null,null, null]
            });
        });
    </script>

    <legend><g:message code="Resume" default="Resume"></g:message></legend>

    <div class="well">
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
               id="resume">
            <thead>
            <tr>

                <th><g:message code="person.broker" default="broker"/></th>

                <th><g:message code="person.startDate" default="startDate"/></th>

                <th><g:message code="person.endDate" default="endDate"/></th>

                <th><g:message code="person.isActive" default="isActive"/></th>

                <th><g:message code="person.position" default="position"/></th>

            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

</div>

</body>
</html>
