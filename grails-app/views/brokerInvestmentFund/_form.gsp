<%@ page import="alms.BrokerInvestmentFund" %>
<g:hiddenField name="brokerId" value="${brokerId}"></g:hiddenField>


<div class="form-group col-md-6">
    <label for="fundName" class="col-sm-4 control-label">
        <g:message code="brokerInvestmentFund.fundName.label" default="fundName" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="fundName" placeholder="fundName"
                     value="${brokerInvestmentFundInstance?.fundName}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="startingDate" class="col-sm-4 control-label">
        <g:message code="broker.startingDate.label" default="startingDate" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="startingDate" precision="day" value="${brokerInvestmentFundInstance?.startingDate}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="typeAndScale" class="col-sm-4 control-label">
        <g:message code="brokerInvestmentFund.typeAndScale.label" default="typeAndScale" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="typeAndScale" placeholder="typeAndScale" from="${brokerInvestmentFundInstance.constraints.typeAndScale.inList}"
                  value="${brokerInvestmentFundInstance?.typeAndScale}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="fundManager" class="col-sm-4 control-label">
        <g:message code="brokerInvestmentFund.fundManager.label" default="fundManager" />
    </label>
    <div class="col-sm-8">
        <g:checkBox class="form-control"   name="fundManager" placeholder="fundManager"
                    value="${brokerInvestmentFundInstance?.fundManager}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="fundCustodian" class="col-sm-4 control-label">
        <g:message code="brokerInvestmentFund.fundCustodian.label" default="fundCustodian" />
    </label>
    <div class="col-sm-8">
        <g:checkBox class="form-control"   name="fundCustodian" placeholder="fundCustodian"
                    value="${brokerInvestmentFundInstance?.fundCustodian}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="agencyFund" class="col-sm-4 control-label">
        <g:message code="brokerInvestmentFund.agencyFund.label" default="agencyFund" />
    </label>
    <div class="col-sm-8">
        <g:checkBox class="form-control"   name="agencyFund" placeholder="agencyFund"
                    value="${brokerInvestmentFundInstance?.agencyFund}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="fundRegisterManager" class="col-sm-4 control-label">
        <g:message code="brokerInvestmentFund.fundRegisterManager.label" default="fundRegisterManager" />
    </label>
    <div class="col-sm-8">
        <g:checkBox class="form-control"   name="fundRegisterManager" placeholder="fundRegisterManager"
                    value="${brokerInvestmentFundInstance?.fundRegisterManager}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="liquidityGuaranteeFund" class="col-sm-4 control-label">
        <g:message code="brokerInvestmentFund.liquidityGuaranteeFund.label" default="liquidityGuaranteeFund" />
    </label>
    <div class="col-sm-8">
        <g:checkBox class="form-control"   name="liquidityGuaranteeFund" placeholder="liquidityGuaranteeFund"
                    value="${brokerInvestmentFundInstance?.liquidityGuaranteeFund}"/>
    </div>
</div>
