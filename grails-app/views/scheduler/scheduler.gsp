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
    <title><g:message code="scheduler.scheduler" default="Scheduler"/></title>
    <meta charset="utf-8">
    <link href="${resource(dir: "kendoUI/examples", file: "examples-offline.css")}" rel="stylesheet">
    <link href="${resource(dir: "kendoUI/styles", file: "kendo.common-bootstrap.min.css")}" rel="stylesheet">
    <link href="${resource(dir: "kendoUI/styles", file: "kendo.rtl.min.css")}" rel="stylesheet">
    <link href="${resource(dir: "kendoUI/styles", file: "kendo.default.min.css")}" rel="stylesheet">
    <link href="${resource(dir: "kendoUI/styles", file: "kendo.dataviz.min.css")}" rel="stylesheet">
    <link href="${resource(dir: "kendoUI/styles", file: "kendo.dataviz.default.min.css")}" rel="stylesheet">

    <script src="${resource(dir: "kendoUI/js", file: "jquery.min.js")}"></script>
    <script src="${resource(dir: "kendoUI/js", file: "angular.min.js")}"></script>
    <script src="${resource(dir: "kendoUI/js", file: "kendo.all.min.js")}"></script>
    <script src="${resource(dir: "kendoUI/examples", file: "console.js")}"></script>
    %{--<script src="${resource(dir: "kendoUI/js/cultures", file:"kendo.culture.fa-IR.min.js")}"></script>--}%

    %{--<script type="text/javascript">--}%
    %{--//set current to the "en-GB" culture script--}%
    %{--kendo.culture("fa-IR");--}%
    %{--</script>--}%

</head>

<body>

%{--<div class="offline-button"><g:link controller="course" action="list"><g:message code="Course" default="Courses"/> </g:link></div>--}%
<div id="example">
    <div id="team-schedule">
        <div id="people">
            %{--<input checked type="checkbox" id="alex" value="1">--}%
            %{--<input checked type="checkbox" id="bob" value="2">--}%
            %{--<input type="checkbox" id="charlie" value="3">--}%
            <table>
                <tr>
                    <g:each in="${courseList}" status="i" var="course">
                        <g:if test="${ ( i > 0 ) && ( i % 4 == 0 ) }">
                            </tr><tr>
                        </g:if>
                        <td>
                        <g:checkBox name="courseList" id="${course.title}" value="${course.id}"></g:checkBox>
                            <label for="courseList">${course.title}</label>
                        </td>
                    </g:each>
                </tr>
            </table>
        </div>
    </div>

    <div id="scheduler"></div>
</div>
<script>
    $(function () {
        $("#scheduler").kendoScheduler({
            date: new Date("${startDate}"),
            startTime: new Date("${startTime}"),
            height: 600,
            views: [
                "day",
                {type: "workWeek", selected: true},
                "week",
                "month",
                "agenda",
                {type: "timeline", eventHeight: 50}
            ],
            timezone: "Etc/UTC",
            dataSource: {
                batch: true,
                transport: {
                    read: {       //list
                        url: "<g:createLink controller="event" action="listEvent"></g:createLink>",
                        dataType: "json"
                    },
                    update: {     //save   upd
                        url: "<g:createLink controller="event" action="updateEvent"></g:createLink>",
                        dataType: "json"
                    },
                    create: {    // save
                        url: "<g:createLink controller="event" action="saveEvent"></g:createLink>",
                        dataType: "json"
                    },
                    destroy: {   // delete
                        url: "<g:createLink controller="event" action="deleteEvent"></g:createLink>",
                        dataType: "json"
                    },
                    parameterMap: function (options, operation) {
                        if (operation !== "read" && options.models) {
                            return {models:[ kendo.stringify(options.models),"${termId}"]};
                        }
                    }
                },
                schema: {
                    model: {
                        id: "taskId",
                        fields: {
                            taskId: {from: "TaskID", type: "number"},
                            title: {from: "Title", defaultValue: "No title", validation: {required: true}},
                            start: {type: "date", from: "Start"},
                            end: {type: "date", from: "End"},
                            startTimezone: {from: "StartTimezone"},
                            endTimezone: {from: "EndTimezone"},
                            description: {from: "Description"},
                            recurrenceId: {from: "RecurrenceID"},
                            recurrenceRule: {from: "RecurrenceRule"},
                            recurrenceException: {from: "RecurrenceException"},
                            courseId: {from: "CourseID", defaultValue: 1, validation: {required: true}},
                            isAllDay: {type: "boolean", from: "IsAllDay"}
                        }
                    }
                },
                filter: {
                    logic: "or",
                    filters:
//                            [
//                        {field: "courseId", operator: "eq", value: 1},
//                        {field: "courseId", operator: "eq", value: 2}
//                    ]
                    ${filter}
                }
            },
            resources: [
                {
                    field: "courseId",
                    title: "Course",
                    dataSource:
                    //[
//                        { text: "Alex", value: 1, color: "#f8a398" },
//                        { text: "Bob", value: 2, color: "#51a0ed" },
//                        { text: "Charlie", value: 3, color: "#56ca85" }
//                    ]
                    ${courseDataSource}
                }
            ]
        });

        $("#people :checkbox").change(function (e) {
            var checked = $.map($("#people :checked"), function (checkbox) {
                return parseInt($(checkbox).val());
            });

            var scheduler = $("#scheduler").data("kendoScheduler");

            scheduler.dataSource.filter({
                operator: function (task) {
                    return $.inArray(task.courseId, checked) >= 0;
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
    /*background: url('../kendoUI/examples/team-schedule.png') transparent no-repeat;*/
    height: 70px;
    position: relative;
}

#people {
    /*background: url('../kendoUI/examples/scheduler-people.png') no-repeat;*/
    width: 345px;
    height: 70px;
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
