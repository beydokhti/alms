<%@ page import="alms.Curriculum" %>


<div class="form-group col-md-6">
    <label for="title" class="col-sm-4 control-label">
        <g:message code="curriculum.title.label" default="title" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="title" placeholder="title"
                     value="${curriculumInstance?.title}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="certificate" class="col-sm-4 control-label">
        <g:message code="curriculum.certificate.label" default="certificate" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="certificate.id" placeholder="certificate" from="${alms.Certificate.findAllByCerType("kanoon")}" optionKey="id"
                  value="${curriculumInstance?.certificate?.id}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="courses" class="col-sm-4 control-label">
        <g:message code="curriculum.courses.label" default="courses" />
    </label>
    <div class="col-sm-8">
        <g:select name="courses" from="${alms.Course.list()}" multiple="multiple" optionKey="id" size="5"
                  value="${curriculumInstance?.courses*.id}" class="many-to-many"/>
    </div>
</div>





