<%@ page import="alms.Certificate" %>


<div class="form-group col-md-6">
    <label for="cerType" class="col-sm-4 control-label">
        <g:message code="certificate.cerType.label" default="cerType" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="cerType" placeholder="cerType" from="${certificateInstance.constraints.cerType.inList}"
                  value="${certificateInstance?.cerType}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="cerTitle" class="col-sm-4 control-label">
        <g:message code="certificate.cerTitle.label" default="cerTitle" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="cerTitle" placeholder="cerTitle"
                     value="${certificateInstance?.cerTitle}"/>
    </div>
</div>
