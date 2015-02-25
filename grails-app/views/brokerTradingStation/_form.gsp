<%@ page import="alms.BrokerTradingStation" %>
<g:hiddenField name="brokerId" value="${brokerId}"></g:hiddenField>


<div class="form-group col-md-6">
    <label for="city" class="col-sm-4 control-label">
        <g:message code="brokerTradingStation.city.label" default="city" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="City.id" placeholder="City" from="${alms.City?.list()}" optionKey="id"
                  value="${brokerTradingStationInstance?.city?.id}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="stationType" class="col-sm-4 control-label">
        <g:message code="BrokerSoftware.stationType.label" default="stationType" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="stationType" placeholder="stationType" from="${brokerTradingStationInstance.constraints.stationType.inList}"
                  value="${brokerTradingStationInstance?.stationType}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="activities" class="col-sm-4 control-label">
        <g:message code="brokerTradingStation.activities.label" default="activities" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control" name="City.id" placeholder="City" from="${alms.City?.list()}" optionKey="id"
                  value="${brokerTradingStationInstance?.city?.id}"/>

    </div>
</div>
<div class="form-group col-md-6">
    <label for="trader" class="col-sm-4 control-label">
        <g:message code="brokerTradingStation.trader.label" default="trader" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="trader" placeholder="trader"
                     value="${brokerTradingStationInstance?.trader}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="phone" class="col-sm-4 control-label">
        <g:message code="brokerTradingStation.phone.label" default="phone" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="phone" placeholder="phone"
                     value="${brokerTradingStationInstance?.phone}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="address" class="col-sm-4 control-label">
        <g:message code="brokerTradingStation.address.label" default="address" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="address" placeholder="address"
                     value="${brokerTradingStationInstance?.address}"/>
    </div>
</div>
