<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>

    <div class="row">
        <div class="col-md-12">

            <div id="carousel-example-generic" class="carousel slide" data-interval="3000" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img alt="First slide" src="./images/1.png">
                    </div>
                    <div class="item">
                        <img alt="Second slide" src="./images/2.png">
                    </div>
                    <div class="item">
                        <img alt="Third slide" src="./images/1.png">
                    </div>
                </div>


                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
            </div> <!-- Carousel -->

        </hr>
        </div>
    </div>


    <div class="row">
        <div class="col-md-4">
            <img src="./images/alms-small.png"/>
            <h4>alms</h4>
            <p><g:link controller="broker" action="list"><g:message code="broker.list" default="Broker List"></g:message></g:link></p>
        </div>

        <div class="col-md-4">
            <img src="./images/alms-small.png"/>
            <h4>Person</h4>
            <p><g:link controller="person" action="list"><g:message code="person.list" default="Person List"></g:message> </g:link> </p>
        </div>

        <div class="col-md-4">
            <img src="./images/alms-small.png"/>
            <h4>Learning mns system</h4>
            <p>test</p>
        </div>

    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="panel-footer">
                <h4>Note</h4>
                <div class="row">
                    <div class="col-md-9">
                        <p>test</p>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="btn btn-primary active">Contact Us</a>
                    </div>
                </div>
            </div>
        </div>
    </div>


    </body>
</html>
