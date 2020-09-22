<%@ page import="com.apex.Shop" %>
<%@ page import="com.apex.ShopReg" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>FoodHut</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCmdBitVJ_GHfkHjQYz8yo0-jk8HI16-5g&callback=initMap&libraries=&v=weekly"
            defer
    ></script>


    <jsp:include page="../HEAD.jsp"/>


</head>
<body>
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <jsp:include page="NAVBTN/MainNav.jsp"/>
            <div class="col">
                <div class="row">
                    <div class="shadow" style="height: 90vh;width: 80%" id="map"></div>
                    <div  class="col">
                        <iframe id="Sidebar" style="height: 85vh; width: 15vw"  frameborder="false" src="${pageContext.request.contextPath}/Sidebar"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    "use strict";

    let map;

    function initMap() {
        const MapLoc = {lat: 6.841217, lng: 80.003178};
        const iframe = document.getElementById("Sidebar");

        const map = new google.maps.Map(document.getElementById("map"), {
            center: MapLoc,
            zoom: 14,
        });

        <%
        ShopReg shopReg = new ShopReg();
        List<Shop> shops =  shopReg.GetAllShops();
        %>

        <% for (Shop shop : shops){ %>


        const <%=shop.ShopName%> =
        {
            lat: <%=shop.ShopLat%>,
            lng: <%=shop.ShopLang%>}
        ;

        const <%=shop.ShopName%>Info = '<div id="content">' +
            '<div id="siteNotice">' +
            '</div>' +
            '<h1 id="firstHeading" class="firstHeading"><%=shop.ShopName%></h1>' +
            '<div id="bodyContent">' +
            '<p>Shop Name: <%=shop.ShopName%>,<br>Address: <%=shop.ShopAddress%>,<br>Telephone: <%=shop.Telephone%></p>' +
            '</div>' +
            '</div>';

        var <%=shop.ShopName%>infoWindow = new google.maps.InfoWindow({
            content: <%=shop.ShopName%>Info
        });

        var <%=shop.ShopName%>Marker = new google.maps.Marker({
            position: <%=shop.ShopName%>,
            map,
            title: "<%=shop.ShopName%>",
            //label: "<%=shop.ShopName%>",
            label: { color: '#000000', fontWeight: 'bold', fontSize: '14px', text: '<%=shop.ShopName%>' }
        });

        <%=shop.ShopName%>Marker.addListener('click', function () {
            <%=shop.ShopName%>infoWindow.open(map, <%=shop.ShopName%>Marker);
            iframe.contentWindow.document.getElementById("Email").value = "<%=shop.Email%>";

            iframe.contentWindow.document.getElementById("SidebarForm").submit();
        });

        <% } %>


    }
</script>
</body>


</html>
