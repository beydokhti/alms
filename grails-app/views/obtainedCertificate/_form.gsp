<%@ page import="alms.ObtainedCertificate" %>



<div class="fieldcontain ${hasErrors(bean: obtainedCertificateInstance, field: 'certificate', 'error')} required">
	<label for="certificate">
		<g:message code="obtainedCertificate.certificate.label" default="Certificate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="certificate" name="certificate.id" from="${alms.Certificate.list()}" optionKey="id" required="" value="${obtainedCertificateInstance?.certificate?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: obtainedCertificateInstance, field: 'obtainedDate', 'error')} required">
	<label for="obtainedDate">
		<g:message code="obtainedCertificate.obtainedDate.label" default="Obtained Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="obtainedDate" precision="day"  value="${obtainedCertificateInstance?.obtainedDate}"  />
</div>

