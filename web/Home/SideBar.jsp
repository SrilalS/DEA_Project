<%@ page import="com.apex.Shop" %>
<%@ page import="com.apex.ShopReg" %>
<%@ page import="com.apex.shopadmin.Item" %>
<%@ page import="com.apex.shopadmin.ItemReg" %>
<jsp:include page="../HEAD.jsp"/>
<div class="col justify-content-center text-center">
    <br>
    <br>
    <%
        ShopReg shopReg = new ShopReg();
        ItemReg itemReg = new ItemReg();
        String Email = response.getHeader("Email");
        Shop shop;
        Item item;

        boolean init = false;

        %>
    <%if (Email != null){ %>
    <%
        shop = shopReg.GetShop(response.getHeader("Email"));
        item = itemReg.getItem("81aac382-a035-4ba9-9645-c79cde910bc9");

        init = true;
    %>

    <div>
        <H3><%=shop.ShopName%></H3>
    </div>
    <div>
        <H3><%=shop.Telephone%></H3>
    </div>
    <div>
        <H3><%=shop.Address%></H3>
    </div>

    <div id="Featured">
        <div class="card-body card shadow">
            <h3>Featured Food </h3>
            <img class="img-fluid" src="data:image/png;base64,<%=item.Base64Photo%>">
        </div>
    <div>
        <br>
        <button class="btn btn-success">View Shop</button>
    </div>

    <%} else {%>
    <div>
        <H3>Select a Shop from the Map</H3>
    </div>
    <%}%>
    <form hidden id="SidebarForm" method="post" action="${pageContext.request.contextPath}/Sidebar">
        <input id="Email" type="email" name="Email">
        <input type="submit">
    </form>
</div>