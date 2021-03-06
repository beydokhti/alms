<%@ page import="alms.Curriculum" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'curriculum.label', default: 'Curriculum')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>


    <script>
        $(document).ready(function () {
            $('#mainForm')
                    .on('init.field.fv', function (e, data) {
                        var $parent = data.element.parents('.form-group'),
                                $icon = $parent.find('.form-control-feedback[data-fv-icon-for="' + data.field + '"]');
                        $icon.on('click.clearing', function () {
                            if ($icon.hasClass('glyphicon-remove')) {
                                data.fv.resetField(data.element);
                            }
                        });
                    })
                    .formValidation({
                        framework: 'bootstrap',
                        icon: {
                            valid: 'glyphicon glyphicon-ok',
                            invalid: 'glyphicon glyphicon-remove',
                            validating: 'glyphicon glyphicon-refresh'
                        },
                        locale: 'fa_IR',
                        fields: {
                            title: {
                                validators: {
                                    notEmpty: {},
                                    stringLength: {
                                        max: 100
                                    }
                                }
                            }
                        }
                    });
        });

    </script>
		<div id="edit-curriculum" class="content scaffold-edit" role="main">
			<legend><g:message code="default.edit.label" args="[entityName]" /></legend>
			<g:if test="${flash.message}">
			<div class="alert alert-danger" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${curriculumInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${curriculumInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" name="mainForm">
				<g:hiddenField name="id" value="${curriculumInstance?.id}" />
				<g:hiddenField name="version" value="${curriculumInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-default" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
