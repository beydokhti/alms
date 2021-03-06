<%@ page import="alms.BrokerMember" %>
<g:hiddenField name="brokerId" value="${brokerId}"></g:hiddenField>

<div class="form-group col-md-6">
    <label for="person" class="col-sm-4 control-label">
        <g:message code="brokerMember.person.label" default="person" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control" name="person.id" placeholder="person" from="${alms.Person.list()}" optionKey="id"
                  value="${brokerMemberInstance?.person?.id}"/>
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
