<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <g:layoutTitle default="Grails-Bootstrap"/>

    <link href="${resource(dir: "bootstrap/css", file: "bootstrap.min.css")}" rel="stylesheet">
    <link href="${resource(dir: "bootstrap-rtl/css", file: "bootstrap-rtl.min.css")}" rel="stylesheet">
    <link href="${resource(dir: "datatables-bootstrap", file: "dataTables.bootstrap.css")}" rel="stylesheet">
    <link href="${resource(dir: "DataTables-rtl", file: "DataTables-rtl.css")}" rel="stylesheet">
    <link href="${resource(dir: "formValidator/css", file: "formValidation.css")}" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

    <script type="text/javascript"
            src="${resource(plugin: "jquery", dir: "js/jquery", file: "jquery-1.11.1.min.js")}"></script>
    <script type="text/javascript"
            src="${resource(dir: "DataTables/media/js", file: "jquery.dataTables.min.js")}"></script>
    %{--todo mtb attach .j or .min.js--}%
    <script type="text/javascript"
            src="${resource(dir: "formValidator/js", file: "formValidation.js")}"></script>
    <script type="text/javascript"
            src="${resource(dir: "formValidator/js/framework", file: "bootstrap.js")}"></script>
    <script type="text/javascript"
            src="${resource(dir: "formValidator/js/language/", file: "fa_IR.js")}"></script>
    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">${message(code: "Project.name", default: "Project name")}</a>
        </div>

        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${createLink(uri: "/")}"><g:message code="default.home.label"
                                                                                default="Home"/></a></li>

                <sec:ifAnyGranted roles="PersonRole,AdminRole,BrokerRole,InstitutionRole">
                    <li><g:link action="index" controller="logout"><g:message code="default.logout.label"
                                                                              default="Logout"/></g:link></li>
                </sec:ifAnyGranted>

                <sec:ifNotLoggedIn>
                    <li><g:link action="index" controller="login"><g:message code="default.login.label"
                                                                              default="Login"/></g:link></li>
                </sec:ifNotLoggedIn>
            %{--<li><a href="#contact">Contact</a></li>--}%
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
%{--todo mtb width:=1170px ? --}%
<div class="container" style="width:1270px">
    <br><br>

    <div class="row-fluid">
        <div class="col-md-2">

        %{--admin sidemenu--}%
            <sec:ifAllGranted roles="AdminRole">
                <div class="well sidebar-nav">

                    <ul class="nav nav-list">
                        <li class="nav-header">${message(code: "Sidebar.broker", default: "Broker")}</li>

                        <li class="active">
                            <g:link controller="broker" action="list">
                                ${message(code: "Sidebar.broker.management", default: "Broker Management")}
                            </g:link>
                        </li>

                        <li class="nav-header">${message(code: "Sidebar.institution", default: "Institution")}</li>

                        <li class="active">
                            <g:link controller="institution" action="list">
                                ${message(code: "Sidebar.institution.management", default: "Institution Management")}
                            </g:link>
                        </li>

                        <li class="nav-header">${message(code: "Sidebar.person", default: "Person")}</li>

                        <li class="active">
                            <g:link controller="person" action="list">
                                ${message(code: "Sidebar.person.management", default: "Person Management")}
                            </g:link>
                        </li>

                        <li class="nav-header">${message(code: "Sidebar.course", default: "Course")}</li>

                        <li>
                            <g:link controller="course" action="list">
                                ${message(code: "Sidebar.course.definition", default: "Course Definition")}
                            </g:link>
                        </li>

                        <li>
                            <g:link controller="discount" action="list">
                                ${message(code: "Sidebar.discount.definition", default: "Discount Definition")}
                            </g:link>
                        </li>

                        <li>
                            <g:link controller="exam" action="list">
                                ${message(code: "Sidebar.exam.definition", default: "Exam Definition")}
                            </g:link>
                        </li>

                        <li>
                            <g:link controller="user" action="changePassword">
                                ${message(code: "Sidebar.changePassword", default: "Change Password")}
                            </g:link>
                        </li>

                    </ul>

                </div><!--/.well -->
            </sec:ifAllGranted>

        %{--Broker menu--}%
            <sec:ifAllGranted roles="BrokerRole">
                <div class="well sidebar-nav">
                    <ul class="nav nav-list">
                        <li>
                            <g:link controller="brokerBranch" action="list">
                                ${message(code: "Sidebar.broker.branch", default: "Branch Definition")}
                            </g:link>
                        </li>

                        <li>
                            <g:link controller="brokerInvestmentFund" action="list">
                                ${message(code: "Sidebar.broker.investmentFund", default: "Investment Fund Definition")}
                            </g:link>
                        </li>

                        <li>
                            <g:link controller="brokerLicense" action="list">
                                ${message(code: "Sidebar.broker.License", default: "Licence Definition")}
                            </g:link>
                        </li>

                        <li>
                            <g:link controller="brokerMember" action="list">
                                ${message(code: "Sidebar.broker.member", default: "Member Definition")}
                            </g:link>
                        </li>

                        <li>
                            <g:link controller="brokerPortfolio" action="list">
                                ${message(code: "Sidebar.broker.portfolio", default: "Portfolio Definition")}
                            </g:link>
                        </li>

                        <li>
                            <g:link controller="brokerSoftware" action="list">
                                ${message(code: "Sidebar.broker.software", default: "Software Definition")}
                            </g:link>
                        </li>

                        <li>
                            <g:link controller="brokerTradingStation" action="list">
                                ${message(code: "Sidebar.broker.tradingStation", default: "Trading Station Definition")}
                            </g:link>
                        </li>

                        <li>
                            <g:link controller="broker" action="show">
                                ${message(code: "Sidebar.broker.profile", default: "Profile")}
                            </g:link>
                        </li>

                        <li>
                            <g:link controller="user" action="changePassword">
                                ${message(code: "Sidebar.changePassword", default: "Change Password")}
                            </g:link>
                        </li>
                    </ul>
                </div><!--/.well -->
            </sec:ifAllGranted>
        %{--InstitutionRole menu--}%
            <sec:ifAllGranted roles="InstitutionRole">
                <div class="well sidebar-nav">
                    <ul class="nav nav-list">
                        <li>
                            <g:link controller="institutionMember" action="list">
                                ${message(code: "Sidebar.institution.member", default: "Member Definition")}
                            </g:link>
                        </li>

                        <li>
                            <g:link controller="institution" action="show">
                                ${message(code: "Sidebar.institution.profile", default: "Profile")}
                            </g:link>
                        </li>

                        <li>
                            <g:link controller="user" action="changePassword">
                                ${message(code: "Sidebar.changePassword", default: "Change Password")}
                            </g:link>
                        </li>

                    </ul>
                </div><!--/.well -->
            </sec:ifAllGranted>

        %{--person menu--}%
            <sec:ifAllGranted roles="PersonRole">
                        <div class="well sidebar-nav">
                            <ul class="nav nav-list">
                                <li>
                                    <g:link controller="registeredEvent" action="list">
                                        ${message(code: "Sidebar.person.registeredEvent", default: "Register Definition")}
                                    </g:link>
                                </li>

                                <li>
                                    <g:link controller="person" action="show">
                                        ${message(code: "Sidebar.person.profile", default: "Profile")}
                                    </g:link>
                                </li>

                                <li>
                                    <g:link controller="user" action="changePassword">
                                        ${message(code: "Sidebar.changePassword", default: "Change Password")}
                                    </g:link>
                                </li>
                            </ul>
                        </div><!--/.well -->
            </sec:ifAllGranted>
        </div><!--/md-col-->

        <div class="col-md-10">

            <g:layoutBody/>

        </div>
    </div>

</div><!-- /.container -->

<script type="text/javascript" src="${resource(dir: "bootstrap/js", file: "bootstrap.min.js")}"></script>
<script type="text/javascript"
        src="${resource(dir: "datatables-bootstrap", file: "dataTables.bootstrap.js")}"></script>
<r:layoutResources/>
</body>
</html>
