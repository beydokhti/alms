<%@ page import="alms.OpenExamPolicy" %>

<g:hiddenField name="openExamId" value="${openExamId}"></g:hiddenField>


<div class="form-group col-md-6">

    <script>
        $().ready(function () {
            $('#discountPercentage').prop('disabled', true);
        });
        function updateRadio() {
            $('input[name="group"]').change(function () {
                if ($(this).val() == '1') {
                    $('#price').prop('disabled', false);
                    $('#discountPercentage').prop('disabled', true);
                    $('#discountPercentage').val(0);
                }
                if ($(this).val() == '2') {
                    $('#discountPercentage').prop('disabled', false);
                    $('#price').prop('disabled', true);
                    $('#price').val(0);

                }
            });
        }
    </script>

    <label for="title" class="col-sm-4 control-label">
        <g:message code="openExamPolicy.title.label" default="title"/>
    </label>

    <div class="col-sm-8">
        <g:textField class="form-control" name="title" placeholder="title"
                     value="${openExamPolicyInstance?.title}"/>
    </div>
</div>

<div class="form-group col-md-6">
    <label for="personGroup" class="col-sm-4 control-label">
        <g:message code="openExamPolicy.personGroup.label" default="personGroup"/>
    </label>

    <div class="col-sm-8">
        <g:select class="form-control" name="personGroup.id" placeholder="personGroup" from="${alms.PersonGroup.list()}"
                  optionKey="id"
                  value="${openExamPolicyInstance?.personGroup?.id}"/>
    </div>
</div>

<div class="form-group col-md-1">
    <input type="radio" id="group1" name="group" value="1" checked="checked" onchange="updateRadio()"/>
</div>

<div class="form-group col-md-5">
    <label for="price" class="col-sm-4 control-label">
        <g:message code="openExamPolicy.price.label" default="price"/>
    </label>

    <div class="col-sm-8">
        <g:textField id="price" class="form-control" name="price" placeholder="price"
                     value="${openExamPolicyInstance?.price}"/>
    </div>
</div>

<div class="form-group col-md-1">
    <input type="radio" id="group2" name="group" value="2" onchange="updateRadio()"/>
</div>

<div class="form-group col-md-5">
    <label for="discountPercentage" class="col-sm-4 control-label">
        <g:message code="openExamPolicy.discountPercentage.label" default="discountPercentage"/>
    </label>

    <div class="col-sm-8">
        <g:textField id="discountPercentage" class="form-control" name="discountPercentage"
                     placeholder="discountPercentage"
                     value="${openExamPolicyInstance?.discountPercentage}"/>
    </div>
</div>

