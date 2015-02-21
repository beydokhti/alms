<%@ page import="alms.BrokerMember" %>



<div class="fieldcontain ${hasErrors(bean: brokerMemberInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="brokerMember.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${brokerMemberInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerMemberInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="brokerMember.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${brokerMemberInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerMemberInstance, field: 'sex', 'error')} ">
	<label for="sex">
		<g:message code="brokerMember.sex.label" default="Sex" />
		
	</label>
	<g:select name="sex" from="${brokerMemberInstance.constraints.sex.inList}" value="${brokerMemberInstance?.sex}" valueMessagePrefix="brokerMember.sex" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerMemberInstance, field: 'position', 'error')} ">
	<label for="position">
		<g:message code="brokerMember.position.label" default="Position" />
		
	</label>
	<g:select name="position" from="${brokerMemberInstance.constraints.position.inList}" value="${brokerMemberInstance?.position}" valueMessagePrefix="brokerMember.position" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerMemberInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="brokerMember.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${brokerMemberInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerMemberInstance, field: 'degree', 'error')} ">
	<label for="degree">
		<g:message code="brokerMember.degree.label" default="Degree" />
		
	</label>
	<g:select name="degree" from="${brokerMemberInstance.constraints.degree.inList}" value="${brokerMemberInstance?.degree}" valueMessagePrefix="brokerMember.degree" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerMemberInstance, field: 'field', 'error')} ">
	<label for="field">
		<g:message code="brokerMember.field.label" default="Field" />
		
	</label>
	<g:select name="field" from="${brokerMemberInstance.constraints.field.inList}" value="${brokerMemberInstance?.field}" valueMessagePrefix="brokerMember.field" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerMemberInstance, field: 'dateOfBirth', 'error')} required">
	<label for="dateOfBirth">
		<g:message code="brokerMember.dateOfBirth.label" default="Date Of Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfBirth" precision="day"  value="${brokerMemberInstance?.dateOfBirth}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerMemberInstance, field: 'nationalCode', 'error')} ">
	<label for="nationalCode">
		<g:message code="brokerMember.nationalCode.label" default="National Code" />
		
	</label>
	<g:textField name="nationalCode" value="${brokerMemberInstance?.nationalCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerMemberInstance, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="brokerMember.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="mobile" value="${brokerMemberInstance?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerMemberInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="brokerMember.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${brokerMemberInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerMemberInstance, field: 'certificates', 'error')} ">
	<label for="certificates">
		<g:message code="brokerMember.certificates.label" default="Certificates" />
		
	</label>
	<g:select name="certificates" from="${alms.ObtainedCertificate.list()}" multiple="multiple" optionKey="id" size="5" value="${brokerMemberInstance?.certificates*.id}" class="many-to-many"/>
</div>

