<%@ page import="alms.Person" %>

<div class="row">
    <div class="fieldcontain  col-md-6 ${hasErrors(bean: personInstance, field: 'name', 'error')} ">
        <label for="name">
            <g:message code="person.name.label" default="Name"/>

        </label>
        <g:textField name="name" value="${personInstance?.name}"/>
    </div>

    <div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'lastName', 'error')} ">
        <label for="lastName">
            <g:message code="person.lastName.label" default="Last Name"/>

        </label>
        <g:textField name="lastName" value="${personInstance?.lastName}"/>
    </div>

    <div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'sex', 'error')} ">
        <label for="sex">
            <g:message code="person.sex.label" default="Sex"/>

        </label>
        <g:select name="sex" from="${personInstance.constraints.sex.inList}" value="${personInstance?.sex}"
                  valueMessagePrefix="person.sex" noSelection="['': '']"/>

    </div>

    <div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'degree', 'error')} ">
        <label for="degree">
            <g:message code="person.degree.label" default="Degree"/>

        </label>
        <g:select name="degree" from="${personInstance.constraints.degree.inList}" value="${personInstance?.degree}"
                  valueMessagePrefix="person.degree" noSelection="['': '']"/>
    </div>

    <div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'field', 'error')} ">
        <label for="field">
            <g:message code="person.field.label" default="Field"/>

        </label>
        <g:select name="field" from="${personInstance.constraints.field.inList}" value="${personInstance?.field}"
                  valueMessagePrefix="person.field" noSelection="['': '']"/>
    </div>

    <div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'dataOfBirth', 'error')} required">
        <label for="dataOfBirth">
            <g:message code="person.dataOfBirth.label" default="Data Of Birth"/>
            <span class="required-indicator">*</span>
        </label>
        <g:datePicker name="dataOfBirth" precision="day" value="${personInstance?.dataOfBirth}"/>
    </div>

    <div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'nationalCode', 'error')} ">
        <label for="nationalCode">
            <g:message code="person.nationalCode.label" default="National Code"/>

        </label>
        <g:textField name="nationalCode" value="${personInstance?.nationalCode}"/>
    </div>

    <div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'mobile', 'error')} ">
        <label for="mobile">
            <g:message code="person.mobile.label" default="Mobile"/>

        </label>
        <g:textField name="mobile" value="${personInstance?.mobile}"/>
    </div>

    <div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'email', 'error')} ">
        <label for="email">
            <g:message code="person.email.label" default="Email"/>

        </label>
        <g:textField name="email" value="${personInstance?.email}"/>
    </div>

    <div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'certificates', 'error')} ">
        <label for="certificates">
            <g:message code="person.certificates.label" default="Certificates"/>

        </label>
        <g:select name="certificates" from="${alms.ObtainedCertificate.list()}" multiple="multiple" optionKey="id"
                  size="5" value="${personInstance?.certificates*.id}" class="many-to-many"/>
    </div>
    %{--<div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'certificates', 'error')} ">--}%
    %{--<input class="btn btn-default" type="button" onclick="doAddCertificate()" value="${message(code:'person.add.certificates',default: 'Add Certificates')}">--}%
    %{--</div>--}%
</div>
