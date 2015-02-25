<%@ page import="alms.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="person.create.label" default="Create Person"/></title>
    %{--<script type="text/javascript">--}%
    %{--var loadOverlay = function (remoteAddress, saveAddress, saveCallback, loadCallback, params) {--}%
    %{--if (!params)--}%
    %{--params = {}--}%
    %{--$.ajaxSettings.traditional = true;--}%
    %{--$.ajax({--}%
    %{--type:"GET",--}%
    %{--url:remoteAddress--}%
    %{--}).done(function (response) {--}%
    %{--var r = $("#ajax-form" + remoteAddress.hashCode());--}%
    %{--if (!r.length)--}%
    %{--r = $("<form id='ajax-form" + remoteAddress.hashCode() + "' enctype='multipart/form-data' method='post' action='" + saveAddress + "'></form>")--}%
    %{--r.html("")--}%

    %{--r.dialog({--}%
    %{--modal:true,--}%
    %{--width:params.width,--}%
    %{--resizable:false,--}%
    %{--buttons:{--}%
    %{--'ذخیره':function () {--}%
    %{--if (params && params.beforeSubmit)--}%
    %{--params.beforeSubmit();--}%
    %{--//                                    r.ajaxSubmit({--}%
    %{--//                                        url:saveAddress,--}%
    %{--//                                        type:"post",--}%
    %{--//                                        success:function (resp) {--}%
    %{--//                                            if (params && params.afterSave)--}%
    %{--//                                                params.afterSave(resp)--}%
    %{--//                                            if (saveCallback) {--}%
    %{--//                                                saveCallback(resp)--}%
    %{--//                                            }--}%
    %{--//                                        }--}%
    %{--//                                    })--}%
    %{--r.submit()--}%
    %{--$(this).dialog("close");--}%
    %{--},--}%
    %{--"انصراف":function () {--}%
    %{--$(this).dialog("close");--}%
    %{--}--}%
    %{--},--}%
    %{--close:function () {--}%
    %{--r.html("")--}%
    %{--}--}%
    %{--})--}%
    %{--if (params && params.width) {--}%
    %{--r.dialog("option", "width", params.width)--}%
    %{--r.dialog("option", "position", "top")--}%
    %{--}--}%

    %{--r.append(response);--}%
    %{--if (loadCallback)--}%
    %{--loadCallback(response);--}%
    %{--});--}%
    %{--}--}%

    %{--function doAddCertificate() {--}%
    %{--loadOverlay('<g:createLink action="form" controller="obtainedCertificate" />',--}%
    %{--'<g:createLink action="saveObtCer" controller="obtainedCertificate" params="[personId:personInstance?.id]"/>',--}%
    %{--function () {--}%
    %{--window.location = "<g:createLink controller="person" action="show"  params="[id: 1]"/>"--}%
    %{--}, undefined, {width:400})--}%
    %{--}--}%

    %{--</script>--}%

</head>

<body>
%{--<a href="#create-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%
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
    <g:form action="save">
        <fieldset class="form-horizontal">
            <g:render template="form"/>
        </fieldset>

        <div class="col-md-12" style="height: 20px"></div>
        <fieldset class="buttons">
            <g:submitButton name="create" class="btn btn-primary active"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            <g:link class="btn btn-primary active" action="list"><g:message code="person.list.label"/></g:link>
        </fieldset>
    </g:form>

</div>
</body>
</html>
