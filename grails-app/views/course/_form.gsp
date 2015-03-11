<%@ page import="alms.Course" %>

<div class="form-group col-md-6">
    <label for="title" class="col-sm-4 control-label">
        <g:message code="course.title.label" default="title"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="title" placeholder="title"
                     value="${courseInstance?.title}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="color" class="col-sm-4 control-label">
        <g:message code="course.color.label" default="color"/>
    </label>

    <div class="col-sm-8">
        <g:select class="form-control" name="color" placeholder="color"
                  from="${courseInstance.constraints.color.inList}"
                  value="${courseInstance?.color}"
                  valueMessagePrefix="color"/>
    </div>
</div>
