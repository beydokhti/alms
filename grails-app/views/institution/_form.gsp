<%@ page import="alms.Institution" %>



<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="institution.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${institutionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'nationalCode', 'error')} ">
	<label for="nationalCode">
		<g:message code="institution.nationalCode.label" default="National Code" />
		
	</label>
	<g:textField name="nationalCode" value="${institutionInstance?.nationalCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'registerNumber', 'error')} ">
	<label for="registerNumber">
		<g:message code="institution.registerNumber.label" default="Register Number" />
		
	</label>
	<g:textField name="registerNumber" value="${institutionInstance?.registerNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="institution.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${institutionInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="institution.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${institutionInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'fax', 'error')} ">
	<label for="fax">
		<g:message code="institution.fax.label" default="Fax" />
		
	</label>
	<g:textField name="fax" value="${institutionInstance?.fax}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="institution.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${institutionInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'person', 'error')} ">
	<label for="person">
		<g:message code="institution.person.label" default="Person" />
		
	</label>
	<g:select name="person" from="${alms.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${institutionInstance?.person*.id}" class="many-to-many"/>
</div>

