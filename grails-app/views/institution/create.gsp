<%@ page import="alms.Institution" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'institution.label', default: 'Institution')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
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
                                notEmpty: {} ,
                                stringLength: {
                                    max: 200
                                }
                            }
                        },
                        nationalCode: {
                            validators: {
                                notEmpty: {},
                                digits: {} ,
                                stringLength: {
                                    max: 50
                                }
                            }
                        },
                        registerNumber: {
                            validators: {
                                notEmpty: {},
                                digits: {}  ,
                                stringLength: {
                                    max: 50
                                }
                            }
                        },
                        address: {
                            validators: {
                                stringLength: {
                                    max: 200
                                }
                            }
                        },
                        fax: {
                            validators: {
                                stringLength: {
                                    max: 50
                                }
                            }
                        },
                        email: {
                            validators: {
                                stringLength: {
                                    max: 50
                                }
                            }
                        }
                    }
                });
    });

</script>

<div id="create-institution" class="content scaffold-create" role="main">
    <legend><g:message code="default.create.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${institutionInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${institutionInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="save" class="form-horizontal" name="mainForm">
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
