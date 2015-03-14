<%@ page import="alms.City" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'city.label', default: 'City')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-city" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-city" class="content scaffold-list" role="main">
    <legend><g:message code="default.list.label" args="[entityName]"/></legend>
    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="alert">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="city.country.label" default="Country"/></th>

            <g:sortableColumn property="title" title="${message(code: 'city.title.label', default: 'Title')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${cityInstanceList}" status="i" var="cityInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${cityInstance.id}">${fieldValue(bean: cityInstance, field: "country")}</g:link></td>

                <td>${fieldValue(bean: cityInstance, field: "title")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${cityInstanceTotal}"/>
    </div>
</div>
</body>
</html>
