
<%@ page import="alms.OpenExamPolicy" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'openExamPolicy.label', default: 'OpenExamPolicy')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-openExamPolicy" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-openExamPolicy" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list openExamPolicy">
			
				<g:if test="${openExamPolicyInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="openExamPolicy.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${openExamPolicyInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${openExamPolicyInstance?.personGroup}">
				<li class="fieldcontain">
					<span id="personGroup-label" class="property-label"><g:message code="openExamPolicy.personGroup.label" default="Person Group" /></span>
					
						<span class="property-value" aria-labelledby="personGroup-label"><g:link controller="personGroup" action="show" id="${openExamPolicyInstance?.personGroup?.id}">${openExamPolicyInstance?.personGroup?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${openExamPolicyInstance?.discountPercentage}">
				<li class="fieldcontain">
					<span id="discountPercentage-label" class="property-label"><g:message code="openExamPolicy.discountPercentage.label" default="Discount Percentage" /></span>
					
						<span class="property-value" aria-labelledby="discountPercentage-label"><g:fieldValue bean="${openExamPolicyInstance}" field="discountPercentage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${openExamPolicyInstance?.openExam}">
				<li class="fieldcontain">
					<span id="openExam-label" class="property-label"><g:message code="openExamPolicy.openExam.label" default="Open Exam" /></span>
					
						<span class="property-value" aria-labelledby="openExam-label"><g:link controller="openExam" action="show" id="${openExamPolicyInstance?.openExam?.id}">${openExamPolicyInstance?.openExam?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${openExamPolicyInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="openExamPolicy.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${openExamPolicyInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${openExamPolicyInstance?.id}" />
					<g:link class="edit" action="edit" id="${openExamPolicyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
