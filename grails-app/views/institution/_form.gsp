<%@ page import="alms.Institution" %>


<div class="form-group col-md-6">
    <label for="name" class="col-sm-4 control-label">
        <g:message code="institution.name.label" default="name" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="name" placeholder="name"
                     value="${institutionInstance?.name}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="nationalCode" class="col-sm-4 control-label">
        <g:message code="institution.nationalCode.label" default="nationalCode" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="nationalCode" placeholder="nationalCode"
                     value="${institutionInstance?.nationalCode}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="registerNumber" class="col-sm-4 control-label">
        <g:message code="institution.registerNumber.label" default="registerNumber" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="registerNumber" placeholder="registerNumber"
                     value="${institutionInstance?.registerNumber}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="address" class="col-sm-4 control-label">
        <g:message code="institution.address.label" default="address" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="address" placeholder="address"
                     value="${institutionInstance?.address}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="fax" class="col-sm-4 control-label">
        <g:message code="institution.fax.label" default="fax" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="fax" placeholder="fax"
                     value="${institutionInstance?.fax}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="email" class="col-sm-4 control-label">
        <g:message code="institution.email.label" default="email" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="email" placeholder="email"
                     value="${institutionInstance?.email}"/>
    </div>
</div>
