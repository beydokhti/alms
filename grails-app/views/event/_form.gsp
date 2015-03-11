<%@ page import="alms.Event" %>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="event.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${eventInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'start', 'error')} ">
	<label for="start">
		<g:message code="event.start.label" default="Start" />
		
	</label>
	<g:datePicker name="start" precision="day"  value="${eventInstance?.start}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'end', 'error')} ">
	<label for="end">
		<g:message code="event.end.label" default="End" />
		
	</label>
	<g:datePicker name="end" precision="day"  value="${eventInstance?.end}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'startTimezone', 'error')} ">
	<label for="startTimezone">
		<g:message code="event.startTimezone.label" default="Start Timezone" />
		
	</label>
	<g:textField name="startTimezone" value="${eventInstance?.startTimezone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'endTimezone', 'error')} ">
	<label for="endTimezone">
		<g:message code="event.endTimezone.label" default="End Timezone" />
		
	</label>
	<g:textField name="endTimezone" value="${eventInstance?.endTimezone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="event.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${eventInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'recurrenceID', 'error')} ">
	<label for="recurrenceID">
		<g:message code="event.recurrenceID.label" default="Recurrence ID" />
		
	</label>
	<g:textField name="recurrenceID" value="${eventInstance?.recurrenceID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'recurrenceRule', 'error')} ">
	<label for="recurrenceRule">
		<g:message code="event.recurrenceRule.label" default="Recurrence Rule" />
		
	</label>
	<g:textField name="recurrenceRule" value="${eventInstance?.recurrenceRule}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'recurrenceException', 'error')} ">
	<label for="recurrenceException">
		<g:message code="event.recurrenceException.label" default="Recurrence Exception" />
		
	</label>
	<g:textField name="recurrenceException" value="${eventInstance?.recurrenceException}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'isAllDay', 'error')} ">
	<label for="isAllDay">
		<g:message code="event.isAllDay.label" default="Is All Day" />
		
	</label>
	<g:textField name="isAllDay" value="${eventInstance?.isAllDay}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="event.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" type="number" value="${eventInstance.price}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="event.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${alms.Course.list()}" optionKey="id" required="" value="${eventInstance?.course?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'discount', 'error')} ">
	<label for="discount">
		<g:message code="event.discount.label" default="Discount" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${eventInstance?.discount?}" var="d">
    <li><g:link controller="discount" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="discount" action="create" params="['event.id': eventInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'discount.label', default: 'Discount')])}</g:link>
</li>
</ul>

</div>

