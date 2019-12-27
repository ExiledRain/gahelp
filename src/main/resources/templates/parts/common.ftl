<#macro page pagename service>
    <html lang="en" xmlns="http://www.w3.org/1999/html">
    <head>
        <title>${pagename}</title>
        <#--        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>-->
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
              integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
              crossorigin="anonymous">
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
                integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
                integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
                crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../main_style.css" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
    </head>
    <script>
        var service = 'http://localhost:8080/${service}'

        var RestGetAll = function () {
            $.ajax({
                type: 'GET',
                url: service + '/all',
                dataType: 'json',
                accept: 'json',
                contentType: 'application/json;utf-8',
                async: false,
                success: function (result) {
                    $('#response').html(JSON.stringify(result))
                },
                error: function (jqXHR, testStatus, errorThrown) {
                    $('#response').html(JSON.stringify(jqXHR))
                }

            });
        };

        var RestGet = function (id) {
            $.ajax({
                type: 'GET',
                url: service + '/get/' + id,
                dataType: 'json',
                accept: 'json',
                contentType: 'application/json;utf-8',
                async: false,
                success: function (result) {
                    $('#response').html(JSON.stringify(result))
                },
                error: function (jqXHR, testStatus, errorThrown) {
                    $('#response').html(JSON.stringify(jqXHR))
                }

            });
        };

        var RestPost = function (name, description) {
            var JSONObject = {
                'name': name,
                'description': description
            };

            $.ajax({
                type: 'POST',
                url: service + '/add',
                dataType: 'json',
                data: JSON.stringify(JSONObject),
                accept: 'json',
                contentType: 'application/json;utf-8',
                async: false,
                success: function (result) {
                    $('#response').html(JSON.stringify(result))
                },
                error: function (jqXHR, testStatus, errorThrown) {
                    $('#response').html(JSON.stringify(jqXHR))
                }

            });
        };

        var RestPut = function (id, name, description) {
            var JSONObject = {
                'id': id,
                'name': name,
                'description': description
            };

            $.ajax({
                type: 'PUT',
                url: service + '/update',
                dataType: 'json',
                data: JSON.stringify(JSONObject),
                accept: 'json',
                contentType: 'application/json;utf-8',
                async: false,
                success: function (result) {
                    $('#response').html(JSON.stringify(result))
                },
                error: function (jqXHR, testStatus, errorThrown) {
                    $('#response').html(JSON.stringify(jqXHR))
                }

            });
        };

    </script>
    <body>
    <#include "navbar.ftl">

    <#nested>

<#--    <div class="card-footer text-center text-muted">-->
<#--        <span style="text-align: center"><- Ga Help -></span>-->
<#--    </div>-->
    </body>
    </html>
</#macro>