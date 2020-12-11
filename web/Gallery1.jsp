<%-- 
    Document   : HomePage
    Created on : Mar 13, 2020, 8:25:40 AM
    Author     : DonOzOn
--%>
<%@page import="entity.Image"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/home.css" rel="stylesheet" type="text/css">
        <script src="resource/main.js"></script>
        <title>My Front Page</title>
    </head>
    <body>

        <div class="container">
            <jsp:include page="Header.jsp"/>
            <div class="main">
                <div class="left">
                    <div class="about">
                        <h3>${galery.name}</h3>
                    </div>
                    <c:if test="${error != null}">
                        <h3 style="margin-bottom: 600px"> ${error}</h3>
                    </c:if>
                    <c:if test="${error == null}">
                        <c:if test="${top1Galery.image_url != null && totalRecord > 0 }">
                            <div class="imageGaler">
                                <img id ="img" onclick="changeImage()" src="images/${top1Galery.image_url}" alt="First">
                            </div>
                        </c:if>

                        <div class="contentGalery">

                            <c:if test="${error == null}">
                                <%--<c:if test="${index > maxPage || index < 0}">--%>
                                <!--<h3> Not found this page!!!</h3>-->
                                <%--</c:if>--%>
                                <ul >

                                    <c:if test="${index <= maxPage}">
                                        <c:forEach items="${listImage}" var="i" varStatus="loop">
                                            <li class="span4">
                                                <a href="GaLeryServlet?index=${index}&galeryID=${galeryID}&imgID=${i.id}"><img src="images/${i.image_url}"></a>
                                            </li>
                                        </c:forEach>

                                    </c:if>
                                </ul>

                            </c:if>    
                            <div class="paging">
                                <c:if test="${maxPage > 1}">
                                    <c:forEach begin="1" end="${maxPage}" var="i">
                                        <a class="${i==index?"active":""}" href="GaLeryServlet?index=${i}&galeryID=${galeryID}">${i}</a>
                                        <c:set var="index" value="${index}" />
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </c:if>

                </div>
                <div class="right">
                    <jsp:include page="Right.jsp"/>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"/>
        <c:out value="${listImage.toString()}"></c:out>

            <script>
                var index = 0;
                var n = ${listImage.size()}
                var map = new Map();

                var changeImage = function () {

                    var myList = "${IMG}";
                    var list = myList.split(",");
                    list[0] = list[0].slice(1);
                    var lastElem = list[list.length - 1];
                    list[list.length - 1] = lastElem.slice(0, lastElem.length - 1);
                    for (var i = 0; i < list.length; i++) {
                        if (list[i] instanceof String) {
                            list[i] = list[i].trim();
                        }
                    }
                    document.getElementById('img').src = list[index];
                    index++;
                    if (index === list.length) {
                        index = 0;
                    }
                };
                setInterval(changeImage, 1000);
        </script>
    </body>
</html>
