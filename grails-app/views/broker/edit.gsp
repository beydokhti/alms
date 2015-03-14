<%@ page import="alms.Broker" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}"/>
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
                        brokerPersianName: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 100
                                }
                            }
                        },
                        brokerLatinName: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 100
                                }
                            }
                        },
                        registerDate: {
                            validators: {
                                notEmpty: {}
                            }
                        },
                        registerNo: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 50
                                }
                            }
                        },
                        registerLocation: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 100
                                }
                            }
                        },
                        seoRegisterDate: {
                            validators: {
                                notEmpty: {}
                            }
                        },
                        seoRegisterNo: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 50
                                }
                            }
                        },
                        clubMembershipNo: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 50
                                }
                            }
                        },
                        clubMembershipDate: {
                            validators: {
                                notEmpty: {},
                            }
                        },
                        registeredCapital: {
                            validators: {
                                notEmpty: {},
                                digits: {},
                                stringLength: {
                                    max: 100
                                }
                            }
                        },
                        paidCapital: {
                            validators: {
                                notEmpty: {},
                                digits: {},
                                stringLength: {
                                    max: 100
                                }
                            }
                        },
                        sharesNumber: {
                            validators: {
                                notEmpty: {},
                                digits: {},
                                stringLength: {
                                    max: 50
                                }
                            }
                        },
                        financialYearEndMonth: {
                            validators: {
                                notEmpty: {},
                                digits: {},
                                stringLength: {
                                    max: 2
                                }, between: {
                                    min: 1,
                                    max: 12
                                }
                            }
                        },
                        financialYearEndDay: {
                            validators: {
                                notEmpty: {},
                                digits: {},
                                stringLength: {
                                    max: 4
                                }, between: {
                                    min: 1,
                                    max: 31
                                }
                            }
                        },
                        nationalCode: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 11
                                }
                            }
                        },
                        economicCode: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 11
                                }
                            }
                        },
                        centralOfficeAddress: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 200
                                }
                            }
                        },
                        centralOfficePostalCode: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 10
                                }
                            }
                        },
                        POBox: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 15
                                }
                            }
                        },
                        website: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 100
                                }
                            }
                        },
                        email: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 100
                                }
                            }
                        },
                        tseRank: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 100
                                }
                            }
                        },
                        tseOrdinaryPoint: {
                            validators: {
                                digits: {},
                                between: {
                                    min: 0,
                                    max: 127
                                }
                            }
                        },
                        tseEncouragingPoint: {
                            validators: {
                                digits: {},
                                between: {
                                    min: 0,
                                    max: 127
                                }
                            }
                        },
                        imeRank: {
                            validators: {
                                notEmpty: {},
                                stringLength: {
                                    max: 100
                                }
                            }
                        },
                        imeOrdinaryPoint: {
                            validators: {
                                digits: {},
                                between: {
                                    min: 0,
                                    max: 127
                                }

                            }
                        },
                        imeEncouragingPoint: {
                            validators: {
                                digits: {},
                                between: {
                                    min: 0,
                                    max: 127
                                }

                            }
                        }
                    }
                });
    });

</script>

<div id="edit-broker" class="content scaffold-edit" role="main">
    <legend><g:message code="default.edit.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="alert">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${brokerInstance}">
        <ul class="alert alert-danger"role="alert">
            <g:eachError bean="${brokerInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form method="post" name="mainForm">
        <g:hiddenField name="id" value="${brokerInstance?.id}"/>
        <g:hiddenField name="version" value="${brokerInstance?.version}"/>
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
