<%@ page import="alms.BrokerMember" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brokerMember.label', default: 'BrokerMember')}"/>
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

<div id="edit-brokerMember" class="content scaffold-edit" role="main">
    <legend><g:message code="default.edit.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${brokerMemberInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${brokerMemberInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form method="post"  name="mainForm">
        <g:hiddenField name="id" value="${brokerMemberInstance?.id}"/>
        <g:hiddenField name="version" value="${brokerMemberInstance?.version}"/>
        <fieldset class="form-horizontal">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="btn btn-default" action="update"
                            value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            <g:actionSubmit class="btn btn-default" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate=""
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
