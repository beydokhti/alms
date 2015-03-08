<%@ page import="alms.InstitutionMember" %>
<g:hiddenField name="institutionId" value="${institutionId}"></g:hiddenField>

<div class="form-group col-md-6">
    <label for="person" class="col-sm-4 control-label">
        <g:message code="institutionMember.person.label" default="person" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control" name="person.id" placeholder="person" from="${alms.Person.list()}" optionKey="id"
                  value="${institutionMemberInstance?.person?.id}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="startDate" class="col-sm-4 control-label">
        <g:message code="institution.startDate.label" default="startDate" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="startDate" precision="day" value="${institutionMemberInstance?.startDate}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
