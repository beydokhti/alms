
<%@ page import="alms.OpenExam" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'openExam.label', default: 'OpenExam')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-openExam" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-openExam" class="content scaffold-show" role="main">
			<legend><g:message code="default.show.label" args="[entityName]"/></legend>
			<g:if test="${flash.message}">
			<div class="alert alert-danger" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list openExam">
			
				<g:if test="${openExamInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="openExam.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${openExamInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${openExamInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="openExam.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${openExamInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${openExamInstance?.totalScore}">
				<li class="fieldcontain">
					<span id="totalScore-label" class="property-label"><g:message code="openExam.totalScore.label" default="totalScore" /></span>
					
						<span class="property-value" aria-labelledby="totalScore-label"><g:fieldValue bean="${openExamInstance}" field="totalScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${openExamInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="openExam.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${openExamInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${openExamInstance?.discounts}">
				<li class="fieldcontain">
					<span id="discounts-label" class="property-label"><g:message code="openExam.discounts.label" default="Discounts" /></span>
					
						<g:each in="${openExamInstance.discounts}" var="d">
						<span class="property-value" aria-labelledby="discounts-label"><g:link controller="discount" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${openExamInstance?.examEndTime}">
				<li class="fieldcontain">
					<span id="examEndTime-label" class="property-label"><g:message code="openExam.examEndTime.label" default="Exam End Time" /></span>
					
						<span class="property-value" aria-labelledby="examEndTime-label"><g:formatDate date="${openExamInstance?.examEndTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${openExamInstance?.examStartTime}">
				<li class="fieldcontain">
					<span id="examStartTime-label" class="property-label"><g:message code="openExam.examStartTime.label" default="Exam Start Time" /></span>
					
						<span class="property-value" aria-labelledby="examStartTime-label"><g:formatDate date="${openExamInstance?.examStartTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${openExamInstance?.passingScore}">
				<li class="fieldcontain">
					<span id="passingScore-label" class="property-label"><g:message code="openExam.passingScore.label" default="Passing Score" /></span>
					
						<span class="property-value" aria-labelledby="passingScore-label"><g:fieldValue bean="${openExamInstance}" field="passingScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${openExamInstance?.venue}">
				<li class="fieldcontain">
					<span id="venue-label" class="property-label"><g:message code="openExam.venue.label" default="Venue" /></span>
					
						<span class="property-value" aria-labelledby="venue-label"><g:fieldValue bean="${openExamInstance}" field="venue"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${openExamInstance?.id}" />
					<g:link class="edit" action="edit" id="${openExamInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
