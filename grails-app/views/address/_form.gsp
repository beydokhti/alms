<%@ page import="alms.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'address', 'error')} ">
    <label for="address">
        <g:message code="address.address.label" default="Address"/>

    </label>
    <g:textArea name="address" cols="40" rows="5" maxlength="1024" value="${addressInstance?.address}"/>
</div>

