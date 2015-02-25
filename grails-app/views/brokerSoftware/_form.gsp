<%@ page import="alms.BrokerSoftware" %>
<g:hiddenField name="brokerId" value="${brokerId}"></g:hiddenField>


<div class="form-group col-md-6">
    <label for="title1" class="col-sm-4 control-label">
        <g:message code="BrokerSoftware.title1.label" default="title1" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="title1" placeholder="title1"
                     value="${brokerSoftwareInstance?.title1}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="title2" class="col-sm-4 control-label">
        <g:message code="BrokerSoftware.title2.label" default="title2" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="title2" placeholder="title2"
                     value="${brokerSoftwareInstance?.title2}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="companyName" class="col-sm-4 control-label">
        <g:message code="BrokerSoftware.companyName.label" default="companyName" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="companyName" placeholder="companyName"
                     value="${brokerSoftwareInstance?.companyName}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="contractType" class="col-sm-4 control-label">
        <g:message code="brokerSoftware.contractType.label" default="contractType" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="contractType" placeholder="contractType" from="${brokerSoftwareInstance.constraints.contractType?.inList}"
                  value="${brokerSoftwareInstance?.contractType}"/>
    </div>
</div>

