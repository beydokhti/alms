<%@ page import="alms.RegisteredEvent" %>
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
    <label for="event" class="col-sm-4 control-label">
        <g:message code="RegisteredEventt.event.label" default="event" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="event.id" placeholder="event" from="${alms.Event.list()}" optionKey="id"
                  value="${RegisteredEventInstance?.event?.id}"/>
    </div>
</div>
%{--<div class="form-group col-md-6">--}%
    %{--<label for="mark" class="col-sm-4 control-label">--}%
        %{--<g:message code="RegisteredEvent.mark.label" default="mark" />--}%
    %{--</label>--}%
    %{--<div class="col-sm-8">--}%
        %{--<g:textField class="form-control"   name="mark" placeholder="mark"--}%
                     %{--value="${RegisteredEventInstance?.mark}"/>--}%
    %{--</div>--}%
%{--</div>--}%