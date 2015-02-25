<%@ page import="alms.BrokerLicense" %>
<g:hiddenField name="brokerId" value="${brokerId}"></g:hiddenField>


<div class="form-group col-md-6">
    <label for="displayOrder" class="col-sm-4 control-label">
        <g:message code="brokerLicense.displayOrder.label" default="displayOrder" />
    </label>
    <div class="col-sm-8">
        <g:field type="number" class="form-control" name="displayOrder" placeholder="displayOrder"
                 value="${brokerLicenseInstance?.displayOrder}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="title1" class="col-sm-4 control-label">
        <g:message code="brokerLicense.title1.label" default="title1" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="title1" placeholder="title1"
                     value="${brokerLicenseInstance?.title1}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="title2" class="col-sm-4 control-label">
        <g:message code="brokerLicense.title2.label" default="title2" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="title2" placeholder="title2"
                     value="${brokerLicenseInstance?.title2}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="hasLicense" class="col-sm-4 control-label">
        <g:message code="brokerLicense.hasLicense.label" default="hasLicense" />
    </label>
    <div class="col-sm-8">
        <g:checkBox class="form-control"   name="hasLicense" placeholder="hasLicense"
                    value="${brokerLicenseInstance?.hasLicense}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="licenseNumber" class="col-sm-4 control-label">
        <g:message code="brokerLicense.licenseNumber.label" default="licenseNumber" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="licenseNumber" placeholder="licenseNumber"
                     value="${brokerLicenseInstance?.licenseNumber}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="licenseDate" class="col-sm-4 control-label">
        <g:message code="broker.licenseDate.label" default="licenseDate" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="licenseDate" precision="day" value="${brokerLicenseInstance?.licenseDate}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="licenseExpiry" class="col-sm-4 control-label">
        <g:message code="broker.licenseExpiry.label" default="licenseExpiry" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="licenseExpiry" precision="day" value="${brokerLicenseInstance?.licenseExpiry}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
