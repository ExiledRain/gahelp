<#import "parts/common.ftl" as c>
<@c.page pagename="Horse Menu" service="horse">
    <style>
        table, th, td {
            border: 1px solid gray;
            margin: 5px;
            padding: 3px;
        }
    </style>
    <div style="border: 1px solid gray;vertical-align: center; margin: 30px">
    <div id="app" style="vertical-align: center">
        <#--        {{ horse }}-->
    </div>

    <script src="js/horse.js"></script>
    </div>
</@c.page>