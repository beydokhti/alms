<%@ page import="alms.Certificate" %>



<div class="fieldcontain ${hasErrors(bean: certificateInstance, field: 'cerType', 'error')} ">
    <label for="cerType">
        <g:message code="certificate.cerType.label" default="Cre Type"/>

    </label>
    <g:select name="cerType" from="${certificateInstance.constraints.cerType.inList}"
              value="${certificateInstance?.cerType}" valueMessagePrefix="certificate.cerType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: certificateInstance, field: 'cerTitle', 'error')} ">
    <label for="cerTitle">
        <g:message code="certificate.cerTitle.label" default="Cer Title"/>

    </label>
    <g:textField name="cerTitle" value="${certificateInstance?.cerTitle}"/>
</div>

