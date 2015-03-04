<%@ page import="alms.BrokerLicense" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerLicense.label', default: 'BrokerLicense')}"/>
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
                        displayOrder: {
                            validators: {
                                notEmpty: {},
                                digits: {},
                                between: {
                                    min: 1,
                                    max: 127
                                }

                            }
                        },
                        title1: {
                            validators: {
                                stringLength: {
                                    max: 100
                                }
                            }
                        },
                        title2: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 100
                                }
                            }
                        },

                        licenseNumber: {
                            validators: {
                                digits: {},
                                stringLength: {
                                    max: 100
                                }
                            }
                        }
                    }
                });
    });

</script>

<div id="create-brokerLicense" class="content scaffold-create" role="main">
    <legend><g:message code="default.create.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${brokerLicenseInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${brokerLicenseInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="save"  name="mainForm">
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
