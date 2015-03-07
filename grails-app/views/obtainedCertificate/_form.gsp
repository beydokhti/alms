<%@ page import="alms.ObtainedCertificate" %>
<g:hiddenField name="personId" value="${personId}"></g:hiddenField>


<div class="form-group col-md-6">
    <label for="certificate" class="col-sm-4 control-label">
        <g:message code="obtainedCertificate.certificate.label" default="certificate" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="certificate.id" placeholder="certificate" from="${alms.Certificate.list()}" optionKey="id"
                  value="${obtainedCertificateInstance?.certificate?.id}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="obtainedDate" class="col-sm-4 control-label">
        <g:message code="obtainedCertificate.obtainedDate.label" default="obtainedDate" />
    </label>
    <div class="col-sm-8">
        <g:datePicker class="form-control" name="obtainedDate" precision="day" value="${obtainedCertificateInstance?.obtainedDate}"
                      default="none" noSelection="['': '']"/>
    </div>
</div>
