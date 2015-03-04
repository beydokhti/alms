<%@ page import="alms.BrokerBranch" %>
<g:hiddenField name="brokerId" value="${brokerId}"></g:hiddenField>

<div class="form-group col-md-6">
    <label for="City" class="col-sm-4 control-label">
        <g:message code="brokerBranch.city.label" default="City"/>
    </label>

    <div class="col-sm-8">
        <g:select class="form-control" name="city.id" placeholder="city" from="${alms.City?.list()}" optionKey="id"
                  value="${brokerBranchInstance?.city?.id}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="branchType" class="col-sm-4 control-label">
        <g:message code="brokerBranch.branchType.label" default="branchType"/>
    </label>

    <div class="col-sm-8">
        <g:select class="form-control" name="branchType" placeholder="branchType"
                  from="${brokerBranchInstance.constraints.branchType.inList}"
                  value="${brokerBranchInstance?.branchType}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="representativePerson" class="col-sm-4 control-label">
        <g:message code="brokerBranch.representativePerson.label" default="representativePerson"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="representativePerson" placeholder="representativePerson"
                     value="${brokerBranchInstance?.representativePerson}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="personnelCount" class="col-sm-4 control-label">
        <g:message code="brokerShareholder.personnelCount.label" default="personnelCount"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="personnelCount" placeholder="personnelCount"
                 value="${brokerShareholderInstance?.personnelCount}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="tseStock" class="col-sm-4 control-label">
        <g:message code="brokerBranch.tseStock.label" default="tseStock"/>
    </label>

    <div class="col-sm-8">
        <g:checkBox class="form-control" name="tseStock" placeholder="tseStock"
                    value="${brokerBranchInstance?.tseStock}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="imeStock" class="col-sm-4 control-label">
        <g:message code="brokerBranch.imeStock.label" default="imeStock"/>
    </label>

    <div class="col-sm-8">
        <g:checkBox class="form-control" name="imeStock" placeholder="imeStock"
                    value="${brokerBranchInstance?.imeStock}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="energyStock" class="col-sm-4 control-label">
        <g:message code="brokerBranch.energyStock.label" default="energyStock"/>
    </label>

    <div class="col-sm-8">
        <g:checkBox class="form-control" name="energyStock" placeholder="energyStock"
                    value="${brokerBranchInstance?.energyStock}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="imeFuture" class="col-sm-4 control-label">
        <g:message code="brokerBranch.imeFuture.label" default="imeFuture"/>
    </label>

    <div class="col-sm-8">
        <g:checkBox class="form-control" name="imeFuture" placeholder="imeFuture"
                    value="${brokerBranchInstance?.imeFuture}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="tseFuture" class="col-sm-4 control-label">
        <g:message code="brokerBranch.tseFuture.label" default="tseFuture"/>
    </label>

    <div class="col-sm-8">
        <g:checkBox class="form-control" name="tseFuture" placeholder="tseFuture"
                    value="${brokerBranchInstance?.tseFuture}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="mutualFundAdmin" class="col-sm-4 control-label">
        <g:message code="brokerBranch.mutualFundAdmin.label" default="mutualFundAdmin"/>
    </label>

    <div class="col-sm-8">
        <g:checkBox class="form-control" name="mutualFundAdmin" placeholder="mutualFundAdmin"
                    value="${brokerBranchInstance?.mutualFundAdmin}"/>
    </div>
</div>


