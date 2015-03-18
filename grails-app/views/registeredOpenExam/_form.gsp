<%@ page import="alms.RegisteredOpenExam" %>
<g:hiddenField name="personId" value="${personId}"></g:hiddenField>

%{--<div class="form-group col-md-6">--}%
    %{--<label for="person" class="col-sm-4 control-label">--}%
        %{--<g:message code="registeredOpenExam.person.label" default="person" />--}%
    %{--</label>--}%
    %{--<div class="col-sm-8">--}%
        %{--<g:select class="form-control"   name="person.id" placeholder="person" from="${alms.Person.list()}" optionKey="id"--}%
                  %{--value="${registeredOpenExamInstance?.person?.id}"/>--}%
    %{--</div>--}%
%{--</div>--}%
<div class="form-group col-md-6">
    <label for="openExam" class="col-sm-4 control-label">
        <g:message code="registeredOpenExam.openExam.label" default="openExam" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="openExam.id" placeholder="openExam" from="${examList}" optionKey="id"
                  value="${registeredOpenExamInstance?.openExam?.id}"/>
    </div>
</div>



