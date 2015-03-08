<%@ page import="alms.InstitutionMember" %>
<g:hiddenField name="institutionId" value="${institutionId}"></g:hiddenField>

<div class="form-group col-md-6">
    <label for="name" class="col-sm-4 control-label">
        <g:message code="institutionMember.name.label" default="name" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="name" placeholder="name"
                     value="${institutionMemberInstance?.person?.name}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="lastName" class="col-sm-4 control-label">
        <g:message code="institutionMember.lastName.label" default="lastName" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="lastName" placeholder="lastName"
                     value="${institutionMemberInstance?.person?.lastName}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="sex" class="col-sm-4 control-label">
        <g:message code="institutionMember.sex.label" default="sex" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="sex" placeholder="sex" from="${new alms.Person().constraints?.sex.inList}"
                  value="${institutionMemberInstance?.person?.sex}"
                  valueMessagePrefix="person.sex"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="startDate" class="col-sm-4 control-label">
        <g:message code="institution.startDate.label" default="startDate" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="startDate" precision="day" value="${institutionMemberInstance?.startDate}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="degree" class="col-sm-4 control-label">
        <g:message code="institutionMember.degree.label" default="degree" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="degree" placeholder="degree" from="${new alms.Person().constraints.degree.inList}"
                  value="${institutionMemberInstance?.person?.degree}"
                  valueMessagePrefix="person.degree"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="field" class="col-sm-4 control-label">
        <g:message code="institutionMember.field.label" default="field" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="field" placeholder="field" from="${new alms.Person().constraints?.field.inList}"
                  value="${institutionMemberInstance?.person?.field}"
                  valueMessagePrefix="person.field"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="dateOfBirth" class="col-sm-4 control-label">
        <g:message code="institution.dateOfBirth.label" default="dateOfBirth" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="dateOfBirth" precision="day" value="${institutionMemberInstance?.person?.dateOfBirth}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="nationalCode" class="col-sm-4 control-label">
        <g:message code="institutionMember.nationalCode.label" default="nationalCode" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="nationalCode" placeholder="nationalCode"
                     value="${institutionMemberInstance?.person?.nationalCode}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="mobile" class="col-sm-4 control-label">
        <g:message code="institutionMember.mobile.label" default="mobile" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="mobile" placeholder="mobile"
                     value="${institutionMemberInstance?.person?.mobile}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="email" class="col-sm-4 control-label">
        <g:message code="institutionMember.email.label" default="email" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="email" placeholder="email"
                     value="${institutionMemberInstance?.person?.email}"/>
    </div>
</div>
