<%@ page import="alms.BrokerMember" %>
<g:hiddenField name="brokerId" value="${brokerId}"></g:hiddenField>

<div class="form-group col-md-6">
    <label for="city" class="col-sm-4 control-label">
        <g:message code="brokerTradingStation.city.label" default="city" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="person" placeholder="person" from="${alms.Person.list()}" optionKey="id"
                  value="${brokerTradingStationInstance?.person?.id}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="position" class="col-sm-4 control-label">
        <g:message code="brokerMember.position.label" default="position" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="position" placeholder="position" from="${brokerMemberInstance.constraints.position.inList}"
                  value="${brokerMemberInstance?.position}"
                  valueMessagePrefix="brokerMember.position"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="startDate" class="col-sm-4 control-label">
        <g:message code="broker.startDate.label" default="startDate" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="startDate" precision="day" value="${brokerMemberInstance?.startDate}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
