
<%@ page import="alms.Curriculum" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'curriculum.label', default: 'Curriculum')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-curriculum" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-curriculum" class="content scaffold-show" role="main">
			<legend><g:message  code="default.show.label" args="[entityName]"/></legend>
			<g:if test="${flash.message}">
			<div class="alert alert-danger" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list curriculum">
			
				<g:if test="${curriculumInstance?.certificate}">
				<li class="fieldcontain">
					<span id="certificate-label" class="property-label"><g:message code="curriculum.certificate.label" default="Certificate" /></span>
					
						<span class="property-value" aria-labelledby="certificate-label"><g:link controller="certificate" action="show" id="${curriculumInstance?.certificate?.id}">${curriculumInstance?.certificate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${curriculumInstance?.terms}">
				<li class="fieldcontain">
					<span id="terms-label" class="property-label"><g:message code="curriculum.terms.label" default="Terms" /></span>
					
						<g:each in="${curriculumInstance.terms}" var="t">
						<span class="property-value" aria-labelledby="terms-label"><g:link controller="term" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${curriculumInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="curriculum.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${curriculumInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${curriculumInstance?.id}" />
					<g:link class="edit" action="edit" id="${curriculumInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
