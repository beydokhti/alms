<%@ page import="alms.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'change.password.label', default: 'Change Password')}"/>
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
                        title1: {
                            validators: {
                                notEmpty: {}
                            }
                        },
                        title2: {
                            validators: {
                                notEmpty: {}
                            }
                        },
                        companyName: {
                            validators: {
                                notEmpty: {}
                            }
                        }
                    }
                });
    });

</script>

<div id="create-brokerSoftware" class="content scaffold-create" role="main">
    <legend><g:message code="default.create.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:form action="save"  name="mainForm">
        <fieldset class="form-horizontal">
            <div class="form-group col-md-12">
                <label for="oldPassword" class="col-sm-4 control-label">
                    <g:message code="old.password.title1.label" default="Old Password" />
                </label>
                <div class="col-sm-4">
                    <g:textField class="form-control"   name="oldPassword" placeholder="Old Password"/>
                </div>
            </div>

            <div class="form-group col-md-12">
                <label for="oldPassword" class="col-sm-4 control-label">
                    <g:message code="new.password.title1.label" default="New Password" />
                </label>
                <div class="col-sm-4">
                    <g:textField class="form-control"   name="newPassword" placeholder="New Password"/>
                </div>
            </div>
            <div class="form-group col-md-12">
                <label for="oldPassword" class="col-sm-4 control-label">
                    <g:message code="repeat.password.title1.label" default="repeat Password" />
                </label>
                <div class="col-sm-4">
                    <g:textField class="form-control"   name="repeatPassword" placeholder="Repeat Password"/>
                </div>
            </div>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="save" class="btn btn-default"
                            value="${message(code: 'default.button.save.label', default: 'Save')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
