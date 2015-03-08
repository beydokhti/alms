<%@ page import="alms.InstitutionMember" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerMember.label', default: 'InstitutionMember')}"/>
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
                        name: {
                            validators: {
                                notEmpty: {}
                            }
                        },
                        lastName: {
                            validators: {
                                notEmpty: {}
                            }
                        },
                        startDate: {
                            validators: {
                                notEmpty: {}
                            }
                        },
                        dateOfBirth: {
                            validators: {
                                notEmpty: {}
                            }
                        },
                        nationalCode: {
                            validators: {
                                notEmpty: {},
                                digits: {}
                            }
                        },
                        mobile: {
                            validators: {
                                digits: {}
                            }
                        }
                    }
                });
    });

</script>

<div id="create-institutionMember" class="content scaffold-create" role="main">
    <legend><g:message code="default.create.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${institutionMemberInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${institutionMemberInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="saveAll"  name="mainForm">
        <fieldset class="form-horizontal">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="btn btn-default"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
