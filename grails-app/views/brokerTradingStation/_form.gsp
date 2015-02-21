<%@ page import="alms.BrokerTradingStation" %>



<div class="fieldcontain ${hasErrors(bean: brokerTradingStationInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="brokerTradingStation.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${brokerTradingStationInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerTradingStationInstance, field: 'stationType', 'error')} ">
	<label for="stationType">
		<g:message code="brokerTradingStation.stationType.label" default="Station Type" />
		
	</label>
	<g:select name="stationType" from="${brokerTradingStationInstance.constraints.stationType.inList}" value="${brokerTradingStationInstance?.stationType}" valueMessagePrefix="brokerTradingStation.stationType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerTradingStationInstance, field: 'activities', 'error')} ">
	<label for="activities">
		<g:message code="brokerTradingStation.activities.label" default="Activities" />
		
	</label>
	<g:textField name="activities" value="${brokerTradingStationInstance?.activities}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerTradingStationInstance, field: 'trader', 'error')} ">
	<label for="trader">
		<g:message code="brokerTradingStation.trader.label" default="Trader" />
		
	</label>
	<g:textField name="trader" value="${brokerTradingStationInstance?.trader}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerTradingStationInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="brokerTradingStation.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${brokerTradingStationInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerTradingStationInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="brokerTradingStation.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${brokerTradingStationInstance?.address}"/>
</div>

