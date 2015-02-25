<%@ page import="alms.City" %>



<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'country', 'error')} required">
    <label for="country">
        <g:message code="city.country.label" default="Country"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="country" name="country.id" from="${alms.Country.list()}" optionKey="id" required=""
              value="${cityInstance?.country?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'title', 'error')} ">
    <label for="title">
        <g:message code="city.title.label" default="Title"/>

    </label>
    <g:textField name="title" value="${cityInstance?.title}"/>
</div>

