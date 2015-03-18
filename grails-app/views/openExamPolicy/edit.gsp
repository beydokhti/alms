<%@ page import="alms.OpenExamPolicy" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'openExamPolicy.label', default: 'OpenExamPolicy')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
    <script>
        <script>
        $(document).ready(function () {
            $('#mainForm')
                // IMPORTANT: You must declare .on('init.field.bv')
                // before calling .formValidation(options)
                    .on('init.field.fv', function (e, data) {
                        // data.fv      --> The FormValidation instance
                        // data.field   --> The field name
                        // data.element --> The field element

                        var $parent = data.element.parents('.form-group'),
                                $icon = $parent.find('.form-control-feedback[data-fv-icon-for="' + data.field + '"]');

                        // You can retrieve the icon element by
                        // $icon = data.element.data('fv.icon');

                        $icon.on('click.clearing', function () {
                            // Check if the field is valid or not via the icon class
                            if ($icon.hasClass('glyphicon-remove')) {
                                // Clear the field
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
                        locale:'fa_IR',
                        fields: {
                            title: {
                                validators: {
                                    notEmpty: {
                                    },
                                    stringLength: {
                                        max: 100
                                    }
                                }
                            },
                            price: {
                                validators: {
                                    digits:{
                                    }
                                }
                            },
                            discountPercentage: {
                                validators: {
                                    digits:{
                                    },
                                    between:{
                                        min:1,
                                        max:30000
                                    }

                                }
                            }
                        }
                    });
        });
    </script>
		<div id="edit-openExamPolicy" class="content scaffold-edit" role="main">
			<legend><g:message code="default.edit.label" args="[entityName]" /></legend>
			<g:if test="${flash.message}">
			<div class="alert alert-danger" role="alert">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${openExamPolicyInstance}">
			<ul class="alert alert-default" role="alert">
				<g:eachError bean="${openExamPolicyInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" name="maninForm">
				<g:hiddenField name="id" value="${openExamPolicyInstance?.id}" />
				<g:hiddenField name="version" value="${openExamPolicyInstance?.version}" />
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
