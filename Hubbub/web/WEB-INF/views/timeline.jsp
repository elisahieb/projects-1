<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Bub&trade; Timeline</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <div id="navbar" class="w3-bar" style="background-color:#92C4BE">
            <a class="w3-bar-item w3-button" href="main?action=post">Add a Blurb&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=logout">Log Me Out</a>
        </div>
        <div class="w3-container">
            <%@include file="/WEB-INF/jspf/masthead.jspf"%>
            <h1>Welcome to Hubbub&trade;, ${user}</h1>
            <div class="w3-container">
                <h1>Add yer Blurb&trade;</h1>
                <c:if test="${not empty flash}">
                    <h2 class="flash">${flash}</h2>
                </c:if>
                <form class="w3-container w3-card-4 w3-margin" method="POST" action="main">
                    <input type="hidden" name="action" value="post"/>
                    <p>
                        <textarea id="content" style="max-width:90%; max-height:90%"
                              rows="3" cols="60"
                              onkeyup="charcountupdate(this.value)"
                              name="content">${param.content}</textarea><br/>
                        <label for="content">
                            Characters: <span id="charcount"></span> left
                        </label>
                    </p>
                    <p>
                        <button class="w3-button w3-section w3-ripple"
                            style="background-color:#92C4BE">
                            Disseminate Wisdom
                        </button>
                    </p>
                </form>
            </div>
            <div class="w3-container w3-margin">
                <p>Here's all our Bub&trade;s' Blurb&trade;s.</p>
                <c:forEach var="post" items="${posts}">
                    <%@include file="/WEB-INF/jspf/guestpost.jspf"%>
                </c:forEach>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        document.getElementById("content").focus();
        function charcountupdate(str) {
            var lng = str.length;
            document.getElementById("charcount").innerHTML = 140 - lng;
        }
        charcountupdate("");
    </script>
</html>

