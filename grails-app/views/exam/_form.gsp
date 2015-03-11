<%@ page import="alms.Exam" %>

<div class="form-group col-md-6">
    <label for="title" class="col-sm-4 control-label">
        <g:message code="exam.title.label" default="title" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="title" placeholder="title"
                     value="${examInstance?.title}"/>
    </div>
</div>
%{--<div class="form-group col-md-6">--}%
    %{--<label for="examDate" class="col-sm-4 control-label">--}%
        %{--<g:message code="exam.examDate.label" default="examDate" />--}%
    %{--</label>--}%
    %{--<div class="col-sm-8">--}%
        %{--<g:datePicker class="form-control" name="examDate" precision="day" value="${examInstance?.examDate}"--}%
                      %{--default="none" noSelection="['': '']"/>--}%
    %{--</div>--}%
%{--</div>--}%
<div class="form-group col-md-6">
    <label for="examStartTime" class="col-sm-4 control-label">
        <g:message code="exam.examStartTime.label" default="examStartTime" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="examStartTime" precision="minute" value="${examInstance?.examStartTime}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="examEndTime" class="col-sm-4 control-label">
        <g:message code=".examEndTime.label" default="examEndTime" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="examEndTime" precision="minute" value="${examInstance?.examEndTime}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="venue" class="col-sm-4 control-label">
        <g:message code="exam.venue.label" default="venue" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="venue" placeholder="venue"
                     value="${examInstance?.venue}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="event" class="col-sm-4 control-label">
        <g:message code="exam.event.label" default="event" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="event.id" placeholder="event" from="${alms.Event.list()}" optionKey="id"
                  value="${examInstance?.event?.id}"/>
    </div>
</div>
