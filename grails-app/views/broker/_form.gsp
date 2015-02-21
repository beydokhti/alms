<%@ page import="alms.Broker" %>



<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'brokerPersianName', 'error')} ">
	<label for="brokerPersianName">
		<g:message code="broker.brokerPersianName.label" default="Broker Persian Name" />
		
	</label>
	<g:textField name="brokerPersianName" value="${brokerInstance?.brokerPersianName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'brokerLatinName', 'error')} ">
	<label for="brokerLatinName">
		<g:message code="broker.brokerLatinName.label" default="Broker Latin Name" />
		
	</label>
	<g:textField name="brokerLatinName" value="${brokerInstance?.brokerLatinName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'registerDate', 'error')} required">
	<label for="registerDate">
		<g:message code="broker.registerDate.label" default="Register Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="registerDate" precision="day"  value="${brokerInstance?.registerDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'registerNo', 'error')} ">
	<label for="registerNo">
		<g:message code="broker.registerNo.label" default="Register No" />
		
	</label>
	<g:textField name="registerNo" value="${brokerInstance?.registerNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'registerLocation', 'error')} ">
	<label for="registerLocation">
		<g:message code="broker.registerLocation.label" default="Register Location" />
		
	</label>
	<g:textField name="registerLocation" value="${brokerInstance?.registerLocation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'seoRegisterDate', 'error')} required">
	<label for="seoRegisterDate">
		<g:message code="broker.seoRegisterDate.label" default="Seo Register Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="seoRegisterDate" precision="day"  value="${brokerInstance?.seoRegisterDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'seoRegisterNo', 'error')} ">
	<label for="seoRegisterNo">
		<g:message code="broker.seoRegisterNo.label" default="Seo Register No" />
		
	</label>
	<g:textField name="seoRegisterNo" value="${brokerInstance?.seoRegisterNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'clubMembershipNo', 'error')} ">
	<label for="clubMembershipNo">
		<g:message code="broker.clubMembershipNo.label" default="Club Membership No" />
		
	</label>
	<g:textField name="clubMembershipNo" value="${brokerInstance?.clubMembershipNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'clubMembershipDate', 'error')} required">
	<label for="clubMembershipDate">
		<g:message code="broker.clubMembershipDate.label" default="Club Membership Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="clubMembershipDate" precision="day"  value="${brokerInstance?.clubMembershipDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'registeredCapital', 'error')} required">
	<label for="registeredCapital">
		<g:message code="broker.registeredCapital.label" default="Registered Capital" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="registeredCapital" type="number" value="${brokerInstance.registeredCapital}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'paidCapital', 'error')} required">
	<label for="paidCapital">
		<g:message code="broker.paidCapital.label" default="Paid Capital" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="paidCapital" type="number" value="${brokerInstance.paidCapital}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'sharesNumber', 'error')} required">
	<label for="sharesNumber">
		<g:message code="broker.sharesNumber.label" default="Shares Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sharesNumber" type="number" value="${brokerInstance.sharesNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'financialYearEndMonth', 'error')} required">
	<label for="financialYearEndMonth">
		<g:message code="broker.financialYearEndMonth.label" default="Financial Year End Month" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="financialYearEndMonth" type="number" value="${brokerInstance.financialYearEndMonth}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'financialYearEndDay', 'error')} required">
	<label for="financialYearEndDay">
		<g:message code="broker.financialYearEndDay.label" default="Financial Year End Day" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="financialYearEndDay" type="number" value="${brokerInstance.financialYearEndDay}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'nationalCode', 'error')} ">
	<label for="nationalCode">
		<g:message code="broker.nationalCode.label" default="National Code" />
		
	</label>
	<g:textField name="nationalCode" value="${brokerInstance?.nationalCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'economicCode', 'error')} ">
	<label for="economicCode">
		<g:message code="broker.economicCode.label" default="Economic Code" />
		
	</label>
	<g:textField name="economicCode" value="${brokerInstance?.economicCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'centralOfficeAddress', 'error')} ">
	<label for="centralOfficeAddress">
		<g:message code="broker.centralOfficeAddress.label" default="Central Office Address" />
		
	</label>
	<g:textField name="centralOfficeAddress" value="${brokerInstance?.centralOfficeAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'centralOfficePostalCode', 'error')} ">
	<label for="centralOfficePostalCode">
		<g:message code="broker.centralOfficePostalCode.label" default="Central Office Postal Code" />
		
	</label>
	<g:textField name="centralOfficePostalCode" value="${brokerInstance?.centralOfficePostalCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'POBox', 'error')} ">
	<label for="POBox">
		<g:message code="broker.POBox.label" default="POB ox" />
		
	</label>
	<g:textField name="POBox" value="${brokerInstance?.POBox}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'website', 'error')} ">
	<label for="website">
		<g:message code="broker.website.label" default="Website" />
		
	</label>
	<g:textField name="website" value="${brokerInstance?.website}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="broker.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${brokerInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'tseRank', 'error')} ">
	<label for="tseRank">
		<g:message code="broker.tseRank.label" default="Tse Rank" />
		
	</label>
	<g:textField name="tseRank" value="${brokerInstance?.tseRank}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'tseOrdinaryPoint', 'error')} ">
	<label for="tseOrdinaryPoint">
		<g:message code="broker.tseOrdinaryPoint.label" default="Tse Ordinary Point" />
		
	</label>
	<g:field name="tseOrdinaryPoint" type="number" value="${brokerInstance.tseOrdinaryPoint}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'tseEncouragingPoint', 'error')} ">
	<label for="tseEncouragingPoint">
		<g:message code="broker.tseEncouragingPoint.label" default="Tse Encouraging Point" />
		
	</label>
	<g:field name="tseEncouragingPoint" type="number" value="${brokerInstance.tseEncouragingPoint}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'imeRank', 'error')} ">
	<label for="imeRank">
		<g:message code="broker.imeRank.label" default="Ime Rank" />
		
	</label>
	<g:textField name="imeRank" value="${brokerInstance?.imeRank}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'imeOrdinaryPoint', 'error')} ">
	<label for="imeOrdinaryPoint">
		<g:message code="broker.imeOrdinaryPoint.label" default="Ime Ordinary Point" />
		
	</label>
	<g:field name="imeOrdinaryPoint" type="number" value="${brokerInstance.imeOrdinaryPoint}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'imeEncouragingPoint', 'error')} ">
	<label for="imeEncouragingPoint">
		<g:message code="broker.imeEncouragingPoint.label" default="Ime Encouraging Point" />
		
	</label>
	<g:field name="imeEncouragingPoint" type="number" value="${brokerInstance.imeEncouragingPoint}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'brokerBranches', 'error')} ">
	<label for="brokerBranches">
		<g:message code="broker.brokerBranches.label" default="Broker Branches" />
		
	</label>
	<g:select name="brokerBranches" from="${alms.BrokerBranch.list()}" multiple="multiple" optionKey="id" size="5" value="${brokerInstance?.brokerBranches*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'brokerInvestmentFounds', 'error')} ">
	<label for="brokerInvestmentFounds">
		<g:message code="broker.brokerInvestmentFounds.label" default="Broker Investment Founds" />
		
	</label>
	<g:select name="brokerInvestmentFounds" from="${alms.BrokerInvestmentFund.list()}" multiple="multiple" optionKey="id" size="5" value="${brokerInstance?.brokerInvestmentFounds*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'brokerLicenses', 'error')} ">
	<label for="brokerLicenses">
		<g:message code="broker.brokerLicenses.label" default="Broker Licenses" />
		
	</label>
	<g:select name="brokerLicenses" from="${alms.BrokerLicense.list()}" multiple="multiple" optionKey="id" size="5" value="${brokerInstance?.brokerLicenses*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'brokerMembers', 'error')} ">
	<label for="brokerMembers">
		<g:message code="broker.brokerMembers.label" default="Broker Members" />
		
	</label>
	<g:select name="brokerMembers" from="${alms.BrokerMember.list()}" multiple="multiple" optionKey="id" size="5" value="${brokerInstance?.brokerMembers*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'brokerPortfolios', 'error')} ">
	<label for="brokerPortfolios">
		<g:message code="broker.brokerPortfolios.label" default="Broker Portfolios" />
		
	</label>
	<g:select name="brokerPortfolios" from="${alms.BrokerPortfolio.list()}" multiple="multiple" optionKey="id" size="5" value="${brokerInstance?.brokerPortfolios*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'brokerShareholders', 'error')} ">
	<label for="brokerShareholders">
		<g:message code="broker.brokerShareholders.label" default="Broker Shareholders" />
		
	</label>
	<g:select name="brokerShareholders" from="${alms.BrokerShareholder.list()}" multiple="multiple" optionKey="id" size="5" value="${brokerInstance?.brokerShareholders*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'brokerTradingStations', 'error')} ">
	<label for="brokerTradingStations">
		<g:message code="broker.brokerTradingStations.label" default="Broker Trading Stations" />
		
	</label>
	<g:select name="brokerTradingStations" from="${alms.BrokerTradingStation.list()}" multiple="multiple" optionKey="id" size="5" value="${brokerInstance?.brokerTradingStations*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'centralOfficeFaxes', 'error')} ">
	<label for="centralOfficeFaxes">
		<g:message code="broker.centralOfficeFaxes.label" default="Central Office Faxes" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'centralOfficePhones', 'error')} ">
	<label for="centralOfficePhones">
		<g:message code="broker.centralOfficePhones.label" default="Central Office Phones" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'institutions', 'error')} ">
	<label for="institutions">
		<g:message code="broker.institutions.label" default="Institutions" />
		
	</label>
	<g:select name="institutions" from="${alms.Institution.list()}" multiple="multiple" optionKey="id" size="5" value="${brokerInstance?.institutions*.id}" class="many-to-many"/>
</div>

