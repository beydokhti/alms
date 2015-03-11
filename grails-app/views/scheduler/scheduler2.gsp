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

<script id="editor" type="text/x-kendo-template">
<div class="k-overlay" style="display: block; z-index: 10002; opacity: 0.5;"></div>

<div class="k-widget k-window"
     style="padding-top: 29px; min-width: 90px; min-height: 50px; display: block; top: 274px; left: 414.5px; z-index: 10003; opacity: 1; transform: scale(1);"
     data-role="draggable">
    <div class="k-window-titlebar k-header" style="margin-top: -29px;">
        <span class="k-window-title">Event</span>

        <div class="k-window-actions">
            <a class="k-window-action k-link" href="#" role="button">
                <span class="k-icon k-i-close" role="presentation">Close</span>
            </a>
        </div>
    </div>

    <div class="k-popup-edit-form k-scheduler-edit-form k-window-content k-content"
         data-uid="326fde63-399d-492b-ab0f-f08f381a00c6" data-role="window" tabindex="0" style="">
        <div class="k-edit-form-container">
            <div class="k-edit-label">
                <label for="title">Title</label>
            </div>

            <div class="k-edit-field" data-container-for="title">
                <input class="k-input k-textbox" type="text" name="title" required="required" data-bind="value:title">
            </div>

            <div class="k-edit-label">
                <label for="start">Start</label>
            </div>

            <div class="k-edit-field" data-container-for="start">
                <span class="k-widget k-datetimepicker k-header" style="">
                    <span class="k-picker-wrap k-state-default">
                        <input class="k-input" type="text" data-validate="true"
                               data-bind="value:start,invisible:isAllDay" data-role="datetimepicker" data-type="date"
                               required="" name="start" data-timezone="Etc/UTC" style="width: 100%;" role="combobox"
                               aria-expanded="false" aria-disabled="false" aria-readonly="false">
                        <span class="k-select" unselectable="on">
                            <span class="k-icon k-i-calendar" unselectable="on" role="button">select</span>
                            <span class="k-icon k-i-clock" unselectable="on" role="button">select</span>
                        </span>
                    </span>
                </span>
                <span class="k-widget k-datepicker k-header" style="display: none;">
                    <span class="k-picker-wrap k-state-default">
                        <input class="k-input" type="text" data-validate="false"
                               data-bind="value:start,visible:isAllDay" data-role="datepicker" data-type="date"
                               required="" name="start" data-timezone="Etc/UTC" style="width: 100%;" role="combobox"
                               aria-expanded="false" aria-disabled="false" aria-readonly="false">
                        <span class="k-select" unselectable="on" role="button">
                            <span class="k-icon k-i-calendar" unselectable="on">select</span>
                        </span>
                    </span>
                </span>
                <span data-bind="text: startTimezone"></span>
                <span class="k-invalid-msg" data-for="start" style="display: none;"></span>
            </div>

            <div class="k-edit-label">
                <label for="end">End</label>
            </div>

            <div class="k-edit-field" data-container-for="end">
                <span class="k-widget k-datetimepicker k-header" style="">
                    <span class="k-picker-wrap k-state-default">
                        <input class="k-input" type="text" data-validate="true" data-bind="value:end,invisible:isAllDay"
                               data-role="datetimepicker" data-type="date" required="" name="end"
                               data-timezone="Etc/UTC"
                               data-datecompare-msg="End date should be greater than or equal to the start date"
                               style="width: 100%;" role="combobox" aria-expanded="false" aria-disabled="false"
                               aria-readonly="false">
                        <span class="k-select" unselectable="on">
                            <span class="k-icon k-i-calendar" unselectable="on" role="button">select</span>
                            <span class="k-icon k-i-clock" unselectable="on" role="button">select</span>
                        </span>
                    </span>
                </span>
                <span class="k-widget k-datepicker k-header" style="display: none;">
                    <span class="k-picker-wrap k-state-default">
                        <input class="k-input" type="text" data-validate="false" data-bind="value:end,visible:isAllDay"
                               data-role="datepicker" data-type="date" required="" name="end" data-timezone="Etc/UTC"
                               data-datecompare-msg="End date should be greater than or equal to the start date"
                               style="width: 100%;" role="combobox" aria-expanded="false" aria-disabled="false"
                               aria-readonly="false">
                        <span class="k-select" unselectable="on" role="button">
                            <span class="k-icon k-i-calendar" unselectable="on">select</span>
                        </span>
                    </span>
                </span>
                <span data-bind="text: endTimezone"></span>
                <span data-bind="text: startTimezone, invisible: endTimezone"></span>
                <span class="k-invalid-msg" data-for="end" style="display: none;"></span>
            </div>

            <div class="k-edit-label">
                <label for="isAllDay">All day event</label>
            </div>

            <div class="k-edit-field" data-container-for="isAllDay">
                <input type="checkbox" name="isAllDay" data-type="boolean" data-bind="checked:isAllDay">
            </div>

            <div class="k-edit-label">
                <label for="recurrenceRule">Repeat</label>
            </div>

            <div class="k-edit-field" data-container-for="recurrenceRule">
                <div data-bind="value:recurrenceRule" name="recurrenceRule" data-role="recurrenceeditor">
                    <span class="k-widget k-dropdown k-header" style="" unselectable="on" role="listbox"
                          aria-haspopup="true" aria-expanded="false" tabindex="0" aria-owns="" aria-disabled="false"
                          aria-readonly="false" aria-busy="false">
                        <span class="k-dropdown-wrap k-state-default" unselectable="on">
                            <span class="k-input" unselectable="on">Never</span>
                            <span class="k-select" unselectable="on">
                                <span class="k-icon k-i-arrow-s" unselectable="on">select</span>
                            </span>
                        </span>
                        <input data-role="dropdownlist" style="display: none;">
                    </span>
                </div>
            </div>

            <div class="k-recur-view"></div>

            <div class="k-edit-label">
                <label for="description">Description</label>
            </div>

            <div class="k-edit-field" data-container-for="description">
                <textarea class="k-textbox" name="description" data-bind="value:description"></textarea>
            </div>

            <div class="k-edit-label">
                <label for="ownerId">Owner</label>
            </div>

            <div class="k-edit-field" data-container-for="ownerId">
                <span class="k-widget k-dropdown k-header" style="" unselectable="on" role="listbox"
                      aria-haspopup="true" aria-expanded="false" tabindex="0" aria-owns="" aria-disabled="false"
                      aria-readonly="false" aria-busy="false">
                    <span class="k-dropdown-wrap k-state-default" unselectable="on">
                        <span class="k-input" unselectable="on">Alex</span>
                        <span class="k-select" unselectable="on">
                            <span class="k-icon k-i-arrow-s" unselectable="on">select</span>
                        </span>
                    </span>
                    <select data-bind="value:ownerId" data-role="dropdownlist" style="display: none;">
                        <option value="">None</option>
                        <option value="1" selected="selected">Alex</option>
                        <option value="2">Bob</option>
                        <option value="3">Charlie</option>
                    </select>
                </span>
            </div>

            <div class="k-edit-buttons k-state-default">
                <a class="k-button k-primary k-scheduler-update" href="#">Save</a>
                <a class="k-button k-scheduler-cancel" href="#">Cancel</a>
            </div>
        </div>
    </div>
</div>

<div class="k-list-container k-popup k-group k-reset" data-role="popup"
     style="position: absolute; height: auto; display: none;">
    <ul class="k-list k-reset" unselectable="on" style="overflow: auto; height: auto;" tabindex="-1" role="listbox"
        aria-hidden="true" aria-live="off">
        <li class="k-item k-state-selected k-state-focused" unselectable="on" role="option" tabindex="-1">Never</li>
        <li class="k-item" unselectable="on" role="option" tabindex="-1">Daily</li>
        <li class="k-item" unselectable="on" role="option" tabindex="-1">Weekly</li>
        <li class="k-item" unselectable="on" role="option" tabindex="-1">Monthly</li>
        <li class="k-item" unselectable="on" role="option" tabindex="-1">Yearly</li>
    </ul>
</div>

<div class="k-list-container k-popup k-group k-reset" data-role="popup"
     style="position: absolute; height: auto; display: none;">
    <ul class="k-list k-reset" unselectable="on" style="overflow: auto; height: auto;" tabindex="-1" role="listbox"
        aria-hidden="true" aria-live="off">
        <li class="k-item" unselectable="on" role="option" tabindex="-1">
            <span class="k-scheduler-mark" style="background-color:none"></span>
            None
        </li>
        <li class="k-item k-state-selected k-state-focused" unselectable="on" role="option" tabindex="-1">
            <span class="k-scheduler-mark" style="background-color:#f8a398"></span>
            Alex
        </li>
        <li class="k-item" unselectable="on" role="option" tabindex="-1">
            <span class="k-scheduler-mark" style="background-color:#51a0ed"></span>
            Bob
        </li>
        <li class="k-item" unselectable="on" role="option" tabindex="-1">
            <span class="k-scheduler-mark" style="background-color:#56ca85"></span>
            Charlie
        </li>
    </ul>
</div>

<div class="k-calendar-container k-popup k-group k-reset" aria-hidden="true" data-role="popup"
     style="display: none; position: absolute;"></div>

<div class="k-list-container k-popup k-group k-reset" data-role="popup" style="display: none; position: absolute;">
    <ul class="k-list k-reset" unselectable="on" aria-hidden="true" role="listbox" tabindex="-1"
        style="overflow: auto;"></ul>
</div>

<div class="k-calendar-container k-popup k-group k-reset" aria-hidden="true" data-role="popup"
     style="display: none; position: absolute;"></div>

<div class="k-calendar-container k-popup k-group k-reset" aria-hidden="true" data-role="popup"
     style="display: none; position: absolute;"></div>

<div class="k-list-container k-popup k-group k-reset" data-role="popup" style="display: none; position: absolute;">
    <ul class="k-list k-reset" unselectable="on" aria-hidden="true" role="listbox" tabindex="-1"
        style="overflow: auto;"></ul>
</div>

<div class="k-calendar-container k-popup k-group k-reset" aria-hidden="true" data-role="popup"
     style="display: none; position: absolute;"></div>
</script>

<div id="scheduler"></div>
<script>
    $("#scheduler").kendoScheduler({
        date: new Date("2013/6/6"),
        editable: {
            template: $("#editor").html()
        },
        views: [
            "day",
            {type: "workWeek", selected: true},
            "week",
            "month",
            "agenda",
            {type: "timeline", eventHeight: 50}
        ],
        dataSource: [
            {
                id: 1,
                start: new Date("2013/6/6 08:00 AM"),
                end: new Date("2013/6/6 09:00 AM"),
                title: "Interview"
            }
        ]
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
    background: url('../kendoUI/examples/team-schedule.png') transparent no-repeat;
    height: 115px;
    position: relative;
}

#people {
    background: url('../kendoUI/examples/scheduler-people.png') no-repeat;
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
