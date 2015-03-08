<%@ page import="alms.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="course.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${courseInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'color', 'error')} ">
	<label for="color">
		<g:message code="course.color.label" default="Color" />
		
	</label>
	<g:select name="color" from="${courseInstance.constraints.color.inList}" value="${courseInstance?.color}" valueMessagePrefix="course.color" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'events', 'error')} ">
	<label for="events">
		<g:message code="course.events.label" default="Events" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${courseInstance?.events?}" var="e">
    <li><g:link controller="event" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="event" action="create" params="['course.id': courseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'event.label', default: 'Event')])}</g:link>
</li>
</ul>

</div>

