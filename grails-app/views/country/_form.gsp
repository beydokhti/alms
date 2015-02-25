<%@ page import="alms.Country" %>



<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'title', 'error')} ">
    <label for="title">
        <g:message code="country.title.label" default="Title"/>

    </label>
    <g:textField name="title" value="${countryInstance?.title}"/>
</div>

