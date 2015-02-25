<%@ page import="alms.Certificate" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'certificate.label', default: 'Certificate')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-certificate" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-certificate" class="content scaffold-list" role="main">
    <legend><g:message code="default.list.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="cerType"
                              title="${message(code: 'certificate.cerType.label', default: 'Cre Type')}"/>

            <g:sortableColumn property="cerTitle"
                              title="${message(code: 'certificate.cerTitle.label', default: 'Cer Title')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${certificateInstanceList}" status="i" var="certificateInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${certificateInstance.id}">${fieldValue(bean: certificateInstance, field: "cerType")}</g:link></td>

                <td>${fieldValue(bean: certificateInstance, field: "cerTitle")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${certificateInstanceTotal}"/>
    </div>
</div>
</body>
</html>
