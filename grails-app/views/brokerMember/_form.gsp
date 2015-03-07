<%@ page import="alms.BrokerMember" %>
<g:hiddenField name="brokerId" value="${brokerId}"></g:hiddenField>

<div class="form-group col-md-6">
    <label for="name" class="col-sm-4 control-label">
        <g:message code="brokerMember.name.label" default="name" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="name" placeholder="name"
                     value="${brokerMemberInstance?.person?.name}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="lastName" class="col-sm-4 control-label">
        <g:message code="brokerMember.lastName.label" default="lastName" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="lastName" placeholder="lastName"
                     value="${brokerMemberInstance?.person?.lastName}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="sex" class="col-sm-4 control-label">
        <g:message code="brokerMember.sex.label" default="sex" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="sex" placeholder="sex" from="${new alms.Person().constraints?.sex.inList}"
                  value="${brokerMemberInstance?.person?.sex}"
                  valueMessagePrefix="person.sex"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="position" class="col-sm-4 control-label">
        <g:message code="brokerMember.position.label" default="position" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="position" placeholder="position" from="${brokerMemberInstance.constraints.position.inList}"
                  value="${brokerMemberInstance?.position}"
                  valueMessagePrefix="brokerMember.position"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="startDate" class="col-sm-4 control-label">
        <g:message code="broker.startDate.label" default="startDate" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="startDate" precision="day" value="${brokerMemberInstance?.startDate}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="degree" class="col-sm-4 control-label">
        <g:message code="brokerMember.degree.label" default="degree" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="degree" placeholder="degree" from="${new alms.Person().constraints.degree.inList}"
                  value="${brokerMemberInstance?.person?.degree}"
                  valueMessagePrefix="person.degree"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="field" class="col-sm-4 control-label">
        <g:message code="brokerMember.field.label" default="field" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="field" placeholder="field" from="${new alms.Person().constraints?.field.inList}"
                  value="${brokerMemberInstance?.person?.field}"
                  valueMessagePrefix="person.field"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="dateOfBirth" class="col-sm-4 control-label">
        <g:message code="broker.dateOfBirth.label" default="dateOfBirth" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="dateOfBirth" precision="day" value="${brokerMemberInstance?.person?.dateOfBirth}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="nationalCode" class="col-sm-4 control-label">
        <g:message code="brokerMember.nationalCode.label" default="nationalCode" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="nationalCode" placeholder="nationalCode"
                     value="${brokerMemberInstance?.person?.nationalCode}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="mobile" class="col-sm-4 control-label">
        <g:message code="brokerMember.mobile.label" default="mobile" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="mobile" placeholder="mobile"
                     value="${brokerMemberInstance?.person?.mobile}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="email" class="col-sm-4 control-label">
        <g:message code="brokerMember.email.label" default="email" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="email" placeholder="email"
                     value="${brokerMemberInstance?.person?.email}"/>
    </div>
</div>
