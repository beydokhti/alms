<%@ page import="alms.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="person.create.label" default="Create Person"/></title>
    <g:javascript>
        function initDatePicker(num) {
            $('#birthday' + num).datepicker();
        }
    </g:javascript>
</head>

<body>
<div id="create-person" class="content scaffold-create" role="main">
    <h1><g:message code="person.create.label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${personInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${personInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="save">
        <fieldset class="form">
            <%@ page import="alms.Person" %>

            <div class="row">
                <div class="fieldcontain  col-md-6 ${hasErrors(bean: personInstance, field: 'name', 'error')} ">
                    <label for="name">
                        <g:message code="person.name.label" default="Name"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField name="name" value="${personInstance?.name}"/>
                </div>

                <div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'lastName', 'error')} ">
                    <label for="lastName">
                        <g:message code="person.lastName.label" default="Last Name"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField name="lastName" value="${personInstance?.lastName}"/>
                </div>

                <div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'sex', 'error')} ">
                    <label for="sex">
                        <g:message code="person.sex.label" default="Sex"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select name="sex" from="${personInstance.constraints.sex.inList}" value="${personInstance?.sex}"
                              valueMessagePrefix="person.sex" noSelection="['': '']"/>

                </div>

                <div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'degree', 'error')} ">
                    <label for="degree">
                        <g:message code="person.degree.label" default="Degree"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select name="degree" from="${personInstance.constraints.degree.inList}"
                              value="${personInstance?.degree}" valueMessagePrefix="person.degree"
                              noSelection="['': '']"/>
                </div>

                <div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'field', 'error')} ">
                    <label for="field">
                        <g:message code="person.field.label" default="Field"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select name="field" from="${personInstance.constraints.field.inList}"
                              value="${personInstance?.field}" valueMessagePrefix="person.field"
                              noSelection="['': '']"/>
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
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField name="nationalCode" value="${personInstance?.nationalCode}"/>
                </div>

                <div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'mobile', 'error')} ">
                    <label for="mobile">
                        <g:message code="person.mobile.label" default="Mobile"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField name="mobile" value="${personInstance?.mobile}"/>
                </div>

                <div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'email', 'error')} ">
                    <label for="email">
                        <g:message code="person.email.label" default="Email"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField name="email" value="${personInstance?.email}"/>
                </div>

                %{--<div class="fieldcontain col-md-6  ${hasErrors(bean: personInstance, field: 'certificates', 'error')} ">--}%
                    %{--<label for="certificates">--}%
                        %{--<g:message code="person.certificates.label" default="Certificates"/>--}%

                    %{--</label>--}%
                    %{--<g:select name="certificates" from="${alms.ObtainedCertificate.list()}" multiple="multiple"--}%
                              %{--optionKey="id" size="5" value="${personInstance?.certificates*.id}" class="many-to-many"/>--}%
                %{--</div>--}%
             </div>

        </fieldset>

        <div class="row">

            <div class="col-md-6" >
                <g:message code="person.add.certificates" default="Add Certificates"/>
            </div>
            <div class="col-md-10" >
                <dynamic:block itemId="fullName" min="1" max="10" addBtnId="addFullName" removeBtnLabel="Delete"
                               onComplete="initDatePicker" limitReachedMsg="Limit is exceeded!" template="elem"/>
                <input id="addFullName" type="button" value="Add user"/>
            </div>
        </div>
        <div class="col-md-12" style="height: 20px"></div>
        <fieldset class="buttons">
            <g:submitButton name="create" class="btn btn-primary active"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            <g:link class="btn btn-primary active" action="list"><g:message code="person.list.label"/></g:link>
        </fieldset>
    </g:form>



</div>
</body>
</html>
