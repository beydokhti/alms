<%@ page import="alms.Broker" %>




<div class="form-group col-md-6">
    <label for="brokerPersianName" class="col-sm-4 control-label">
        <g:message code="broker.brokerPersianName.label" default="brokerPersianName" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="brokerPersianName" placeholder="brokerPersianName"
                     value="${brokerInstance?.brokerPersianName}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="brokerLatinName" class="col-sm-4 control-label">
        <g:message code="broker.brokerLatinName.label" default="brokerLatinName" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="brokerLatinName" placeholder="brokerLatinName"
                     value="${brokerInstance?.brokerLatinName}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="registerDate" class="col-sm-4 control-label">
        <g:message code="broker.registerDate.label" default="registerDate" />
    </label>
    <div class="col-sm-8">
        <g:datePicker  class="form-control"  name="registerDate" precision="day"  value="${brokerInstance?.registerDate}" default="none" noSelection="['': '']" />
        %{--<g:textField class="form-control"   name="registerDate" placeholder="registerDate"--}%
                     %{--value="${brokerInstance?.registerDate}"/>--}%
    </div>
</div>
<div class="form-group col-md-6">
    <label for="registerNo" class="col-sm-4 control-label">
        <g:message code="broker.registerNo.label" default="registerNo" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="registerNo" placeholder="registerNo"
                     value="${brokerInstance?.registerNo}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="registerLocation" class="col-sm-4 control-label">
        <g:message code="broker.registerLocation.label" default="registerLocation" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="registerLocation" placeholder="registerLocation"
                     value="${brokerInstance?.registerLocation}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="seoRegisterDate" class="col-sm-4 control-label">
        <g:message code="broker.seoRegisterDate.label" default="seoRegisterDate" />
    </label>
    <div class="col-sm-8">
        <g:datePicker  class="form-control"  name="seoRegisterDate" precision="day"  value="${brokerInstance?.seoRegisterDate}" default="none" noSelection="['': '']" />
        %{--<g:textField class="form-control"   name="seoRegisterDate" placeholder="seoRegisterDate"--}%
                     %{--value="${brokerInstance?.seoRegisterDate}"/>--}%
    </div>
</div>
<div class="form-group col-md-6">
    <label for="seoRegisterNo" class="col-sm-4 control-label">
        <g:message code="broker.seoRegisterNo.label" default="seoRegisterNo" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="seoRegisterNo" placeholder="seoRegisterNo"
                     value="${brokerInstance?.seoRegisterNo}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="clubMembershipNo" class="col-sm-4 control-label">
        <g:message code="broker.clubMembershipNo.label" default="clubMembershipNo" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="clubMembershipNo" placeholder="clubMembershipNo"
                     value="${brokerInstance?.clubMembershipNo}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="clubMembershipDate" class="col-sm-4 control-label">
        <g:message code="broker.clubMembershipDate.label" default="clubMembershipDate" />
    </label>
    <div class="col-sm-8">
        %{--//todo replace date picker--}%
        <g:datePicker  class="form-control"  name="clubMembershipDate" precision="day"  value="${brokerInstance?.clubMembershipDate}" default="none" noSelection="['': '']" />
        %{--<g:textField class="form-control"   name="clubMembershipDate" placeholder="clubMembershipDate"--}%
                     %{--value="${brokerInstance?.clubMembershipDate}"/>--}%
    </div>
</div>
<div class="form-group col-md-6">
    <label for="registeredCapital" class="col-sm-4 control-label">
        <g:message code="broker.registeredCapital.label" default="registeredCapital" />
    </label>
    <div class="col-sm-8">
        <g:field type="number" class="form-control"   name="registeredCapital" placeholder="registeredCapital"
                 value="${brokerInstance?.registeredCapital}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="paidCapital" class="col-sm-4 control-label">
        <g:message code="broker.paidCapital.label" default="paidCapital" />
    </label>
    <div class="col-sm-8">
        <g:field type="number" class="form-control"   name="paidCapital" placeholder="paidCapital"
                 value="${brokerInstance?.paidCapital}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="sharesNumber" class="col-sm-4 control-label">
        <g:message code="broker.sharesNumber.label" default="sharesNumber" />
    </label>
    <div class="col-sm-8">
        <g:field type="number" class="form-control"   name="sharesNumber" placeholder="sharesNumber"
                 value="${brokerInstance?.sharesNumber}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="financialYearEndMonth" class="col-sm-4 control-label">
        <g:message code="broker.financialYearEndMonth.label" default="financialYearEndMonth" />
    </label>
    <div class="col-sm-8">
        <g:field type="number" class="form-control"   name="financialYearEndMonth" placeholder="financialYearEndMonth"
                 value="${brokerInstance?.financialYearEndMonth}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="financialYearEndDay" class="col-sm-4 control-label">
        <g:message code="broker.financialYearEndDay.label" default="financialYearEndDay" />
    </label>
    <div class="col-sm-8">
        <g:field type="number" class="form-control"   name="financialYearEndDay" placeholder="financialYearEndDay"
                 value="${brokerInstance?.financialYearEndDay}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="nationalCode" class="col-sm-4 control-label">
        <g:message code="broker.nationalCode.label" default="nationalCode" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="nationalCode" placeholder="nationalCode"
                     value="${brokerInstance?.nationalCode}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="economicCode" class="col-sm-4 control-label">
        <g:message code="broker.economicCode.label" default="economicCode" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="economicCode" placeholder="economicCode"
                     value="${brokerInstance?.economicCode}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="centralOfficeAddress" class="col-sm-4 control-label">
        <g:message code="broker.centralOfficeAddress.label" default="centralOfficeAddress" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="centralOfficeAddress" placeholder="centralOfficeAddress"
                     value="${brokerInstance?.centralOfficeAddress}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="centralOfficePostalCode" class="col-sm-4 control-label">
        <g:message code="broker.centralOfficePostalCode.label" default="centralOfficePostalCode" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="centralOfficePostalCode" placeholder="centralOfficePostalCode"
                     value="${brokerInstance?.centralOfficePostalCode}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="POBox" class="col-sm-4 control-label">
        <g:message code="broker.POBox.label" default="POBox" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="POBox" placeholder="POBox"
                     value="${brokerInstance?.POBox}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="website" class="col-sm-4 control-label">
        <g:message code="broker.website.label" default="website" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="website" placeholder="website"
                     value="${brokerInstance?.website}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="email" class="col-sm-4 control-label">
        <g:message code="broker.email.label" default="email" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="email" placeholder="email"
                     value="${brokerInstance?.email}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="tseRank" class="col-sm-4 control-label">
        <g:message code="broker.tseRank.label" default="tseRank" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="tseRank" placeholder="tseRank"
                     value="${brokerInstance?.tseRank}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="tseOrdinaryPoint" class="col-sm-4 control-label">
        <g:message code="broker.tseOrdinaryPoint.label" default="tseOrdinaryPoint" />
    </label>
    <div class="col-sm-8">
        <g:field type="number" class="form-control"   name="tseOrdinaryPoint" placeholder="tseOrdinaryPoint"
                 value="${brokerInstance?.tseOrdinaryPoint}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="tseEncouragingPoint" class="col-sm-4 control-label">
        <g:message code="broker.tseEncouragingPoint.label" default="tseEncouragingPoint" />
    </label>
    <div class="col-sm-8">
        <g:field type="number" class="form-control"   name="tseEncouragingPoint" placeholder="tseEncouragingPoint"
                 value="${brokerInstance?.tseEncouragingPoint}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="imeRank" class="col-sm-4 control-label">
        <g:message code="broker.imeRank.label" default="imeRank" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="imeRank" placeholder="imeRank"
                     value="${brokerInstance?.imeRank}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="imeOrdinaryPoint" class="col-sm-4 control-label">
        <g:message code="broker.imeOrdinaryPoint.label" default="imeOrdinaryPoint" />
    </label>
    <div class="col-sm-8">
        <g:field type="number" class="form-control"   name="imeOrdinaryPoint" placeholder="imeOrdinaryPoint"
                 value="${brokerInstance?.imeOrdinaryPoint}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="imeEncouragingPoint" class="col-sm-4 control-label">
        <g:message code="broker.imeEncouragingPoint.label" default="imeEncouragingPoint" />
    </label>
    <div class="col-sm-8">
        <g:field type="number" class="form-control"   name="imeEncouragingPoint" placeholder="imeEncouragingPoint"
                 value="${brokerInstance?.imeEncouragingPoint}"/>
    </div>
</div>


