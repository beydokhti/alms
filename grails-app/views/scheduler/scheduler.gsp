<%@ page import="alms.Broker" %>
<!DOCTYPE html>
<%--
  Created by IntelliJ IDEA.
  User: MaryJoOon
  Date: 3/4/2015
  Time: 4:19 PM
--%>

<html>
<head>
    <title>Basic usage</title>
    <meta charset="utf-8">
    <link href="${resource(dir:"kendoUI/examples/content/shared/styles", file:"examples-offline.css")}" rel="stylesheet">
    <link href="${resource(dir:"kendoUI/styles", file:"kendo.common-bootstrap.min.css")}" rel="stylesheet">
    <link href="${resource(dir:"kendoUI/styles", file:"kendo.rtl.min.css")}" rel="stylesheet">
    <link href="${resource(dir:"kendoUI/styles", file:"kendo.default.min.css")}" rel="stylesheet">
    <link href="${resource(dir:"kendoUI/styles", file:"kendo.dataviz.min.css")}" rel="stylesheet">
    <link href="${resource(dir:"kendoUI/styles", file:"kendo.dataviz.default.min.css")}" rel="stylesheet">

    <script src="${resource(dir: "kendoUI/js",file:"jquery.min.js")}"></script>
    <script src="${resource(dir: "kendoUI/js",file:"angular.min.js")}"></script>
    <script src="${resource(dir: "kendoUI/js",file:"kendo.all.min.js")}"></script>
    <script src="${resource(dir:"kendoUI/examples/content/shared/js", file:"console.js")}"></script>
    <script>

    </script>


</head>
<body>

<a class="offline-button" href="../index.html">Back</a>

<div id="example">
    <div id="team-schedule">
        <div id="people">
            <input checked type="checkbox" id="alex" value="1">
            <input checked type="checkbox" id="bob" value="2">
            <input type="checkbox" id="charlie" value="3">
        </div>
    </div>
    <div id="scheduler"></div>
</div>
<script>
    $(function() {
        $("#scheduler").kendoScheduler({
            date: new Date("2013/6/13"),
            startTime: new Date("2013/6/13 07:00 AM"),
            height: 600,
            views: [
                "day",
                { type: "workWeek", selected: true },
                "week",
                "month",
                "agenda",
                { type: "timeline", eventHeight: 50}
            ],
            timezone: "Etc/UTC",
            dataSource: {
                batch: true,
                transport: {
                    read: {       //list
                        url: "<g:createLink controller="course" action="listCourse"></g:createLink>",
                        dataType: "json"
                    },
                    update: {     //save   upd
                        url: "<g:createLink controller="course" action="updateCourse"></g:createLink>",
                        dataType: "json"
                    },
                    create: {    // save
                        url: "<g:createLink controller="course" action="saveCourse"></g:createLink>",
//                        url: "http://localhost:8080/alms/course/saveCourse",
                        dataType: "json"
                    },
                    destroy: {   // delete
                        url: "<g:createLink controller="course" action="delete"></g:createLink>",
                        dataType: "json"
                    },
                    parameterMap: function(options, operation) {
                        if (operation !== "read" && options.models) {
                            return {models: kendo.stringify(options.models)};
                        }
                    }
                },
                schema: {
                    model: {
                        id: "taskId",
                        fields: {
                            taskId: { from: "TaskID", type: "number" },
                            title: { from: "Title", defaultValue: "No title", validation: { required: true } },
                            start: { type: "date", from: "Start" },
                            end: { type: "date", from: "End" },
                            startTimezone: { from: "StartTimezone" },
                            endTimezone: { from: "EndTimezone" },
                            description: { from: "Description" },
                            recurrenceId: { from: "RecurrenceID" },
                            recurrenceRule: { from: "RecurrenceRule" },
                            recurrenceException: { from: "RecurrenceException" },
                            ownerId: { from: "OwnerID", defaultValue: 1 },
                            isAllDay: { type: "boolean", from: "IsAllDay" }
                        }
                    }
                },
                filter: {
                    logic: "or",
                    filters: [
                        { field: "ownerId", operator: "eq", value: 1 },
                        { field: "ownerId", operator: "eq", value: 2 }
                    ]
                }
            },
            resources: [
                {
                    field: "ownerId",
                    title: "Owner",
                    dataSource: [
                        { text: "Alex", value: 1, color: "#f8a398" },
                        { text: "Bob", value: 2, color: "#51a0ed" },
                        { text: "Charlie", value: 3, color: "#56ca85" }
                    ]
                }
            ]
        });

        $("#people :checkbox").change(function(e) {
            var checked = $.map($("#people :checked"), function(checkbox) {
                return parseInt($(checkbox).val());
            });

            var scheduler = $("#scheduler").data("kendoScheduler");

            scheduler.dataSource.filter({
                operator: function(task) {
                    return $.inArray(task.ownerId, checked) >= 0;
                }
            });
        });
    });
</script>
<style scoped>

.k-nav-current > .k-link span + span {
    max-width: 200px;
    display: inline-block;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    vertical-align: top;
}

#team-schedule {
    background: url('../kendoUI/examples/content/web/scheduler/team-schedule.png') transparent no-repeat;
    height: 115px;
    position: relative;
}

#people {
    background: url('../kendoUI/examples/content/web/scheduler/scheduler-people.png') no-repeat;
    width: 345px;
    height: 115px;
    position: absolute;
    right: 0;
}
#alex {
    position: absolute;
    left: 4px;
    top: 81px;
}
#bob {
    position: absolute;
    left: 119px;
    top: 81px;
}
#charlie {
    position: absolute;
    left: 234px;
    top: 81px;
}
</style>




</body>
</html>
