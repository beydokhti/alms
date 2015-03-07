<%@ page import="alms.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="person.create.label" default="Create Person"/></title>

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
                                notEmpty: {},
                                stringLength: {
                                    max: 100
                                }
                            }
                        },
                        lastName: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 100
                                }
                            }
                        },
                        sex: {
                            validators: {
                                notEmpty: {}
                            }
                        },
                        degree: {
                            validators: {
                                notEmpty: {}
                            }
                        },
                        field: {
                            validators: {
                                notEmpty: {}
                            }
                        },

                        nationalCode: {
                            validators: {
                                notEmpty: {}
                            }
                        },
                        mobile: {
                            validators: {
                                stringLength: {
                                    max: 50
                                }
                            }
                        },
                        email: {
                            validators: {
                                stringLength: {
                                    max: 100
                                }
                            }
                        }
                    }
                });
    });

</script>

<div id="create-person" class="content scaffold-create" role="main">
    <legend><g:message code="person.create.label"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${personInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${personInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="save" class="form-horizontal" name="mainForm">
        <fieldset class="form-horizontal">
            <g:render template="form"/>
        </fieldset>

        <div class="col-md-12" style="height: 20px"></div>
        <fieldset class="buttons">
            <g:submitButton name="create" class="btn btn-default"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>

</div>
</body>
</html>
