<%@ page import="alms.OpenExam" %>

<div class="form-group col-md-6">
    <label for="title" class="col-sm-4 control-label">
        <g:message code="openExam.title.label" default="title" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="title" placeholder="title"
                     value="${openExamInstance?.title}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="examStartTime" class="col-sm-4 control-label">
        <g:message code="openExam.examStartTime.label" default="examStartTime" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="examStartTime" precision="minute" value="${openExamInstance?.examStartTime}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="examEndTime" class="col-sm-4 control-label">
        <g:message code="openExam.examEndTime.label" default="examEndTime" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="examEndTime" precision="minute" value="${openExamInstance?.examEndTime}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="venue" class="col-sm-4 control-label">
        <g:message code="openExam.venue.label" default="venue" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="venue" placeholder="venue"
                     value="${openExamInstance?.venue}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="price" class="col-sm-4 control-label">
        <g:message code="openExam.price.label" default="price" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="price" placeholder="price"
                     value="${openExamInstance?.price}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="totalScore" class="col-sm-4 control-label">
        <g:message code="openExam.totalScore.label" default="totalScore" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="totalScore" placeholder="totalScore"
                     value="${openExamInstance?.totalScore}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="passingScore" class="col-sm-4 control-label">
        <g:message code="openExam.passingScore.label" default="passingScore" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="passingScore" placeholder="passingScore"
                     value="${openExamInstance?.passingScore}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="description" class="col-sm-4 control-label">
        <g:message code="openExam.description.label" default="description" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="description" placeholder="description"
                     value="${openExamInstance?.description}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="registrationStartDate" class="col-sm-4 control-label">
        <g:message code="openExam.registrationStartDate.label" default="registrationStartDate" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="registrationStartDate" precision="day" value="${openExamInstance?.registrationStartDate}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="registrationEndDate" class="col-sm-4 control-label">
        <g:message code="openExam.registrationEndDate.label" default="registrationEndDate" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="registrationEndDate" precision="day" value="${openExamInstance?.registrationEndDate}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>

