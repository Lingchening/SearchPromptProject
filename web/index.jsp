<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2017/8/6
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索框提示</title>
    <script type="text/javascript">

        var xmlHttp;
        function getContent() {
            var content = document.getElementById("keyword");
            if (content.value == "") {
                clearContent();
                return;
            }
            xmlHttp = createXMLHttp();

            var url = "search?keyword=" + content.value;
            xmlHttp.open("GET", url, true);
            xmlHttp.onreadystatechange = callback;
            xmlHttp.send(null);
        }

        function createXMLHttp() {
            var xmlHttp;
            if (window.XMLHttpRequest) {
                xmlHttp = new XMLHttpRequest();
            }

            if (window.ActiveXObject) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                if (!xmlHttp) {
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
            }
            return xmlHttp;
        }

        function callback() {
            if (xmlHttp.readyState == 4) {
                if (xmlHttp.status == 200) {
                    var result = xmlHttp.responseText;
                    var json = eval("(" + result + ")");
                    setContent(json);
                }
            }
        }

        function setContent(contents) {
            clearContent();
            var size = contents.length;
            for (var i = 0; i < size; i++) {
                var nextNode = contents[i];
                var tr = document.createElement("tr");
                var td = document.createElement("td");
                td.setAttribute("border", "0");
                td.setAttribute("bgcolor", "#FFFAFA");
                td.onmouseover = function () {
                    this.className = 'mouseOver';
                };
                td.onmouseout = function () {
                    this.className = 'mouseOut';
                }
                td.onclick=function () {
                    
                }
                var text =document.createElement(nextNode);
                td.appendChild(text);
                tr.appendChild(td);
                document.getElementById(tr);
            }
        }
        
        function clearContent() {
            var content = document.getElementById("content_table_body");
            var size = content.childNodes.length;
            for(var i= size-1;i>=0;i--){
                content.removeChild(content.childNodes[i]);
            }
        }

        function keywordBlur() {
            clearContent();
        }
    </script>
    <style type="text/css">
        #myDiv{
            text-align: center;
        }
    </style>
</head>
<body>
<div id="myDiv">
    <%--输入框--%>
    <input type="text" maxlength="50" id="keyword" onkeyup="getContent()" onblur="keywordBlur()"
    onfocus="getContent()">
    <input type="button" value="百度一下" width="50px"/>

    <div id="popDiv">
        <table id="content_table" border="0" cellpadding="0" bgcolor="#f5f5dc">
            <tbody id="content_table_body">
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
