<%@ page import="alms.BrokerPortfolio" %>
<g:hiddenField name="brokerId" value="${brokerId}"></g:hiddenField>

<div class="form-group col-md-6">
    <label for="countOfContract" class="col-sm-4 control-label">
        <g:message code="brokerPortfolio.countOfContract.label" default="countOfContract" />
    </label>
    <div class="col-sm-8">
        <g:textField  class="form-control" name="countOfContract" placeholder="countOfContract"
                 value="${brokerPortfolioInstance?.countOfContract}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="sumOfContract" class="col-sm-4 control-label">
        <g:message code="brokerPortfolio.sumOfContract.label" default="sumOfContract" />
    </label>
    <div class="col-sm-8">
        <g:textField  class="form-control" name="sumOfContract" placeholder="sumOfContract"
                 value="${brokerPortfolioInstance?.sumOfContract}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="countOfConsultantContract" class="col-sm-4 control-label">
        <g:message code="brokerPortfolio.countOfConsultantContract.label" default="countOfConsultantContract" />
    </label>
    <div class="col-sm-8">
        <g:textField  class="form-control" name="countOfConsultantContract" placeholder="countOfConsultantContract"
                 value="${brokerPortfolioInstance?.countOfConsultantContract}"/>
    </div>
</div>
