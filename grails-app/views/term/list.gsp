
<%@ page import="alms.Term" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'term.label', default: 'Term')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
<script type="text/javascript" charset="utf-8">
    var termTable;

    $(document).ready(function () {
        termTable = $('#term').dataTable({
            "bServerSide": true,
            "bFilter": true,
            "sAjaxSource": "<g:createLink action="jsonList" params="${[curriculumId:curriculumId]}"/>",
            "aoColumns": [
                {
                    "bSortable": false,
                    "sClass": "nowrap minimum-width"
                }, null, null,null]
        });
    });
</script>
%{--todo mtb present checkbox--}%
<legend><g:message code="term.list" default="Terms List"></g:message></legend>

<div class="well">
    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
           id="term">
        <thead>
        <tr>

            <th></th>

            <th><g:message code="term.title" default="Title"/></th>

            <th><g:message code="term.startDate" default="Start Date"/></th>

            <th><g:message code="term.price" default="Price"/></th>

        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <g:link class="btn btn-default" action="create" id="${curriculumId}"><g:message code="default.new.label"
                                                                                args="[entityName]"/></g:link>
</div>

</html>
