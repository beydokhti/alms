<%@ page import="alms.RegisteredTerm" %>
<g:hiddenField name="personId" value="${personId}"></g:hiddenField>


%{--<div class="form-group col-md-6">--}%
    %{--<label for="person" class="col-sm-4 control-label">--}%
        %{--<g:message code="RegisteredEvent.person.label" default="person" />--}%
    %{--</label>--}%
    %{--<div class="col-sm-8">--}%
        %{--<g:select class="form-control"   name="person.id" placeholder="person" from="${alms.Person.list()}" optionKey="id"--}%
                  %{--value="${RegisteredEventInstance?.person?.id}"/>--}%
    %{--</div>--}%
%{--</div>--}%
<div class="form-group col-md-6">
    <label for="term" class="col-sm-4 control-label">
        <g:message code="RegisteredEventt.term.label" default="term" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="term.id" placeholder="term" from="${alms.Term.list()}" optionKey="id"
                  value="${RegisteredTermInstance?.term?.id}"
        valueMessagePrefix="${RegisteredTermInstance.term?.toString}"/>
    </div>
</div>
%{--<div class="form-group col-md-6">--}%
    %{--<label for="mark" class="col-sm-4 control-label">--}%
        %{--<g:message code="RegisteredTerm.mark.label" default="mark" />--}%
    %{--</label>--}%
    %{--<div class="col-sm-8">--}%
        %{--<g:textField class="form-control"   name="mark" placeholder="mark"--}%
                     %{--value="${RegisteredTermInstance?.mark}"/>--}%
    %{--</div>--}%
%{--</div>--}%