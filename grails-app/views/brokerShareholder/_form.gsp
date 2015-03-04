<%@ page import="alms.BrokerShareholder" %>
<g:hiddenField name="brokerId" value="${brokerId}"></g:hiddenField>

<div class="form-group col-md-6">
    <label for="shareholderName" class="col-sm-4 control-label">
        <g:message code="brokerShareholder.shareholderName.label" default="shareholderName"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="shareholderName" placeholder="shareholderName"
                     value="${brokerShareholderInstance?.shareholderName}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="ownershipType" class="col-sm-4 control-label">
        <g:message code="brokerShareholder.ownershipType.label" default="ownershipType"/>
    </label>

    <div class="col-sm-8">
        <g:select class="form-control" name="ownershipType" placeholder="ownershipType"
                  from="${brokerShareholderInstance.constraints.ownershipType.inList}"
                  value="${brokerShareholderInstance?.ownershipType}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="ownershipPercent" class="col-sm-4 control-label">
        <g:message code="brokerShareholder.ownershipPercent.label" default="ownershipPercent"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="ownershipPercent" placeholder="ownershipPercent"
                 value="${brokerShareholderInstance?.ownershipPercent}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="sharesCount" class="col-sm-4 control-label">
        <g:message code="brokerShareholder.sharesCount.label" default="sharesCount"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="sharesCount" placeholder="sharesCount"
                 value="${brokerShareholderInstance?.sharesCount}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="representativeOnBoard" class="col-sm-4 control-label">
        <g:message code="brokerShareholder.representativeOnBoard.label" default="representativeOnBoard"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="representativeOnBoard" placeholder="representativeOnBoard"
                     value="${brokerShareholderInstance?.representativeOnBoard}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="description" class="col-sm-4 control-label">
        <g:message code="brokerShareholder.description.label" default="description"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="description" placeholder="description"
                     value="${brokerShareholderInstance?.description}"/>
    </div>
</div>
