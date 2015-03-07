<%@ page import="alms.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'start', 'error')} ">
	<label for="start">
		<g:message code="course.start.label" default="Start" />
		
	</label>
	<g:textField name="start" value="${courseInstance?.start}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'end', 'error')} ">
	<label for="end">
		<g:message code="course.end.label" default="End" />
		
	</label>
	<g:textField name="end" value="${courseInstance?.end}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'startTimezone', 'error')} ">
	<label for="startTimezone">
		<g:message code="course.startTimezone.label" default="Start Timezone" />
		
	</label>
	<g:textField name="startTimezone" value="${courseInstance?.startTimezone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'endTimezone', 'error')} ">
	<label for="endTimezone">
		<g:message code="course.endTimezone.label" default="End Timezone" />
		
	</label>
	<g:textField name="endTimezone" value="${courseInstance?.endTimezone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="course.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${courseInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'recurrenceID', 'error')} ">
	<label for="recurrenceID">
		<g:message code="course.recurrenceID.label" default="Recurrence ID" />
		
	</label>
	<g:textField name="recurrenceID" value="${courseInstance?.recurrenceID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'recurrenceRule', 'error')} ">
	<label for="recurrenceRule">
		<g:message code="course.recurrenceRule.label" default="Recurrence Rule" />
		
	</label>
	<g:textField name="recurrenceRule" value="${courseInstance?.recurrenceRule}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'recurrenceException', 'error')} ">
	<label for="recurrenceException">
		<g:message code="course.recurrenceException.label" default="Recurrence Exception" />
		
	</label>
	<g:textField name="recurrenceException" value="${courseInstance?.recurrenceException}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'ownerID', 'error')} ">
	<label for="ownerID">
		<g:message code="course.ownerID.label" default="Owner ID" />
		
	</label>
	<g:textField name="ownerID" value="${courseInstance?.ownerID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'isAllDay', 'error')} ">
	<label for="isAllDay">
		<g:message code="course.isAllDay.label" default="Is All Day" />
		
	</label>
	<g:textField name="isAllDay" value="${courseInstance?.isAllDay}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="course.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${courseInstance?.title}"/>
</div>

