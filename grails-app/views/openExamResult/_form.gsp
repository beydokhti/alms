<%@ page import="alms.OpenExamResult" %>
<g:hiddenField name="openExamId" value="${openExamId}"></g:hiddenField>


<div class="form-group col-md-6">
    <label for="person" class="col-sm-4 control-label">
        <g:message code="openExaxmResult.person.label" default="person" />
    </label>
    <div class="col-sm-8">
        <g:select class="form-control"   name="person.id" placeholder="person" from="${personList}" optionKey="id"
                  value="${openExaxmResultInstance?.person?.id}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="correctAnswer" class="col-sm-4 control-label">
        <g:message code="openExaxmResult.correctAnswer.label" default="correctAnswer" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="correctAnswer" placeholder="correctAnswer"
                     value="${openExaxmResultInstance?.correctAnswer}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="wrongAnswer" class="col-sm-4 control-label">
        <g:message code="openExaxmResult.wrongAnswer.label" default="wrongAnswer" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="wrongAnswer" placeholder="wrongAnswer"
                     value="${openExaxmResultInstance?.wrongAnswer}"/>
    </div>
</div>
<div class="form-group col-md-6">
    <label for="finalScore" class="col-sm-4 control-label">
        <g:message code="openExaxmResult.finalScore.label" default="finalScore" />
    </label>
    <div class="col-sm-8">
        <g:textField class="form-control"   name="finalScore" placeholder="finalScore"
                     value="${openExaxmResultInstance?.finalScore}"/>
    </div>
</div>

