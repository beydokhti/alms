<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">

    %{--bootstrap--}%
    <link href="/alms/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/alms/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/alms/bootstrap/css/bootstrap-theme.css" rel="stylesheet">
    <link href="/alms/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">

    <g:layoutHead/>
    <g:javascript library="jquery"></g:javascript>
    <r:layoutResources/>
    %{--Datatables--}%
    %{--<script src="/alms/static/js/jquery.js" type="text/javascript" charset="UTF-8"></script>--}%
    %{--<script src="/alms/static/js/jquery.dataTables.min.js" type="text/javascript" charset="UTF-8"></script>--}%
    %{--<script src="/alms/static/js/jquery.dataTables.js" type="text/javascript" charset="UTF-8"></script>--}%

    %{--Bootstarp--}%

    <script src="/alms/bootstrap/js/bootstrap.js"></script>
    <script src="/alms/bootstrap/js/bootstrap.min.js"></script>

</head>

<body>
<div id="grailsLogo" role="banner"><img src="${resource(dir: 'images', file: 'alms-small.png')}" alt="LMS"/></div>
<g:layoutBody/>
<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<g:javascript library="application"/>
<g:javascript library="jquery"></g:javascript>
<r:layoutResources/>
</body>
</html>
