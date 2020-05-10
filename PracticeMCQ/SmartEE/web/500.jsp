<%-- 
    Document   : 404.jsp
    Created on : 2019 , UTF-8 
    Author     : User

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PracticeMCQ</title>
    </head>

    <style>
        @import url('https://fonts.googleapis.com/css?family=Roboto+Mono:300,500');

        html, body {
            width: 100%;
            height: 100%;
        }

        body {
            background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/257418/andy-holmes-698828-unsplash.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            min-height: 100vh;
            min-width: 100vw;
            font-family: "Roboto Mono", "Liberation Mono", Consolas, monospace;
            color: rgba(255,255,255,.87);
        }

        .mx-auto {
            margin-left: auto;
            margin-right: auto;
        }

        .container,
        .container > .row,
        .container > .row > div {
            height: 100%;
        }

        #countUp {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100%;

            .number {
                font-size: 4rem;
                font-weight: 500;

                + .text {
                    margin: 0 0 1rem;
                }
            }

            .text {
                font-weight: 300;
                text-align: center;
            }
        }
    </style>

    <body>
        <div class="container">
            <div class="row">
                <div class="xs-12 md-6 mx-auto">
                    <div id="countUp">
                        <div class="number" data-count="500">500</div>
                        <div class="text">Internal Sever Error</div>
                    </div>
                </div>
            </div>
        </div>            
        

    </body>
</html>
