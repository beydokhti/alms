<%@ page import="alms.OpenExam" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'openExam.label', default: 'OpenExam')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div id="list-openExam" class="content scaffold-list" role="main">
    <script type="text/javascript" charset="utf-8">
        var openExamTable;

        $(document).ready(function () {
            openExamTable = $('#openExam').dataTable({
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
                    {
                        "bSortable": false,
                        "sClass": "nowrap minimum-width"
                    }, null, null, null, null, null, null]
//                ,
//                "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
//                    try {
//                        if (aData[7] == '100') {
//                            $(nRow).css('background-color', 'green');
//                        }
//                        else {
//                            $(nRow).css('background-color', 'blue');
//                        }
//                    } catch(ex) {
//                        alert("fnRowCallback exception:");
//                    }
//                    return nRow;
//                }
            });
        });
    </script>

    <legend><g:message code="openExam.list" default="Open Exam List"></g:message></legend>

    <div class="well">
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered full-width"
               id="openExam">
            <thead>
            <tr>

                <th></th>

                <th><g:message code="openExam.title" default="title"/></th>

                <th><g:message code="openExam.examStartTime" default="examStartTime"/></th>

                <th><g:message code="openExam.examEndTime" default="examEndTime"/></th>

                <th><g:message code="openExam.venue" default="venue"/></th>

                <th><g:message code="openExam.price" default="Price"/></th>

                <th><g:message code="openExam.personCount" default="Person Count"/></th>

            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <g:link class="btn btn-default" action="create"><g:message code="default.new.label"
                                                                   args="[entityName]"/></g:link>
    </div>

</div>
</body>
</html>
