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

    %{--<link href="/alms/bootstrap/css/bootstrap.css" rel="stylesheet">--}%
    <link href="/alms/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/alms/bootstrap/css/bootstrap-theme.css" rel="stylesheet">
    <link href="/alms/datatables-bootstrap/dataTables.bootstrap.css" rel="stylesheet">

    %{--<link href="/alms/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">--}%

    %{--Datatables--}%
    <link href="/alms/DataTables/media/css/jquery.dataTables.css" rel="stylesheet">
    <link href="/alms/DataTables/media/css/jquery.dataTables.css" rel="stylesheet">
    <link href="/alms/DataTables/extensions/TableTools/css/dataTables.tableTools.css" rel="stylesheet">

    <g:layoutHead/>

    <script type="text/javascript" src="${resource(plugin: "jquery", dir: "js/jquery", file: "jquery-1.11.1.js")}"></script>
    <script type="text/javascript" src="/alms/DataTables/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="/alms/DataTables/extensions/TableTools/js/dataTables.tableTools.js"></script>

    <r:layoutResources/>
</head>

<body>

<div class="row" style="padding-top:30px;width: 100%">
    %{--<div class="col-md-3">--}%
    %{--<h1><img src="images/alms-small.png"style="margin:10px 10px 10px 10px"/></h1>--}%
    %{--</div>--}%

    <div class="col-md-9">
        <div class="btn-group pull-right">
            <a class="btn btn-primary active" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            <button type="button" class="btn btn-primary active">About Us</button>
            <button type="button" class="btn btn-primary active">Contact Us</button>
        </div>
    </div>
</div>

<g:layoutBody/>

<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>

<r:layoutResources/>
<script type="text/javascript" src="/alms/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="/alms/datatables-bootstrap/dataTables.bootstrap.js"></script>
</body>
</html>
