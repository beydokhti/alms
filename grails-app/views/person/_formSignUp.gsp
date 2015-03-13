<%@ page import="alms.Person" %>


<div class="form-group col-md-6">
    <label for="username" class="col-sm-4 control-label">
        <g:message code="person.username.label" default="username"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="username" placeholder="username"
                     value="${personInstance?.username}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="password" class="col-sm-4 control-label">
        <g:message code="person.password.label" default="password"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="password" placeholder="password"
                     />
    </div>
</div>


<div class="form-group col-md-6">
    <label for="name" class="col-sm-4 control-label">
        <g:message code="person.name.label" default="name"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="name" placeholder="name"
                     value="${personInstance?.name}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="lastName" class="col-sm-4 control-label">
        <g:message code="person.lastName.label" default="lastName"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="lastName" placeholder="lastName"
                     value="${personInstance?.lastName}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="sex" class="col-sm-4 control-label">
        <g:message code="person.sex.label" default="sex"/>
    </label>

    <div class="col-sm-8">
        <g:select class="form-control" name="sex" placeholder="sex" from="${personInstance.constraints.sex.inList}"
                  value="${personInstance?.sex}"
                  valueMessagePrefix="person.sex"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="degree" class="col-sm-4 control-label">
        <g:message code="person.degree.label" default="degree"/>
    </label>

    <div class="col-sm-8">
        <g:select class="form-control" name="degree" placeholder="degree"
                  from="${personInstance.constraints.degree.inList}"
                  value="${personInstance?.degree}"
                  valueMessagePrefix="person.degree"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="field" class="col-sm-4 control-label">
        <g:message code="person.field.label" default="field"/>
    </label>

    <div class="col-sm-8">
        <g:select class="form-control" name="field" placeholder="field"
                  from="${personInstance.constraints.field.inList}"
                  value="${personInstance?.field}"
                  valueMessagePrefix="person.field"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="dateOfBirth" class="col-sm-4 control-label">
        <g:message code="person.dateOfBirth.label" default="dateOfBirth"/>
    </label>

    <div class="col-sm-8">
        <g:datePicker class="form-control" name="dateOfBirth" precision="day" value="${personInstance?.dateOfBirth}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="nationalCode" class="col-sm-4 control-label">
        <g:message code="person.nationalCode.label" default="nationalCode"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="nationalCode" placeholder="nationalCode"
                     value="${personInstance?.nationalCode}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="mobile" class="col-sm-4 control-label">
        <g:message code="person.mobile.label" default="mobile"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="mobile" placeholder="mobile"
                     value="${personInstance?.mobile}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="email" class="col-sm-4 control-label">
        <g:message code="person.email.label" default="email"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="email" placeholder="email"
                     value="${personInstance?.email}"/>
    </div>
</div>
