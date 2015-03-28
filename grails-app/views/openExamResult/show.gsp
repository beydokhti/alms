<%@ page import="alms.OpenExamResult" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'openExamResult.label', default: 'OpenExamResult')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-openExamResult" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                     default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-openExamResult" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list openExamResult">

        <g:if test="${openExamResultInstance?.openExam}">
            <li class="fieldcontain">
                <span id="openExam-label" class="property-label"><g:message code="openExamResult.openExam.label"
                                                                            default="Open Exam"/></span>

                <span class="property-value" aria-labelledby="openExam-label"><g:link controller="openExam"
                                                                                      action="show"
                                                                                      id="${openExamResultInstance?.openExam?.id}">${openExamResultInstance?.openExam?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${openExamResultInstance?.person}">
            <li class="fieldcontain">
                <span id="person-label" class="property-label"><g:message code="openExamResult.person.label"
                                                                          default="Person"/></span>

                <span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show"
                                                                                    id="${openExamResultInstance?.person?.id}">${openExamResultInstance?.person?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${openExamResultInstance?.finalScore}">
            <li class="fieldcontain">
                <span id="finalScore-label" class="property-label"><g:message code="openExamResult.finalScore.label"
                                                                              default="Final Score"/></span>

                <span class="property-value" aria-labelledby="finalScore-label"><g:fieldValue
                        bean="${openExamResultInstance}" field="finalScore"/></span>

            </li>
        </g:if>

        <g:if test="${openExamResultInstance?.correctAnswer}">
            <li class="fieldcontain">
                <span id="correctAnswer-label" class="property-label"><g:message
                        code="openExamResult.correctAnswer.label" default="Correct Answer"/></span>

                <span class="property-value" aria-labelledby="correctAnswer-label"><g:fieldValue
                        bean="${openExamResultInstance}" field="correctAnswer"/></span>

            </li>
        </g:if>

        <g:if test="${openExamResultInstance?.wrongAnswer}">
            <li class="fieldcontain">
                <span id="wrongAnswer-label" class="property-label"><g:message code="openExamResult.wrongAnswer.label"
                                                                               default="Wrong Answer"/></span>

                <span class="property-value" aria-labelledby="wrongAnswer-label"><g:fieldValue
                        bean="${openExamResultInstance}" field="wrongAnswer"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${openExamResultInstance?.id}"/>
            <g:link class="edit" action="edit" id="${openExamResultInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
