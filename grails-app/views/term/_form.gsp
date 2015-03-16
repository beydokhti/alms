<%@ page import="alms.Term" %>

<g:hiddenField name="curriculumId" value="${curriculumId}"></g:hiddenField>

<div class="form-group col-md-6">
    <label for="title" class="col-sm-4 control-label">
        <g:message code="term.title.label" default="title" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="title" placeholder="title"
                     value="${termInstance?.title}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="startDate" class="col-sm-4 control-label">
        <g:message code="term.startDate.label" default="startDate" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="startDate" precision="day" value="${termInstance?.startDate}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="price" class="col-sm-4 control-label">
        <g:message code="term.price.label" default="price" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="price" placeholder="price"
                     value="${termInstance?.price}"/>
    </div>
</div>

