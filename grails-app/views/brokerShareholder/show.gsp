
<%@ page import="alms.BrokerShareholder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'brokerShareholder.label', default: 'BrokerShareholder')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-brokerShareholder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-brokerShareholder" class="content scaffold-show" role="main">
			<legend><g:message code="default.show.label" args="[entityName]" /></legend>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list brokerShareholder">
			
				<g:if test="${brokerShareholderInstance?.shareholderName}">
				<li class="fieldcontain">
					<span id="shareholderName-label" class="property-label"><g:message code="brokerShareholder.shareholderName.label" default="Shareholder Name" /></span>
					
						<span class="property-value" aria-labelledby="shareholderName-label"><g:fieldValue bean="${brokerShareholderInstance}" field="shareholderName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerShareholderInstance?.ownershipType}">
				<li class="fieldcontain">
					<span id="ownershipType-label" class="property-label"><g:message code="brokerShareholder.ownershipType.label" default="Ownership Type" /></span>
					
						<span class="property-value" aria-labelledby="ownershipType-label"><g:fieldValue bean="${brokerShareholderInstance}" field="ownershipType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerShareholderInstance?.ownershipPercent}">
				<li class="fieldcontain">
					<span id="ownershipPercent-label" class="property-label"><g:message code="brokerShareholder.ownershipPercent.label" default="Ownership Percent" /></span>
					
						<span class="property-value" aria-labelledby="ownershipPercent-label"><g:fieldValue bean="${brokerShareholderInstance}" field="ownershipPercent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerShareholderInstance?.sharesCount}">
				<li class="fieldcontain">
					<span id="sharesCount-label" class="property-label"><g:message code="brokerShareholder.sharesCount.label" default="Shares Count" /></span>
					
						<span class="property-value" aria-labelledby="sharesCount-label"><g:fieldValue bean="${brokerShareholderInstance}" field="sharesCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerShareholderInstance?.representativeOnBoard}">
				<li class="fieldcontain">
					<span id="representativeOnBoard-label" class="property-label"><g:message code="brokerShareholder.representativeOnBoard.label" default="Representative On Board" /></span>
					
						<span class="property-value" aria-labelledby="representativeOnBoard-label"><g:fieldValue bean="${brokerShareholderInstance}" field="representativeOnBoard"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerShareholderInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="brokerShareholder.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${brokerShareholderInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${brokerShareholderInstance?.id}" />
					<g:link class="edit" action="edit" id="${brokerShareholderInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
