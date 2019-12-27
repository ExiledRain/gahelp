<#macro body type>
    <div style="border: 1px solid black">
        <h1>REST API</h1>

        <table class="table">
            <tr>
                <th>Request type</th>
                <th>URL</th>
                <th>Value</th>
            </tr>
            <tr>
                <td>Get all - <code><strong>GET</strong></code></td>
                <td>/${type}/all</td>
                <td>
                    <button type="button" onclick="RestGetAll()">try</button>
                </td>
            </tr>
            <tr>
                <td>Get ${type} by id - <code><strong>GET</strong></code></td>
                <td>/${type}/get/{id}</td>
                <td>
                    id: <input id="getHorseByID" value="1"/>
                    <button type="button" onclick="RestGet($('#getHorseByID').val())">try</button>
                </td>
            </tr>
            <tr>
                <td>Add new ${type} - <code><strong>POST</strong></code></td>
                <td>/${type}/add</td>
                <td>
                    name: <input id="horseName" value="Foo"/>
                    description: <input id="horseDescription" value="Bar"/>
                    <button type="button" onclick="RestPost($('#horseName').val(), $('#horseDescription').val())">try
                    </button>
                </td>
            </tr>
            <tr>
                <td>Update ${type} - <code><strong>PUT</strong></code></td>
                <td>/${type}/update</td>
                <td>
                    id: <input id="horseID" value=1>
                    name: <input id="horseNameForUpdate" value="Foo"/>
                    description: <input id="horseDescriptionForUpdate" value="Bar"/>
                    <button type="button" onclick="RestPut($('#horseID').val(), $('#horseNameForUpdate').val(),
             $('#horseDescriptionForUpdate').val())">try
                    </button>
                </td>
            </tr>
        </table>

        <div class="panel panel-default">
            <div class="page-heading">
                <strong>RESPONSE</strong>
            </div>
            <div class="panel-body" style="border: 3px green double" id="response"></div>
        </div>
    </div>
</#macro>