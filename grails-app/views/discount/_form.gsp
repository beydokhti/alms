<%@ page import="alms.Discount" %>


<div class="form-group col-md-6">
    <label for="title" class="col-sm-4 control-label">
        <g:message code="discount.title.label" default="title" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="title" placeholder="title"
                     value="${discountInstance?.title}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="personType" class="col-sm-4 control-label">
        <g:message code="discount.personType.label" default="personType" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="personType" placeholder="personType" from="${discountInstance.constraints.personType.inList}"
                  value="${discountInstance?.personType}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="discountPercentage" class="col-sm-4 control-label">
        <g:message code="discount.discountPercentage.label" default="discountPercentage" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="discountPercentage" placeholder="discountPercentage"
                     value="${discountInstance?.discountPercentage}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="startDate" class="col-sm-4 control-label">
        <g:message code="discount.startDate.label" default="startDate" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="startDate" precision="day" value="${discountInstance?.startDate}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="endDate" class="col-sm-4 control-label">
        <g:message code="discount.endDate.label" default="endDate" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="endDate" precision="day" value="${discountInstance?.endDate}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="event" class="col-sm-4 control-label">
        <g:message code="discount.event.label" default="event" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="event.id" placeholder="event" from="${alms.Event.list()}" optionKey="id"
                  value="${discountInstance?.event?.id}"/>
    </div>
</div>
