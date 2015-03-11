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
        var personTable;

        $(document).ready(function () {
            personTable = $('#person').dataTable({
                "bServerSide": true,
                "bFilter": true,
                "sAjaxSource": "<g:createLink action="jsonList" params="${[institutionId:institutionId]}"/>",
                "aoColumns": [
                    {"bSortable": false, "sClass": "nowrap minimum-width"}, null, null, null,null, null, null, null,null]
            });
        });
    </script>

    <legend><g:message code="person.list" default="person List"></g:message></legend>

    <div class="well">
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
               id="person">
            <thead>
            <tr>

                <th></th>


                <th><g:message code="person.name" default="Name"/></th>

                <th><g:message code="person.lastName" default="Last Name"/></th>

                <th><g:message code="person.sex" default="sex"/></th>

                <th><g:message code="person.degree" default="degree"/></th>

                <th><g:message code="person.field" default="field"/></th>

                <th><g:message code="person.dateOfBirth" default="Data Of Birth"/></th>

                <th><g:message code="person.nationalCode" default="National Code"/></th>

                <th><g:message code="person.mobile" default="mobile"/></th>

                <th><g:message code="person.email" default="email"/></th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <g:link class="btn btn-default" action="create" id="${institutionId}"><g:message code="default.new.label" args="[entityName]"/></g:link>
    </div>

</div>

</body>
</html>
